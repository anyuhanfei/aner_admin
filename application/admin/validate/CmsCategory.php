<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\CmsCategory as CCM;

class CmsCategory extends Validate{
    protected $rule = [
        'category_id' => 'require',
        'category_name' => 'require',
    ];

    protected $message = [
        'category_id.require' => '系统错误！',
        'category_name.require' => '文章分类名称不能为空！',
    ];

    protected $scene = [
        'add_name' => [
            'category_name'
        ],
        'update_name' => [
            'cateogry_id',
            'category_name'
        ]
    ];
}