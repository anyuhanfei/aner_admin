<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\AdmAdmin;
use app\admin\model\AdmAdminLogin;
use app\admin\model\AdmFreezeIp;
use app\admin\model\LogAdminOperation;


class Login extends Control{
    /**
     * 登录
     *
     * @return void
     */
    public function login(){
        return $this->fetch();
    }

    /**
     * 登录提交
     *
     * @return void
     */
    public function login_submit(){
        $ip = get_ip();
        $freeze_ip = AdmFreezeIp::where('ip', $ip)->where('freeze_end_time', '> time', time())->find();
        if($freeze_ip){
            return return_data(2, '', '账号或密码错误...', 'json');
        }
        $account = Request::instance()->param('account', '');
        $password = Request::instance()->param('password', '');
        $validate = Loader::validate('login');
        if(!$validate->check(['account'=> $account, 'password'=> $password])){
            $this->update_admin_login($ip, 'error');
            LogAdminOperation::create_data('登录失败：'.$validate->getError(), 'login');
            return return_data(2, '', $validate->getError(), 'json');
        }
        $log_login = AdmAdminLogin::where('ip', $ip)->find();
        $this->update_admin_login($ip, 'success');
        LogAdminOperation::create_data('登录成功，账号：'.$account, 'login');
        return return_data(1, '', '登录成功', 'json');
    }

    public function login_out(){
        Session::delete('admin_id');
        return $this->redirect('login/login');
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
                if($log_login->error_number + 1 >= $this->admin_error_login_maximum){
                    //封号
                    $this->freeze_ip($ip);
                    $log_login->error_number = 0;
                }else{
                    $log_login->error_number += 1;
                }
                $log_login->insert_time  = date("Y-m-d H:i:s", time());
                $log_login->save();
            }else{
                AdmAdminLogin::create([
                    'ip'=> $ip,
                    'error_number'=> 1,
                    'insert_time'=> date("Y-m-d H:i:s", time())
                ]);
            }
        }elseif($type == 'success'){
            if($log_login){
                $log_login->error_number = 0;
                $log_login->insert_time  = date("Y-m-d H:i:s", time());
                $log_login->save();
            }
        }
    }

    /**
     * 封ip
     *
     * @param [type] $ip
     * @return void
     */
    protected function freeze_ip($ip){
        AdmFreezeIp::create([
            'ip'=> $ip,
            'freeze_start_time'=> date("Y-m-d H:i:s", time()),
            'freeze_end_time'=> date("Y-m-d H:i:s", time() + $this->admin_freeze_time)
        ]);
    }
}