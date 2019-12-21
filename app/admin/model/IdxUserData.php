<?php
namespace app\admin\model;

use think\Model;

use app\admin\controller\Base;


class IdxUserData extends Model{
    protected $table = 'idx_user_data';
    protected $pk = 'user_id';
    protected $schema = [
        'user_id'=> 'int',
        'id_card_username'=> 'varchar',
        'id_card_code'=> 'varchar',
        'id_card_front_img'=> 'varchar',
        'id_card_verso_img'=> 'varchar',
        'id_card_hand_img'=> 'varchar',
        'bank_username'=> 'varchar',
        'bank_phone'=> 'varchar',
        'bank_code'=> 'varchar',
        'bank_name'=> 'varchar',
        'site_username'=> 'varchar',
        'site_phone'=> 'varchar',
        'site_province'=> 'varchar',
        'site_city'=> 'varchar',
        'site_district'=> 'varchar',
        'site_address'=> 'varchar',
        'wx_account'=> 'varchar',
        'wx_nickname'=> 'varchar',
        'wx_qrcode'=> 'varchar',
        'alipay_account'=> 'varchar',
        'alipay_username'=> 'varchar',
        'alipay_qrcode'=> 'varchar',
        'qq'=> 'varchar',
    ];

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