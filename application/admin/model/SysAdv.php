<?php
namespace app\admin\model;

use think\Model;


class SysAdv extends Model{
    protected $table = "sys_adv";

    public function ad(){
        return $this->hasMany('sys_ad', 'adv_id', 'adv_id');
    }
}