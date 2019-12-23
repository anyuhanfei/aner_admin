<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\controller\Control;

use app\admin\model\IdxUser;
use app\admin\model\LogAdminOperation;


class User extends Validate{
    protected $rule = [
        'nickname'=> 'require',
        'user_identity'=> 'require|checkUserIdentity|checkUpdataUserIdentity',
        'password'=> 'require|checkPassword',
        'level_password'=> 'checkLevelPassword',
        'top_user_identity'=> 'checkTopUserIdentity',
        'type'=> 'require|checkType',
        'id'=> 'require|checkId'
    ];

    protected $message = [
        'nickname.require'=> '请填写昵称',
        'user_identity.require'=> '非法操作1',
        'password.require'=> '请填写密码',
        'type.require'=> '非法操作2',
        'id.require'=> '非法操作4'
    ];

    protected $scene = [
        'add'=> [
            'nickname'=> 'require',
            'user_identity'=> 'require|checkUserIdentity',
            'password'=> 'require|checkPassword',
            'level_password'=> 'checkLevelPassword',
            'top_user_identity'=> 'checkTopUserIdentity'
        ],
        'get'=> [
            'type'=> 'require|checkType',
            'id'=> 'require|checkId'
        ],
        'detail'=> [
            'nickname'=> 'require',
            'user_identity'=> 'require|checkUpdataUserIdentity',
        ],
        'password'=> [
            'password'=> 'require|checkPassword',
        ],
        'level_password'=> [
            'level_password'=> 'checkLevelPassword',
        ]
    ];

    /**
     * 验证账号
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkUserIdentity($value, $rule, $data){
        $control = new Control();
        $user = IdxUser::where($control->user_identity, $value)->find();
        if($user){
            return '此' . $control->user_identity_text . '已被注册';
        }
        return $this->account_regular($value, $control);
    }

    /**
     * 修改会员信息验证
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkUpdataUserIdentity($value, $rule, $data){
        $me = IdxUser::get($data['id']);
        if(!$me){
            return '非法操作';
        }
        $control = new Control();
        $user_identity = $control->user_identity;
        if($me->nickname == $data['nickname'] && $me->$user_identity == $data['user_identity']){
            return "未修改任何信息";
        }
        $user = IdxUser::where($user_identity, $value)->find();
        if($user){
            if($user->user_id != $data['id']){
                return '此' . $control->user_identity_text . '已被注册';
            }
        }
        return $this->account_regular($value, $control);
    }

    /**
     * 正则验证
     *
     * @param [type] $value
     * @param [type] $control
     * @return void
     */
    private function account_regular($value, $control){
        if($control->user_identity == 'phone'){
            $rule = "/^(?:(?:\+|00)86)?1\d{10}$/";
            $rule_message = "手机号不符合要求，请填写正确手机号";
        }elseif($control->user_identity == 'email'){
            $rule = "/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/";
            $rule_message = '邮箱账号不符合要求，请填写正确邮箱账号';
        }elseif($control->user_identity == 'account'){
            $rule = "/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/";
            $rule_message = '输入账号不符合要求，账号必须是以字母开头，5到16位字符，可为字母、数字和下划线的组合';
        }
        if(preg_match($rule, $value)){
            return true;
        }else{
            return $rule_message;
        }
    }

    /**
     * 密码验证码
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkPassword($value, $rule, $data){
        $rule = "/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/";
        if(preg_match($rule, $value)){
            return true;
        }else{
            return '输入密码不符合要求，6到20位数字和字母的组合';
        }
    }

    /**
     * 二级密码验证
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkLevelPassword($value, $rule, $data){
        $rule = "/^\d{6}$/";
        if(preg_match($rule, $value)){
            return true;
        }else{
            return '输入二级密码不符合要求，二级密码必须是6位纯数字';
        }
    }

    /**
     * 上级会员验证码
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkTopUserIdentity($value, $rule, $data){
        $control = new Control();
        $user = IdxUser::where($control->user_identity, $value)->find();
        if(!$user){
            return '此' . $control->user_identity_text . '不存在，请重新填写';
        }
        return true;
    }

    /**
     * id验证
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkId($value, $rule, $data){
        $user = IdxUser::get($value);
        if(!$user){
            return "非法操作";
        }
        return true;
    }

    protected function checkType($value, $rule, $data){
        if($value == 'detail' || $value == 'password' || $value == 'level_password'){
            return true;
        }
        return "非法操作";
    }
}