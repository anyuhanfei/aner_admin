<?php
namespace app\admin\validate;

use think\Validate;
use think\facade\Session;

use app\admin\model\AdmAdmin;


class Login extends Validate{
    protected $rule = [
        'account'=> 'require',
        'password'=> 'require|checkPassword',
    ];

    protected $message = [
        'account.require'=> '登录账号必须填写',
        'password.require'=> '登录密码必须填写'
    ];

    /**
     * 判断登录密码是否正确
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    public function checkPassword($value, $rule, $data){
        $admin = AdmAdmin::where('account', $data['account'])->find();
        if($admin){
            $post_password = md5($value . $admin->password_salt);
            if($post_password == $admin->password){
                Session::set('admin_id', $admin->admin_id);
                return true;
            }
        }
        return "账号或密码错误";
    }
}