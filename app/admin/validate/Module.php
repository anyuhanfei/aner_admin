<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\SysModule;


class Module extends Validate{
    protected $rule = [
        'module_id'=> 'require',
        'title'=> 'require|checkTitle',
        'remark'=> 'checkData',
        'sort'=> 'checkSort',
    ];

    protected $message = [
        'title.require'=> '请填写模块名称',
        'module_id.require'=> '非法操作',
    ];

    protected $scene = [
        'add'=> [
            'title'=> 'require|checkTitle',
        ],
        'update'=> [
            'module_id',
            'title'=> 'require',
            'remark',
            'sort'
        ]
    ];

    protected function checkTitle($value, $rule, $data){
        $res = SysModule::where('title', $value)->find();
        if($res){
            return "此模块名称已存在";
        }
        return true;
    }

    protected function checkSort($value, $rule, $data){
        if($value < 0){
            return "排序请勿使用负数";
        }
        return true;
    }

    protected function checkData($value, $rule, $data){
        $module = SysModule::get($data['module_id']);
        if(!$module){
            return "非法操作";
        }
        if($data['title'] == $module->title && $data['remark'] == $module->remark && $data['sort'] == $module->sort){
            return "未修改任何信息，请勿提交";
        }
        return true;
    }
}