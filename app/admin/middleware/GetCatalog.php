<?php
namespace app\admin\middleware;

use think\facade\Request;
use think\facade\View;
use think\facade\Cookie;
use think\facade\Env;
use think\facade\Session;

use app\admin\model\SysCatalog;
use app\admin\model\SysModuleAction;
use app\admin\model\AdmRole;
use app\admin\model\AdmAdmin;


class GetCatalog{
    public function handle($request, \Closure $next){
        //后台目录高亮
        $controller = Request::instance()->controller();
        $action = Request::instance()->action();
        $current_url = strtolower($controller . '/' . $action);

        //当前管理员
        $admin_id = Session::get('admin_id');
        $admin = AdmAdmin::find($admin_id);

        //权限控制
        if(Env::get('ANER_ADMIN.ADMIN_POWER_ONOFF') == true){
            if($controller != 'Index'){ // 首页不限制
                if($admin->role_id == 0){
                    return redirect('/admin/login');
                }
                if(Env::get('ANER_ADMIN.DEVELOPER_MODEL') == true && $controller == 'System' && $admin->role_id == 1){ //后台管理系统调试模式开启, 不检测系统模块
                    return $next($request);
                }
                $current_url_id = SysModuleAction::where('path', $current_url)->value('action_id');
                if(!$current_url_id){
                    return redirect('/admin');
                }
                $role = AdmRole::where('role_id', $admin->role_id)->find();
                if(!$role){
                    return redirect('/admin/login');
                }
                if(strpos($role->power, (string)$current_url_id) === false){
                    return redirect('/admin');
                }
            }
        }
        return $next($request);
    }
}