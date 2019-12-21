<?php
namespace app\admin\model;

use think\Model;


class SysModuleAction extends Model{
    protected $table = "sys_module_action";
    protected $pk = 'action_id';
    protected $schema = [
        'action_id'=> 'int',
        'module_id'=> 'int',
        'title'=> 'varchar',
        'path'=> 'varchar',
        'route'=> 'varchar',
        'sort'=> 'tinyint',
        'remark'=> 'varchar',
    ];

    /**
     * 关联模块表
     *
     * @return void
     */
    public function module(){
        return $this->hasOne('sys_module', 'module_id', 'module_id');
    }
}