<?php
namespace app\index\middleware;

use think\facade\Session;

use app\admin\model\IdxUser;


class CheckIndex{
    public function handle($request, \Closure $next){
        //判断会员是否登录
        $user_id = Session::get('user_id');
        $user = IdxUser::find($user_id);
        if(!$user){
            return redirect('/index/login');
        }

        return $next($request);
    }
}