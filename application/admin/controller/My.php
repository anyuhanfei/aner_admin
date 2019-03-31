<?php
namespace app\admin\controller;

use think\Session;
use think\Request;

use app\admin\controller\Base;

use app\admin\model\SysAdmin;
use app\admin\model\LogAdminOperation;

class My extends Base{
    public function index(){
        return $this->redirect('My/profile');
    }

    public function profile(){
        if(!Session::has('admin')){
            return $this->redirect('Login/login');
        }
        $my = Session::get('admin');
        $this->assign('detail', $my);
        return $this->fetch('My/profile');
    }

    public function profile_submit(){
        $nickname = Request::instance()->param('nickname', '');
        $password = Request::instance()->param('password', '');
        if($nickname == '' && $password == ''){
            return json_data(2, '', '请修改信息后提交!');
        }
        $my = Session::get('admin');
        $detail = SysAdmin::get($my->admin_id);
        $detail->nickname = ($nickname != '') ? $nickname : $detail->nickname;
        $detail->password = ($password != '') ? md5($password) : $detail->password;
        $res = $detail->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了自己的资料');
            Session::set('admin', SysAdmin::login_validata($detail->account, $detail->password, true));
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }
}