<?php
namespace app\admin\validate;

use think\Validate;

class SysAd extends Validate{
    protected $rule = [
        'id' => 'require',
        'title' => 'require',
        'sign' => 'require',
    ];
    protected $message = [
        'id.require' => '系统错误！',
        'title.require' => '标题必须填写！',
        'sign.require' => '标签必须填写！',
    ];
    protected $scene = [
        'add' => [
            'title',
            'sign',
        ],
        'update' => [
            'id',
            'title',
            'sign',
        ]
    ];
}
