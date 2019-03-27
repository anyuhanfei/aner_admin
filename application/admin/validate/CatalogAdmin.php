<?php
namespace app\admin\validate;

use think\Validate;

class CatalogAdmin extends Validate{
    protected $rule = [
        'title' => 'require',
        'icon' => 'require',
    ];

    protected $message = [
        'title.require' => '请填写标题！',
        'icon.require' => '请填写图标标签！',
    ];

    protected $scene = [
        'add' => [
            'title',
            'icon',
        ],
        'update' => [
            'title',
            'icon'
        ]
    ];
}