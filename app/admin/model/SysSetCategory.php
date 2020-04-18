<?php
namespace app\admin\model;

use think\Model;


class SysSetCategory extends Model{
    protected $table = "sys_set_category";
    protected $pk = "category_id";

    /**
     * 关联设置表
     *
     * @return void
     */
    public function sysset(){
        return $this->hasMany('sys_set', 'category_id', 'category_id');
    }
}