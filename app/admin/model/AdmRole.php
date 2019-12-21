<?php
namespace app\admin\model;

use think\Model;

class AdmRole extends Model{
    protected $table = "adm_role";
    protected $pk = 'role_id';
    protected $schema = [
        'role_id'=> 'int',
        'role_name'=> 'varchar',
        'sort'=> 'tinyint',
        'remark'=> 'varchar',
        'power'=> 'text'
    ];
}