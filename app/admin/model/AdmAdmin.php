<?php
namespace app\admin\model;

use think\Model;


class AdmAdmin extends Model{
    protected $pk = 'admin_id';
    protected $table = "adm_admin";

    /**
     * 关联角色表
     *
     * @return void
     */
    public function role(){
        return $this->hasOne('adm_role', 'role_id', 'role_id');
    }
}