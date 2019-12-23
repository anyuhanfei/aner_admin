<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\SysSetCategory;


class SetCategory extends Validate{
    protected $rule = [
        'category_name'=> 'require|checkCategoryName|checkUpdateCategoryName',
        'sort'=> 'checkSort',
        'category_id'=> 'require|checkCategory'
    ];

    protected $message = [
        'category_name.require'=> '请填写网站设置分类名称',
        'category_id.require'=> '非法操作'
    ];

    protected $scene = [
        'add'=> [
            'category_name'=> 'require|checkCategoryName',
            'sort'=> 'checkSort',
        ],
        'update'=> [
            'category_name'=> 'require|checkUpdateCategoryName',
            'sort'=> 'checkSort',
            'category_id'=> 'require|checkCategory'
        ]
    ];

    protected function checkCategoryName($value, $rule, $data){
        $category = SysSetCategory::where('category_name', $value)->find();
        if($category){
            return "此分类名称已存在";
        }
        return true;
    }

    protected function checkSort($value, $rule, $data){
        if($value < 0){
            return "排序请勿使用负数";
        }
        return true;
    }

    protected function checkUpdateCategoryName($value, $rule, $data){
        $category = SysSetCategory::where('category_name', $value)->find();
        if($category){
            if($category->category_id != $data['category_id']){
                return "此账号已被注册";
            }
        }
        return true;
    }

    protected function checkCategory($value, $rule, $data){
        $category = SysSetCategory::get($value);
        if(!$category){
            return "非法操作";
        }
        if($category->category_name == $data['category_name'] && $category->sort == $data['sort']){
            return "没有可修改的数据";
        }
        return true;
    }
}