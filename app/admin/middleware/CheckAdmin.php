<?php
namespace app\admin\middleware;

use think\facade\Session;

use app\admin\model\AdmAdmin;


class CheckAdmin{
    public function handle($request, \Closure $next){
        //判断管理员是否登录
        $admin_id = Session::get('admin_id');
        $admin = AdmAdmin::find($admin_id);
        if(!$admin){
            return redirect('/admin/login');
        }

        return $next($request);
    }
}