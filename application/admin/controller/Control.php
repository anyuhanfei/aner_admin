<?php
namespace app\admin\controller;

use think\Controller;
use think\Cookie;

use app\admin\model\LogAdminOperation;


class Control extends Controller{
    protected $version = '2.0.9';
    //调试模式，true开false关
    protected $debug = true;
    //管理员异常登录的最大次数
    protected $admin_error_login_maximum = 10;
    //管理员异常登录后的冻结时间
    protected $admin_freeze_time = 86400;
    //列表分页每页数据量
    protected $page_number = 20;

    /*cms*/
    //标签图片上传开关
    protected $cms_tag_image_onoff = 'on';
    //分类图片上传开关
    protected $cms_category_image_onoff = 'on';
    //文章字段控制
    protected $cms_article = [
        'tag_ids'=> 'on',  //文章标签
        'author'=> 'on',  //作者
        'intro'=> 'on',  //简介
        'keyword'=> 'on',  //关键字
        'image'=> 'on',  //图片
        'content_type'=> 'on',  //内容类型
    ];

    /*会员*/
    //会员标识，用于会员与其他表之间的关联标识（user_id是计算机识别的关联标识，此设置为会员识别的关联标识）
    public $user_identity = 'phone';
    //会员唯一标识说明
    public $user_identity_text = '手机号';
    //会员资金种类，key为资金类型说明，value为字段名
    public $user_fund_type = ['余额'=> 'money'];
    //会员删除操作的开关
    protected $user_delete_onoff = 'on';

    public function _initialize(){

    }

    /**
     * 多数据渲染
     *
     * @param array $assign_array
     * @return void
     */
    public function many_assign($assign_array = array()){
        foreach($assign_array as $k => $v){
            $this->assign($k, $v);
        }
    }

    /**
     * 时间检索
     *
     * @param [type] $model 模型实例化对象
     * @param [type] $start_time 检索起始时间
     * @param [type] $end_time 检索结束时间
     * @return void
     */
    public function where_time($model, $start_time, $end_time){
        if($start_time != '' && $end_time == ''){
            $model->where('insert_time', '>= time', $start_time);
        }elseif($start_time == '' && $end_time != ''){
            $model->where('insert_time', '<= time', $start_time);
        }elseif($start_time != '' && $end_time != ''){
            $model->where('insert_time', 'between time', [$start_time, $end_time]);
        }
        return $model;
    }

    /**
     * 删除已添加的图片记录
     * cookie模式下remark参数代表保存编辑中图片路径的地址集cookie，
     *     对比文本中的图片和cookie保存的图片，如果相同则说明此图片已保存到数据库，则留在cookie中等待删除
     * delete模式下直接将文本中的图片删除
     * update模式下remark参数代表旧文本，对比新旧文本，将新文本中不存在的图片删除
     *
     * array_diff(array1, array2, ...) — 计算数组的差集，对比返回在 array1 中但是不在 array2 及后面参数数组中的值。
     *
     * @param string $content
     * @param string $type
     * @param string $remark
     * @return void
     */
    protected static function remove_content_image($content, $type="cookie", $remark = ''){
        $return_array = get_editor_images($content);
        if($type == 'cookie'){
            assert($remark != ''); //数据无回滚
            $content_images = Cookie::get($remark) ? Cookie::get($remark) : array();
            Cookie::set($remark, array_diff($content_images, $return_array));
        }elseif($type == 'delete'){
            if($return_array){
                foreach($return_array as $v){
                    delete_image($v);
                }
            }
        }elseif($type == 'update'){
            $old_return_array = get_editor_images($remark);
            $delete_images = array_diff($old_return_array, $return_array);
            foreach($delete_images as $v){
                delete_image($v);
            }
        }
        return $return_array;
    }

    /**
     * 富文本编辑器图片上传
     *
     * @param object $image 要上传的文件
     * @param string $folder_path 文件上传文件夹名称
     * @param string $cookie_name 保存cookie名称
     * @return string 图片完整路径
     */
    protected static function content_image_upload($image, $folder_path, $cookie_name){
        $image_res = file_upload($image, $folder_path);
        $path = $image_res['file_path'];
        if(!Cookie::has($cookie_name)){
            Cookie::set($cookie_name, []);
        }
        $cookie_images = Cookie::get($cookie_name);
        array_push($cookie_images, $path);
        Cookie::set($cookie_name, $cookie_images);
        return 'http://' . $_SERVER['HTTP_HOST'] . $path;
    }
}