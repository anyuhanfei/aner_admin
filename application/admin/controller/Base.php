<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;

class Base extends Controller{
    protected $page_number = 20;

    public function _initialize(){
        if(!Session::has('admin')){
            $this->redirect('Login/login');
            return;
        }
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