<?php
namespace app\admin\validate;

use think\Validate;

class AdminLogin extends Validate{
    protected $rule = [
        'account'=> 'require',
        'password'=> 'require',
        'captcha'=> 'require|captcha',
    ];

    protected $message = [
        'account.require' => '请输入账号！',
        'password.require' => '请输入密码！',
        'captcha.require' => '请输入验证码！',
        'captcha.captcha' => '输入验证码错误！',
    ];
}