<?php
namespace app\admin\controller;

use think\facade\View;
use think\facade\Request;
use think\facade\Session;

use app\admin\controller\Base;

use app\admin\model\AdmFreezeIp;
use app\admin\model\LogAdminOperation;
use app\admin\model\AdmAdminLogin;


class Login extends Base{
    protected $middleware = [
        \app\admin\middleware\LogLogin::class
    ];
    /**
     * 登录页面
     *
     * @return void
     */
    public function login(){
        return View::fetch();
    }

    /**
     * 登录操作
     *
     * @return void
     */
    public function login_submit(){
        $ip = get_ip();
        $freeze_ip = AdmFreezeIp::where('ip', $ip)->where('freeze_end_time', '> time', time())->find();
        if($freeze_ip){
            return return_data(2, '', '此账号已被冻结');
        }
        $account = Request::instance()->param('account', '');
        $password = Request::instance()->param('password', '');
        $validate = new  \app\admin\validate\Login;
        if(!$validate->check(['account'=> $account, 'password'=> $password])){
            $this->update_admin_login($ip, 'error');
            return return_data(2, '', $validate->getError(), '登录失败：' . $account . '-' . $password);
        }
        $this->update_admin_login($ip, 'success');
        return return_data(1, '', '登录成功', '登录成功，账号：'.$account);
    }

    public function login_out(){
        Session::delete('admin_id');
        return redirect('/admin/login');
    }

    /**
     * 更新管理员登录统计
     *
     * @param [type] $ip
     * @param string $type
     * @return void
     */
    protected function update_admin_login($ip, $type = 'error'){
        $log_login = AdmAdminLogin::where('ip', $ip)->find();
        if($type == 'error'){
            if($log_login){
                if($log_login->error_number + 1 >= $this->admin_error_login_maximum){ //封号
                    AdmFreezeIp::create_data($ip, $this->admin_freeze_time);
                    $log_login->error_number = 0;
                }else{
                    $log_login->error_number += 1;
                }
                $log_login->insert_time  = date("Y-m-d H:i:s", time());
                $log_login->save();
            }else{
                AdmAdminLogin::create_data($ip);
            }
        }elseif($type == 'success'){
            if($log_login){
                $log_login->error_number = 0;
                $log_login->insert_time  = date("Y-m-d H:i:s", time());
                $log_login->save();
            }
        }
    }
}