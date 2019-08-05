<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Cookie;

use app\admin\model\SysSetup;
use app\admin\model\SysCatalog;


class Base extends Control{
    public function _initialize(){
        //系统设置
        $setup = SysSetup::find();
        $this->assign('setup', $setup);
        //后台目录
        $catalog = SysCatalog::order('sort asc')->select();
        $this->assign('adm_catalog', $catalog);
        //后台目录高亮
        $controller = Request::instance()->controller();
        $action = Request::instance()->action();
        $current_url = strtolower($controller . '/' . $action);
        $current = SysCatalog::where('path', $current_url)->find();
        if($current){
            Cookie::set('current_id', $current->catalog_id);
        }
        $this->assign('current_id', Cookie::get('current_id'));
    }
}