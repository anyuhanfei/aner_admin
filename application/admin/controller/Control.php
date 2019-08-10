<?php
namespace app\admin\controller;

use think\Controller;

use app\admin\model\LogAdminOperation;


class Control extends Controller{
    protected $version = '2.0.0';
    //调试模式，true开false关
    protected $debug = false;
    //管理员异常登录的最大次数
    protected $admin_error_login_maximum = 10;
    //管理员异常登录后的冻结时间
    protected $admin_freeze_time = 86400;
    //列表分页每页数据量
    protected $page_number = 20;

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