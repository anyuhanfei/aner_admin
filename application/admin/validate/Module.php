<?php
namespace app\admin\validate;

use think\Validate;

class Module extends Validate{
    protected $rule = [
        'module_name' => 'require',
        'sort' => 'require|min:0',
    ];

    protected $message = [
        'module_name.require' => '模块名称必须填写！',
        'sort.require' => '排序必须填写！',
        'sort.min' => '排序必须大于0',
    ];
}