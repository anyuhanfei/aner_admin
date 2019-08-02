<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\AdmAdmin;


class Login extends Control{
    public function login(){
        return $this->fetch();
    }

    public function login_submit(){
        $account = Request::instance()->param('account', '');
        $password = Request::instance()->param('password', '');
        $validate = Loader::validate('login');
        if(!$validate->check(['account'=> $account, 'password'=> $password])){
            return json_data(2, '', $validate->getError(), 'json');
        }
        return json_data(1, '', '登录成功', 'json');
    }
}