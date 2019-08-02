<?php
namespace app\admin\validate;

use think\Validate;

class ModuleAction extends Validate{
    protected $rule = [
        'module_id' => 'require',
        'action_name' => 'require',
        'action_url' => 'require',
        'sort' => 'require|min:0',
    ];

    protected $message = [
        'module_id.require' => '所属模块必须选择！',
        'action_name.require' => '方法名称必须填写！',
        'action_url.require' => '方法路径必须填写！',
        'sort.require' => '排序必须填写！',
        'sort.min' => '排序必须大于0',
    ];
}