<?php
namespace app\admin\model;

use think\Model;

use app\admin\controller\Base;

use app\admin\model\IdxUserData;
use app\admin\model\IdxUserFund;
use app\admin\model\IdxUserCount;

class IdxUser extends Model{
    protected $table = "idx_user";
    protected $pk = 'user_id';

    /**
     * 关联自己的上级
     *
     * @return void
     */
    public function top(){
        $Base = new Base();
        return $this->hasOne('idx_user', 'user_id', 'top_id')->field($Base->user_identity);
    }

    /**
     * 关联会员资金表
     *
     * @return void
     */
    public function userfund(){
        $Base = new Base();
        $field = '';
        foreach($Base->user_fund_type as $k => $v){
            $field .= $v . ',';
        }
        $field = substr($field, 0, strlen($field) - 1);
        return $this->hasOne('idx_user_fund', 'user_id', 'user_id')->field($field);
    }

    /**
     * 关联会员统计表
     *
     * @return void
     */
    public function usercount(){
        return $this->hasOne('idx_user_count', 'user_id', 'user_id');
    }

    /**
     * 关联会员资料表
     *
     * @return void
     */
    public function userdata(){
        return $this->hasOne('idx_user_data', 'user_id', 'user_id');
    }

    /**
     * 关联会员资料--身份证
     *
     * @return void
     */
    public function userDataIdCard(){
        $field = 'id_card_username, id_card_code, id_card_front_img, id_card_verso_img, id_card_hand_img';
        return $this->hasOne('idx_user_data', 'user_id', 'user_id')->field($field);
    }

    /**
     * 关联会员资料--银行卡
     *
     * @return void
     */
    public function userDataBank(){
        $field = 'bank_username, bank_phone, bank_code, bank_name';
        return $this->hasOne('idx_user_data', 'user_id', 'user_id')->field($field);
    }

    /**
     * 关联会员资料--地址
     *
     * @return void
     */
    public function userDataSite(){
        $field = 'site_username, site_phone, site_province, site_city, site_district, site_address';
        return $this->hasOne('idx_user_data', 'user_id', 'user_id')->field($field);
    }

    /**
     * 关联会员资料--微信
     *
     * @return void
     */
    public function userDataWx(){
        $field = 'wx_account, wx_nickname';
        return $this->hasOne('idx_user_data', 'user_id', 'user_id')->field($field);
    }

    /**
     * 关联会员资料--支付宝
     *
     * @return void
     */
    public function dataAlipay(){
        $field = 'alipay_account, alipay_username';
        return $this->hasOne('idx_user_data', 'user_id', 'user_id')->field($field);
    }

    /**
     * 关联会员资料--qq
     *
     * @return void
     */
    public function userDataQq(){
        $field = 'qq';
        return $this->hasOne('idx_user_data', 'user_id', 'user_id')->field($field);
    }

    /**
     * 是否可以登录
     *
     * @param [type] $value
     * @param [type] $data
     * @return void
     */
    public function getIsLoginTextAttr($value, $data){
        $res = ['冻结', '正常'];
        return $res[$data['is_login']];
    }

    /**
     * 注册会员
     *
     * @param string $user_identity 会员标识
     * @param string $password 密码
     * @param integer $top_id 上级id，选填
     * @param string $nickname 昵称，选填
     * @param string $level_password 二级密码，选填
     * @return void
     */
    public static function create_data($user_identity, $password, $top_id = 0, $nickname = '', $level_password = ''){
        $password_salt = create_captcha(6, 'lowercase+uppercase+figure');
        $Base = new Base();
        $res = self::create([
            $Base->user_identity => $user_identity,
            'password'=> md5($password . $password_salt),
            'password_salt'=> $password_salt,
            'level_password'=> $level_password,
            'nickname'=> $nickname,
            'top_id'=> $top_id,
            'register_time'=> date('Y-m-d', time())
        ]);
        if($res){
            IdxUserData::create(['user_id'=> $res->user_id]);
            IdxUserFund::create(['user_id'=> $res->user_id]);
            IdxUserCount::create(['user_id'=> $res->user_id]);
            IdxUserCount::add_team_number($top_id);
            return true;
        }else{
            return false;
        }
    }
}