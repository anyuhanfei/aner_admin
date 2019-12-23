<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\SysModule;
use app\admin\model\SysModuleAction;
use app\admin\model\SysCatalog;


class Catalog extends Validate{
    protected $rule = [
        'title'=> 'require',
        'icon'=> 'require',
        'action_id'=> 'checkAction',
        'module_id'=> 'checkModule',
        'top_id'=> 'checkTopId',
        'catalog_id'=> 'checkCatalog',
        'sort'=> 'checkSort',
    ];

    protected $message = [
        'title.require'=> '请填写标题',
        'icon.require'=> '请填写图标',
    ];

    protected $scene = [
        'add'=> [
            'title'=> 'require',
            'icon'=> 'require',
            'action_id'=> 'checkAction',
            'module_id'=> 'checkModule',
            'catalog_id'=> 'checkCatalog',
            'sort'=> 'checkSort',
        ],
        'update'=> [
            'title'=> 'require',
            'icon'=> 'require',
            'action_id'=> 'checkAction',
            'module_id'=> 'checkModule',
            'top_id'=> 'checkTopId',
            'catalog_id'=> 'checkCatalog',
            'sort'=> 'checkSort',
        ]
    ];

    public function checkSort($value, $rule, $data){
        if($value < 0){
            return "排序请勿使用负数";
        }
        return true;
    }

    public function checkTopId($value, $rule, $data){
        if($data['top_id'] > 0){
            $catalog = SysCatalog::get($value);
            if(!$catalog){
                return "上级目录无效";
            }
            if($catalog->top_id != 0){
                return "不是上级目录";
            }
        }
        return true;
    }

    public function checkModule($value, $rule, $data){
        if($data['top_id'] > 0){
            $module = SysModule::get($value);
            if(!$module){
                return "绑定模块无效";
            }
        }
        return true;
    }

    public function checkAction($value, $rule, $data){
        if($data['top_id'] > 0){
            $action = SysModuleAction::get($value);
            if(!$action){
                return "绑定方法无效";
            }
            if($action->module_id != $data['module_id']){
                return "绑定方法异常";
            }
        }
        return true;
    }

    public function checkCatalog($value, $rule, $data){
        $catalog = SysCatalog::get($value);
        if(!$catalog){
            return "非法操作";
        }
        $action_path = SysModuleAction::where('action_id', $catalog->action_id)->value('route');
        if($catalog->title == $data['title'] && $catalog->icon == $data['icon'] && $catalog->action_id == $data['action_id'] && $catalog->module_id == $data['module_id'] && $catalog->top_id == $data['top_id'] && $catalog->catalog_id == $data['catalog_id'] && $catalog->sort == $data['sort'] && $action_path == $catalog->path){
            return "没有要修改的信息";
        }
        return true;
    }
}