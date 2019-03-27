<?php
namespace app\admin\model;

use think\Model;

class SysAdmin extends Model{
    protected $table = 'sys_admin';

    public function role(){
        return $this->hasOne('sys_admin_role', 'role_id', 'role_id');
    }

    /**
     * 判断管理员登录账号密码
     *
     * @param [type] $account
     * @param [type] $password
     * @return void
     */
    public static function login_validata($account, $password){
        $res = self::field('admin_id, account, role_id, nickname')->where('account', $account)->where('password', md5($password))->find();
        return $res ? $res : false;
    }
}