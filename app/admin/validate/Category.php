<?php
namespace app\admin\Validate;

use think\Validate;

use app\admin\model\CmsCategory;


class Category extends Validate{
    protected $rule = [
        'category_name'=> 'require|checkCategoryName|checkUpdateCategoryName',
        'sort'=> 'checkSort',
        'category_id'=> 'require|checkCategoryId'
    ];

    protected $message = [
        'category_name.require'=> '请填写标签名称',
    ];

    protected $scene = [
        'add'=> [
            'category_name'=> 'require|checkCategoryName',
            'sort'=> 'checkSort'
        ],
        'update'=> [
            'category_name'=> 'require|checkUpdateCategoryName',
            'sort'=> 'checkSort',
            'category_id'=> 'require|checkCategoryId'
        ]
    ];

    protected function checkCategoryName($value, $rule, $data){
        $res = CmsCategory::where('category_name', $value)->find();
        if($res){
            return "此标签名称已存在";
        }
        return true;
    }

    protected function checkUpdateCategoryName($value, $rule, $data){
        $ad = CmsCategory::where('category_name', $value)->where('category_id', '<>', $data['category_id'])->find();
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

    protected function checkCategoryId($value, $rule, $data){
        $category = CmsCategory::where('category_id', $value)->find();
        if(!$category){
            return "非法操作";
        }
        return true;
    }
}