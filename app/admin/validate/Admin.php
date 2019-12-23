<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\AdmAdmin;

class Admin extends Validate{
    protected $rule = [
        'admin_id'=>'checkAdminId',
        'account'=> 'require|checkAccout|checkUpdateAccount',
        'nickname'=> 'require|checkNickname|checkUpdateNickname',
        'password'=> 'require|confirm',
        'password_confirm'=> 'require'
    ];

    protected $message = [
        'account.require'=> '请填写账号',
        'nickname.require'=> '请填写昵称',
        'password.require'=> '请填写密码',
        'password.confirm'=> '密码与确认密码不相同',
        'password_confirm.require'=> '请填写确认密码',
    ];

    protected $scene = [
        'add'=> [
            'account'=> 'require|checkAccout',
            'nickname'=> 'require|checkNickname',
            'password'=> 'require|confirm',
            'password_confirm'=> 'require'
        ],
        'update'=> [
            'admin_id'=>'checkAdminId',
            'account'=> 'require|checkUpdateAccount',
            'nickname'=> 'require|checkUpdateNickname',
        ]
    ];

    public function checkAccout($value, $rule, $data){
        $admin = AdmAdmin::where('account', $value)->find();
        if($admin){
            return "此账号已被注册";
        }
        return true;
    }

    public function checkUpdateAccount($value, $rule, $data){
        $admin = AdmAdmin::where('account', $value)->find();
        if($admin){
            if($admin->admin_id != $data['admin_id']){
                return "此账号已被注册";
            }
        }
        return true;
    }

    public function checkNickname($value, $rule, $data){
        $admin = AdmAdmin::where('nickname', $value)->find();
        if($admin){
            return "此昵称已被注册";
        }
        return true;
    }

    public function checkUpdateNickname($value, $rule, $data){
        $admin = AdmAdmin::where('nickname', $value)->find();
        if($admin){
            if($admin->admin_id != $data['admin_id']){
                return "此账号已被注册";
            }
        }
        return true;
    }

    public function checkAdminId($value, $rule, $data){
        $admin = AdmAdmin::get($value);
        if(!$admin){
            return "非法操作";
        }
        return true;
    }
}