<?php
namespace app\admin\model;

use think\Model;

class SysModule extends Model{
    protected $table = "sys_module";

    /**
     * 关联方法表
     *
     * @return void
     */
    public function action(){
        return $this->hasMany('sys_module_action', 'module_id', 'module_id');
    }
}