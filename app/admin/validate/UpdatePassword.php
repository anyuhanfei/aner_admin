<?php
namespace app\admin\validate;

use think\Validate;
use think\facade\Session;

use app\admin\model\IdxAdmin;
use app\admin\model\AdmAdmin;


class UpdatePassword extends Validate{
    protected $rule = [
        'old_password'=> 'require|checkOldPassword',
        'password'=> 'require|confirm:password_confirm|checkPassword',
        'password_confirm'=> 'require'
    ];

    protected $message = [
        'old_password.require'=> '请输入旧密码',
        'password.require'=> '请输入新密码',
        'password.confirm'=> '确认密码与新密码不一致',
        'password_confirm.require'=> '请输入确认密码'
    ];

    function checkOldPassword($value, $rule, $data){
        $admin_id = Session::get('admin_id');
        $admin = AdmAdmin::find($admin_id);
        if(md5($value . $admin->password_salt) != $admin->password){
            return "旧密码输入错误";
        }
        return true;
    }

    function checkPassword($value, $rule, $data){
        if($data['old_password'] == $value){
            return "新密码不能与旧密码相同";
        }
        return true;
    }
}