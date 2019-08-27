<?php
namespace app\admin\model;

use think\Model;

use app\admin\controller\Control;


class IdxUserData extends Model{
    protected $table = 'idx_user_data';

    public function user(){
        $control = new Control();
        return $this->hasOne('idx_user', 'user_id', 'user_id')->field($control->user_fund_type);
    }
}