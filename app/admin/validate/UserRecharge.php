<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\controller\Base;


class UserRecharge extends Validate{
    protected $rule = [
        'fund_type'=> 'checkFundType',
        'radio_number'=> 'checkNumber',
    ];

    protected $message = [

    ];

    protected function checkFundType($value, $rule, $data){
        $control = new Base();
        if(in_array($value, $control->user_fund_type)){
            return true;
        }
        return '请选择充值资金类型';
    }

    protected function checkNumber($value, $rule, $data){
        if($data['radio_number'] == 0 && $data['input_number'] == 0){
            return "请填写或选择充值金额";
        }
        return true;
    }
}