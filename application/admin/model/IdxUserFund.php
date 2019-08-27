<?php
namespace app\admin\model;

use think\Model;

use app\admin\controller\Control;


class IdxUserFund extends Model{
    protected $table = 'idx_user_fund';

    public function user(){
        $control = new Control();
        return $this->hasOne('idx_user', 'user_id', 'user_id')->field($control->user_fund_type);
    }
}