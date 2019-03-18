<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\SysAdmin;

class Admin extends Validate{
    protected $rule = [
        'admin_id' => 'require|gt:0|checkExistsAdminId',
        'role_id' => 'require',
        'nickname' => 'require|checkNotOldNickname',
        'account' => 'require|checkExistsAccount',
        'password' => 'require|checkNotOldPassword',
    ];

    protected $message = [
        'nickname.require' => '昵称必须填写！',
        'role_id.require' => '必须选择角色！',
        'account.require' => '账号必须填写！',
        'password.require' => '密码必须填写！',
    ];

    protected $scene =[
        // 添加
        'add' => [
            'nickname' => 'require',
            'account' => 'require',
            'password' => 'require',
            // 'role_id',
        ],
        // 修改昵称
        'update_nickname' => [
            'admin_id',
            'nickname',
        ],
        // 修改密码
        'update_password' => [
            'admin_id',
            'password',
        ]
    ];

    /**
     * 根据账号判断账号是否存在
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkExistsAccount($value, $rule, $data){
        $res = SysAdmin::where('account', $value)->find();
        return $res ? '此账号已存在，请重新填写！' : true;
    }

    /**
     * 根据id判断账号是否存在
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkExistsAdminId($value, $rule, $data){
        $res = SysAdmin::get($data['admin_id']);
        return $res ? true : '此账号不存在！';
    }

    /**
     * 判断修改新昵称是否与旧昵称相同
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkNotOldNickname($value, $rule, $data){
        $res = SysAdmin::get($data['admin_id']);
        return $res->nickname == $value ? '新昵称与当前昵称相同！' : true;
    }

    /**
     * 判断修改新密码是否与旧密码相同
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkNotOldPassword($value, $rule, $data){
        $res = SysAdmin::get($data['admin_id']);
        return $res->password == md5($value) ? '新密码与当前密码相同！' : true;
    }
}