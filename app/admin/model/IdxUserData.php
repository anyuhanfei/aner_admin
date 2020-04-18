<?php
namespace app\admin\model;

use think\Model;

use app\admin\controller\Base;


class IdxUserData extends Model{
    protected $table = 'idx_user_data';
    protected $pk = 'user_id';

    /**
     * 关联会员表
     *
     * @return void
     */
    public function user(){
        $Base = new Base();
        return $this->hasOne('idx_user', 'user_id', 'user_id')->field($Base->user_fund_type);
    }
}