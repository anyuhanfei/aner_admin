<?php
namespace app\admin\model;

use think\Model;

class SysModule extends Model{
    protected $table = "sys_module";
    protected $pk = 'module_id';
    protected $schema = [
        'module_id'=> 'int',
        'title'=> 'varchar',
        'sort'=> 'tinyint',
        'remark'=> 'varchar'
    ];

    /**
     * 关联方法表
     *
     * @return void
     */
    public function action(){
        return $this->hasMany('sys_module_action', 'module_id', 'module_id');
    }
}