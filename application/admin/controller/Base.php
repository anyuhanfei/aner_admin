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
}