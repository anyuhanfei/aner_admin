<?php
namespace app\admin\Validate;

use think\Validate;

use app\admin\model\CmsTag;


class Tag extends Validate{
    protected $rule = [
        'tag_name'=> 'require|checkTagName|checkUpdateTagName',
        'sort'=> 'checkSort',
        'tag_id'=> 'require|checkTagId'
    ];

    protected $message = [
        'tag_name.require'=> '请填写标签名称',
    ];

    protected $scene = [
        'add'=> [
            'tag_name'=> 'require|checkTagName',
            'sort'=> 'checkSort'
        ],
        'update'=> [
            'tag_name'=> 'require|checkUpdateTagName',
            'sort'=> 'checkSort',
            'tag_id'=> 'require|checkTagId'
        ]
    ];

    protected function checkTagName($value, $rule, $data){
        $res = CmsTag::where('tag_name', $value)->find();
        if($res){
            return "此标签名称已存在";
        }
        return true;
    }

    protected function checkUpdateTagName($value, $rule, $data){
        $ad = CmsTag::where('tag_name', $value)->where('tag_id', '<>', $data['tag_id'])->find();
        if($ad){
            return "此标签名称已存在";
        }
        return true;
    }

    protected function checkSort($value, $rule, $data){
        if($value < 0){
            return "排序请勿使用负数";
        }
        return true;
    }

    protected function checkTagId($value, $rule, $data){
        $tag = CmsTag::where('tag_id', $value)->find();
        if(!$tag){
            return "非法操作";
        }
        return true;
    }
}