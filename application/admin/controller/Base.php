<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;

use app\admin\model\SysCatalogAdmin;
use app\admin\model\SysAdminRole;

class Base extends Controller{
    protected $page_number = 20;

    public function _initialize(){
        if(!Session::has('admin')){
            $this->redirect('Login/login');
            return;
        }
        $catalog_list = SysCatalogAdmin::order('sort asc')->select();
        $this->assign('catalog_list', $catalog_list);

        // $controller = Request::instance()->controller();
        // $action = Request::instance()->action();
        // $current_url = strtolower($controller . '/' . $action . ',');
        // if($action != 'index'){
        //     $admin = Session::get('admin');
        //     if($admin->role_id == 0){
        //         return $this->redirect('Login/login');
        //     }
        //     $role = SysAdminRole::where('role_id', $admin->role_id)->find();
        //     if(strpos($role->action_ids, $current_url) === false){
        //         return $this->redirect('index/index');
        //     }
        // }
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