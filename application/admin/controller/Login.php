<?php
namespace app\admin\controller;

use think\Controller;
use think\Cookie;
use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\SysAdmin;

class Login extends Controller{
    public function index(){
        $this->redirect('Login/login');
    }

    /**
     * 登录页面
     *
     * @return void
     */
    public function login(){
        return $this->fetch('Login/login');
    }
    
    public function login_submit(){
        $data = Request::instance()->param();
        $validata = Loader::validate("AdminLogin");
        if(!$validata->check($data)){
            return json_data(2, '', $validata->getError());
        }
        $admin = SysAdmin::login_validata($data['account'], $data['password']);
        if(!$admin){
            return json_data(2, '', '账号或密码不存在！');
        }
        Session::set('admin', $admin);
        return json_data(1, '', '登录成功！');
        
    }
}