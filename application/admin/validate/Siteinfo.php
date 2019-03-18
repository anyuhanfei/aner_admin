<?php
namespace app\admin\validate;

use think\Validate;

class Siteinfo extends Validate{
    protected $rule = [
        'title' => 'require|max:20',
        'keyword' => 'require|max:50',
        'description' => 'require|max:200',
        'copyright' => 'require',
        'aq' => 'require',
    ];

    protected $message = [
        'title.require' => '标题必须填写！',
        'title.max' => '标题不能超过20个字符！',
        'keyword.require' => '关键词必须填写！',
        'keyword.max' => '关键词不能超过50个字符！',
        'description.require' => '简介必须填写！',
        'description.max' => '简介不能超过200个字符！',
        'copyright.require' => '版权信息必须填写！',
        'aq.require' => '备案号信息必须填写！',
    ];

    protected $scene = [

    ];
}