<?php
namespace app\admin\model;

use think\Model;


class AdmFreezeIp extends Model{
    protected $table = "adm_freeze_ip";
    protected $pk = 'id';
    protected $schema = [
        'id'=> 'int',
        'ip'=> 'varchar',
        'freeze_start_time'=> 'datetime',
        'freeze_end_time'=> 'datetime'
    ];
}