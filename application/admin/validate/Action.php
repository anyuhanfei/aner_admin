<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\SysModuleAction;
use app\admin\model\SysModule;


class Action extends Validate{
    protected $rule = [
        'title'=> 'require|checkTitle',
        'path'=> 'require',
        'module_id'=> 'checkModuleId',
        'action_id'=> 'require',
        'remark'=> 'checkData',
        'sort'=> 'checkSort'
    ];

    protected $message = [
        'title.require'=> '请填写方法名称',
        'path.require'=> '请填写方法路径',
        'action_id.require'=> '非法操作'
    ];

    protected $scene = [
        'add'=> [
            'title'=> 'require|checkTitle',
            'path'=> 'require',
            'module_id'=> 'checkModuleId',
            'sort'=> 'checkSort'
        ],
        'update'=> [
            'title'=> 'require',
            'path'=> 'require',
            'module_id'=> 'checkModuleId',
            'action_id'=> 'require',
            'remark'=> 'checkData',
            'sort'=> 'checkSort'
        ]
    ];

    public function checkTitle($value, $rule, $data){
        $action = SysModuleAction::where('title', $value)->find();
        if($action){
            return "方法名称已存在";
        }
        return true;
    }

    public function checkModuleId($value, $rule, $data){
        $module = SysModule::where('module_id', $value)->find();
        if(!$module){
            return "请选择正确的模块";
        }
        return true;
    }

    public function checkSort($value, $rule, $data){
        if($value < 0){
            return "排序请勿使用负数";
        }
        return true;
    }

    protected function checkData($value, $rule, $data){
        $action = SysModuleAction::get($data['action_id']);
        if(!$action){
            return "非法操作";
        }
        if($data['title'] == $action->title && $data['remark'] == $action->remark && $data['sort'] == $action->sort && $data['module_id'] == $action->module_id && $data['path'] == $action->path){
            return "未修改任何信息，请勿提交";
        }
        return true;
    }
}