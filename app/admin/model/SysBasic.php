<?php
namespace app\admin\model;

use think\Model;


class SysBasic extends Model{
    protected $table = "sys_basic";
    protected $pk = 'id';
    protected $schema = [
        'id'=> 'int',
        'title'=> 'varchar',
        'keyword'=> 'varchar',
        'description'=> 'varchar',
        'copyright'=> 'varchar',
        'aq'=> 'varchar'
    ];
}