<?php
namespace app\admin\controller;

use think\facade\View;
use think\facade\Session;
use think\facade\Request;
use think\facade\Cookie;

use app\admin\model\SysCatalog;
use app\admin\model\AdmAdmin;
use app\admin\model\AdmRole;
use app\admin\model\SysModuleAction;

use app\admin\controller\Base;

class Admin extends Base{
    protected $admin = null;

    public function __construct(){
        //引用父类初始化方法
        parent::__construct();
        //系统设置
        View::assign('debug', $this->debug);
        //后台目录
        $catalog = SysCatalog::order('sort asc')->select();
        View::assign('adm_catalog', $catalog);
        //后台目录高亮
        $controller = Request::instance()->controller();
        $action = Request::instance()->action();
        $current_url = strtolower($controller . '/' . $action);
        $current = SysCatalog::where('path', $current_url)->find();
        if($current){
            Cookie::set('current_id', $current->catalog_id);
        }
        View::assign('current_id', Cookie::get('current_id'));
        //管理员
        $admin_id = Session::get('admin_id');
        $this->admin = AdmAdmin::find($admin_id);
        if(!$this->admin){
            return redirect('/adm/login');
        }
        View::assign('admin', $this->admin);
        //权限控制
        if($this->admin_power_onoff == 'on'){
            if($action != 'index'){
                if($this->admin->role_id == 0){
                    return redirect('/admin/login');
                }
                $current_url_id = SysModuleAction::where('path', $current_url)->value('action_id');
                if(!$current_url_id){
                    return redirect('/admin');
                }
                $role = AdmRole::where('role_id', $this->admin->role_id)->find();
                if(!$role){
                    return redirect('/admin/login');
                }
                if(strpos($role->power, (string)$current_url_id) === false){
                    return redirect('/admin');
                }
            }
        }
    }
}