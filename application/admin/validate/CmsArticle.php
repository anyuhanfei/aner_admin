<?php
namespace app\index\validate;

use think\Validate;

class CmsArticle extends Validate{
    protected $rule = [
        'article_id' => 'require',
        'category_id' => 'require',
        'title' => 'require',
    ];

    protected $message = [
        'article_id.require' => '系统错误！',
        'category_id.require' => '请选择文章分类！',
        'title.require' => '请填写文章标题！',
    ];

    protected $scene = [
        'add' => [
            'category_id',
            'title',
        ],
        'update' => [
            'category_id',
            'article_id',
            'title',
        ]
    ];
}
