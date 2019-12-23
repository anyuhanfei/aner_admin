<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\SysSetCategory;
use app\admin\model\SysSet;


class Set extends Validate{
    protected $rule = [
        'category_id'=> 'checkCategoryId',
        'title'=> 'require|checkTitle|checkUpdateTitle',
        'sign'=> 'require|checkSign|checkUpdateSign',
        'sort'=> 'checkSort',
        'set_id'=> 'checkSetId',
        'type'=> 'checkType',
        'value'=> 'require',
    ];

    protected $message = [
        'title.require'=> '请填写网站设置标题',
        'sign.require'=> '请填写网站设置标签',
        'value.require'=> '请填写网站设置的值'
    ];

    protected $scene = [
        'add'=> [
            'category_id'=> 'checkCategoryId',
            'title'=> 'require|checkTitle',
            'sign'=> 'require|checkSign',
            'sort'=> 'checkSort',
            'type'=> 'checkType',
            'value'=> 'require',
        ],
        'update'=> [
            'category_id'=> 'checkCategoryId',
            'title'=> 'require|checkUpdateTitle',
            'sign'=> 'require|checkUpdateSign',
            'sort'=> 'checkSort',
            'set_id'=> 'checkSetId',
            'type'=> 'checkType',
            'value'=> 'require',
        ]
    ];

    protected function checkSort($value, $rule, $data){
        if($value < 0){
            return "排序请勿使用负数";
        }
        return true;
    }

    protected function checkCategoryId($value, $rule, $data){
        if($value == 0){
            return true;
        }
        $category = SysSetCategory::get($value);
        if(!$category){
            return "网站设置分类选择无效";
        }
        return true;
    }

    protected function checkTitle($value, $rule, $data){
        $set = SysSet::where('title', $value)->find();
        if($set){
            return "网站设置标题已存在";
        }
        return true;
    }

    protected function checkUpdateTitle($value, $rule, $data){
        $set = SysSet::where('title', $value)->find();
        if($set){
            if($set->set_id != $data['set_id']){
                return "网站设置标题已存在";
            }
        }
        return true;
    }

    protected function checkSign($value, $rule, $data){
        $set = SysSet::where('sign', $value)->find();
        if($set){
            return "网站设置标签已存在";
        }
        return true;
    }

    protected function checkUpdateSign($value, $rule, $data){
        $set = SysSet::where('sign', $value)->find();
        if($set){
            if($set->set_id != $data['set_id']){
                return "网站设置标签已存在";
            }
        }
        return true;
    }

    protected function checkType($value, $rule, $data){
        if($value != 'value' && $value != 'onoff'){
            return "类型选择无效";
        }
        if($value == 'onoff'){
            if($data['value'] == 'on' && $data['value'] == 'off'){
                return "值选择无效";
            }
        }
        return true;
    }

    protected function checkSetId($value, $rule, $data){
        $set = SysSet::get($value);
        if(!$set){
            return "非法操作";
        }
        if($set->title == $data['title'] && $set->category_id == $data['category_id'] && $set->sign == $data['sign'] && $set->sort == $data['sort'] && $set->type == $data['type'] && $set->value == $data['value']){
            return "没有要修改的信息";
        }
        return true;
    }
}