<?php
namespace app\admin\model;

use think\Model;


class AdmAdminLogin extends Model{
    protected $table = "adm_admin_login";
    protected $pk = 'id';
    protected $schema = [
        'id'=> 'int',
        'ip'=> 'varchar',
        'error_number'=> 'tinyint',
        'insert_time'=> 'datetime'
    ];
}