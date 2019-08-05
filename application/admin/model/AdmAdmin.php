<?php
namespace app\admin\model;

use think\Model;


class AdmAdmin extends Model{
    protected $table = "adm_admin";

    public function role(){
        return $this->hasOne('adm_role', 'role_id', 'role_id');
    }
}