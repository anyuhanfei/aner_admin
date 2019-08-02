<?php
namespace app\admin\validate;

use think\Validate;

class CmsTag extends Validate{
    protected $rule = [
        'tag_id' => 'require',
        'tag_name' => 'require',
    ];

    protected $message = [
        'tag_id.require' => '系统错误！',
        'tag_name.require' => '请填写标签名称！',
    ];

    protected $scene = [
        'add' => [
            'tag_name',
        ],
        'update' => [
            'tag_name',
            'tag_id',
        ]
    ];
}
