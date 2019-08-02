<?php
namespace app\admin\model;

use think\Model;

class SysModuleAction extends Model{
    protected $table = 'sys_module_action';

    public function module(){
        return $this->hasOne('sys_module', 'module_id', 'module_id');
    }
}