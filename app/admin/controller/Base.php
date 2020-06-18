<?php
namespace app\admin\controller;

use think\facade\Env;
use think\facade\Session;
use think\facade\View;


class Base{
    public function __construct(){
        $this->version = Env::get('ANER_ADMIN.VERSION');
        //调试模式
        $this->developer_model = boolval(Env::get('ANER_ADMIN.DEVELOPER_MODEL'));
        //管理员权限开关
        $this->admin_power_onoff = boolval(Env::get('ANER_ADMIN.ADMIN_POWER_ONOFF'));
        //管理员异常登录的最大次数
        $this->admin_error_login_maximum = Env::get('ANER_ADMIN.ADMIN_ERROR_LOGIN_MAXIMUM');
        //管理员异常登录后的冻结时间
        $this->admin_freeze_time = Env::get('ANER_ADMIN.ADMIN_FREEZE_TIME');
        //列表分页每页数据量
        $this->page_number = Env::get('ANER_ADMIN.PAGE_DATA_NUMBER');

        /*cms*/
        //标签图片上传开关
        $this->cms_tag_image_onoff = boolval(Env::get('ANER_ADMIN.CMS_TAG_IMAGE_ONOFF'));
        //分类图片上传开关
        $this->cms_category_image_onoff = boolval(Env::get('ANER_ADMIN.CMS_CATRGORY_IMAGE_ONOFF'));
        //文章字段控制
        $this->cms_article = [
            'tag_ids'=> boolval(Env::get('ANER_ADMIN.CMS_TAG_IDS_ONOFF')),  //文章标签
            'author'=> boolval(Env::get('ANER_ADMIN.CMS_AUTHOR_ONOFF')),  //作者
            'intro'=> boolval(Env::get('ANER_ADMIN.CMS_INTRO_ONOFF')),  //简介
            'keyword'=> boolval(Env::get('ANER_ADMIN.CMS_KEYWORD_ONOFF')),  //关键字
            'image'=> boolval(Env::get('ANER_ADMIN.CMS_IMAGE_ONOFF')),  //图片
            'content_type'=> boolval(Env::get('ANER_ADMIN.CMS_CONTENT_TYPE_ONOFF')),  //文章格式
            'stick'=> boolval(Env::get('ANER_ADMIN.CMS_STICK_ONOFF')),  //置顶
            'hot'=> boolval(Env::get('ANER_ADMIN.CMS_HOT_ONOFF')),  //热门
            'recomment'=> boolval(Env::get('ANER_ADMIN.CMS_RECOMMENT_ONOFF')),  //推荐
        ];

        /*会员*/
        //会员标识，用于会员与其他表之间的关联标识（user_id是计算机识别的关联标识，此设置为会员识别的关联标识）
        $this->user_identity = Env::get('ANER_ADMIN.USER_IDENTITY');
        //会员唯一标识说明
        $this->user_identity_text = Env::get('ANER_ADMIN.USER_IDENTITY_TEXT');
        //会员资金种类，key为资金类型说明，value为字段名
        $this->user_fund_type = $this->env_array('USER_FUND_TYPE');
        //会员删除操作的开关
        $this->user_delete_onoff = boolval(Env::get('ANER_ADMIN.USER_DELETE_ONOFF'));
    }

    /**
     * 处理 env 文件中的类似数组的配置
     *
     * @param [type] $name 配置名称
     * @return void
     */
    public function env_array($name){
        $set_str =  Env::get('ANER_ADMIN.' . $name);
        $temp = explode(', ', $set_str);
        $res_array = [];
        foreach($temp as $v){
            $temp_v = explode('=> ', $v);
            $res_array[$temp_v[0]] = $temp_v[1];
        }
        return $res_array;
    }

    /**
     * 多数据渲染
     *
     * @param array $assign_array
     * @return void
     */
    public function many_assign($assign_array = array()){
        foreach($assign_array as $k => $v){
            View::assign($k, $v);
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
    protected function remove_content_image($content, $type="cookie", $remark = ''){
        $editor_images_array = $this->get_editor_images($content);
        if(empty($editor_images_array)){
            return array();
        }
        if($type == 'cookie'){
            assert($remark != ''); //无数据回滚
            $content_images = Session::get($remark) ? Session::get($remark) : array();
            Session::set($remark, array_diff($content_images, $editor_images_array));
        }elseif($type == 'delete'){
            foreach($editor_images_array as $v){
                delete_image($v);
            }
        }elseif($type == 'update'){
            $old_return_array = $this->get_editor_images($remark);
            if($old_return_array){
                return $editor_images_array;
            }
            $delete_images = array_diff($old_return_array, $editor_images_array);
            foreach($delete_images as $v){
                delete_image($v);
            }
        }
        return $editor_images_array;
    }

    /**
     * 富文本编辑器图片上传
     *
     * @param object $image 要上传的文件
     * @param string $folder_path 文件上传文件夹名称
     * @param string $cookie_name 保存cookie名称
     * @return string 图片完整路径
     */
    protected function content_image_upload($image, $folder_path, $cookie_name){
        $image_res = file_upload($image, $folder_path);
        $path = $image_res['file_path'];
        if(!Session::has($cookie_name)){
            Session::set($cookie_name, []);
        }
        $cookie_images = Session::get($cookie_name);
        array_push($cookie_images, $path);
        Session::set($cookie_name, $cookie_images);
        return 'http://' . $_SERVER['HTTP_HOST'] . $path;
    }

    /**
     * 获取富文本编辑器中的图片
     *
     * @param [type] $content
     * @return void
     */
    public function get_editor_images($content){
        $rule = "{<img src=\"http://" . $_SERVER['HTTP_HOST'] . "}";
        $rule_two = "/\">/";
        $res = preg_split($rule, $content);
        $return_array = array();
        foreach($res as $v){
            $res_v = preg_split($rule_two, $v);
            array_push($return_array, $res_v[0]);
        }
        return $return_array;
    }
}