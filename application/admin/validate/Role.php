<?php
namespace app\admin\validate;

use think\Validate;

class Role extends Validate{
    protected $rule = [
        'role_id' => 'require',
        'role_name' => 'require',
    ];

    protected $message = [
        'role_id.require' => '系统错误！',
        'role_name.require' => '角色名称必须填写！',
    ];

    protected $scene = [
        'add' => [
            'role_name'
        ],
        'update' => [
            'role_name',
            'role_id',
        ],
        'power' => [
            'role_id'
        ]
    ];
}