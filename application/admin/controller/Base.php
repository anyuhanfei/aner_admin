<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Cookie;

use app\admin\model\SysCatalog;
use app\admin\model\AdmAdmin;
use app\admin\model\AdmRole;
use app\admin\model\SysModuleAction;


class Base extends Control{
    public function _initialize(){
        //系统设置
        $this->assign('debug', $this->debug);
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
        //管理员
        $admin_id = Session::get('admin_id');
        $admin = AdmAdmin::get($admin_id);
        if(!$admin){
            return $this->redirect('login/login');
        }
        $this->assign('admin', $admin);
        //权限控制
        if($action != 'index'){
            if($admin->role_id == 0){
                return $this->redirect('login/login');
            }
            $current_url_id = SysModuleAction::where('path', $current_url)->value('action_id');
            if(!$current_url_id){
                return $this->redirect('index/index');
            }
            $role = AdmRole::where('role_id', $admin->role_id)->find();
            if(!$role){
                return $this->redirect('login/login');
            }
            if(strpos($role->power, (string)$current_url_id) === false){
                return $this->redirect('index/index');
            }
        }
    }
}