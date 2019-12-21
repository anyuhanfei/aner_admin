<?php
namespace app\admin\model;

use think\Model;


class SysAdv extends Model{
    protected $table = "sys_adv";
    protected $pk = 'adv_id';
    protected $schema = [
        'adv_id'=> 'int',
        'adv_name'=> 'varchar',
        'sign'=> 'varchar',
        'sort'=> 'tinyint'
    ];

    public function ad(){
        return $this->hasMany('sys_ad', 'adv_id', 'adv_id');
    }
}