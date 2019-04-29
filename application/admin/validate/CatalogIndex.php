<?php
namespace app\admin\validate;

use think\Validate;

class CatalogIndex extends Validate{
    protected $rule = [
        'title' => 'require',
    ];

    protected $message = [
        'title.require' => '请填写标题！',
    ];

    protected $scene = [
        'add' => [
            'title',
        ],
        'update' => [
            'title',
        ]
    ];
}