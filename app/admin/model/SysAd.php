<?php
namespace app\admin\model;

use think\Model;


class SysAd extends Model{
    protected $table = 'sys_ad';
    protected $pk = 'ad_id';

    /**
     * 关联广告位表
     *
     * @return void
     */
    public function adv(){
        return $this->hasOne('sys_adv', 'adv_id', 'adv_id');
    }
}