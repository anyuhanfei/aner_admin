<?php
namespace app\admin\model;

use think\Model;


class AdmAdmin extends Model{
    protected $pk = 'admin_id';
    protected $table = "adm_admin";
    protected $schema = [
        'admin_id'=> 'int',
        'account'=> 'varchar',
        'password'=> 'char',
        'password_salt'=> 'char',
        'via'=> 'varchar',
        'nickname'=> 'varchar',
        'role_id'=> 'int',
        'phone'=> 'varchar',
        'email'=> 'varchar',
        'qq'=> 'varchar',
        'wx'=> 'varchar'
    ];

    /**
     * 关联角色表
     *
     * @return void
     */
    public function role(){
        return $this->hasOne('adm_role', 'role_id', 'role_id');
    }
}