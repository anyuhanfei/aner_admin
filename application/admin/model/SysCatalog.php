<?php
namespace app\admin\model;

use think\Model;


class SysCatalog extends Model{
    protected $table = "sys_catalog";

    public function module(){
        return $this->hasOne('sys_module', 'module_id', 'module_id');
    }

    public function action(){
        return $this->hasOne('sys_action', 'action_id', 'action_id');
    }

    public function topcatalog(){
        return $this->hasOne('sys_catalog', 'top_id', 'catalog_id');
    }
}