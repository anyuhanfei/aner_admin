<?php
namespace app\admin\controller;

use think\Controller;

use app\admin\model\LogAdminOperation;


class Control extends Controller{
    protected $version = '2.0.5';
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
}