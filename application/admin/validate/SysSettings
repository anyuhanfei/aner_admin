<?php
namespace app\admin\validate;

use think\Validate;

class SysSettings extends Validate{
    protected $rule = [
        'id' => 'require',
        'title' => 'require',
        'sign' => 'require',
        'value' => 'require',
    ];
    protected $message = [
        'id.require' => '系统错误！',
        'title.require' => '标题必须填写！',
        'sign.require' => '标签必须填写！',
        'value.require' => '标签值必须填写！',
    ];
    protected $scene = [
        'add' => [
            'title',
            'sign',
            'value',
        ],
        'update' => [
            'id',
            'title',
            'sign',
            'value',
        ]
    ];
}
