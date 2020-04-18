<?php
namespace app\admin\model;

use think\Model;


class SysCatalog extends Model{
    protected $table = "sys_catalog";
    protected $pk = 'catalog_id';

    /**
     * 关联模块表
     *
     * @return void
     */
    public function module(){
        return $this->hasOne('sys_module', 'module_id', 'module_id');
    }

    /**
     * 关联方法表
     *
     * @return void
     */
    public function action(){
        return $this->hasOne('sys_action', 'action_id', 'action_id');
    }

    /**
     * 关联上级目录
     *
     * @return void
     */
    public function topcatalog(){
        return $this->hasOne('sys_catalog', 'top_id', 'catalog_id');
    }
}