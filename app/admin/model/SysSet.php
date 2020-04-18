<?php
namespace app\admin\model;

use think\Model;


class SysSet extends Model{
    protected $table = "sys_set";
    protected $pk = 'set_id';

    /**
     * 关联设置分类表
     *
     * @return void
     */
    public function category(){
        return $this->hasOne('sys_set_category', 'category_id', 'category_id');
    }
}