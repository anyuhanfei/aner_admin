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
        //管理员权限开关
        $admin_power_onoff = Env::get('ANER_ADMIN.ADMIN_POWER_ONOFF');

        //后台目录高亮
        $controller = Request::instance()->controller();
        $action = Request::instance()->action();
        $current_url = strtolower($controller . '/' . $action);

        //当前管理员
        $admin_id = Session::get('admin_id');
        $admin = AdmAdmin::find($admin_id);

        //权限控制
        if($admin_power_onoff == true){
            if($action != 'index'){
                if($admin->role_id == 0){
                    return redirect('/admin/login');
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