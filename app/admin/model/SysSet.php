<?php
namespace app\admin\model;

use think\Model;


class SysSet extends Model{
    protected $table = "sys_set";
    protected $pk = 'set_id';
    protected $schema = [
        'set_id'=> 'int',
        'category_id'=> 'int',
        'title'=> 'varchar',
        'sign'=> 'varchar',
        'type'=> 'varchar',
        'value'=> 'varchar',
        'sort'=> 'tinyint'
    ];

    /**
     * 关联设置分类表
     *
     * @return void
     */
    public function category(){
        return $this->hasOne('sys_set_category', 'category_id', 'category_id');
    }
}