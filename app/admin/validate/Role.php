<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\AdmRole;


class Role extends Validate{
    protected $role = [
        'role_id'=> 'require',
        'role_name'=> 'require|checkNameRole',
        'remark'=> 'checkData',
    ];

    protected $message = [
        'role_name.require'=> '请填写角色名称',
        'role_id.require'=> '非法操作',
    ];

    protected $scene = [
        'add'=> [
            'role_name'=> 'require|checkNameRole',
        ],
        'update'=> [
            'role_id',
            'role_name'=> 'require',
            'remark',
            'sort'
        ]
    ];

    protected function checkNameRole($value, $role, $data){
        $res = AdmRole::where('role_name', $value)->find();
        if($res){
            return "此角色名称已存在";
        }
        return true;
    }

    protected function checkData($value, $role, $data){
        $role = AdmRole::get($data['role_id']);
        if(!$role){
            return "非法操作";
        }
        if($data['title'] == $role->role_name && $data['remark'] == $role->remark && $data['sort'] == $role->sort){
            return "未修改任何信息，请勿提交";
        }
        return true;
    }
}