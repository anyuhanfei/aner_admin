<?php
namespace app\admin\model;

use think\Model;


class SysSetCategory extends Model{
    protected $table = "sys_set_category";

    public function set(){
        return $this->hasMany('sys_set', 'category_id', 'category_id');
    }
}