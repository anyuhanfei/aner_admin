<?php
namespace app\admin\model;

use think\Model;
use think\facade\Env;


class LogIdxUserFund extends Model{
    protected $table = 'log_idx_user_fund';
    protected $pk = "id";

    public function user(){
        return $this->hasOne('idx_user', 'user_id', 'user_id');
    }

    public static function fund_type_text(){
        return ['提现', '提现手续费'];
    }
}