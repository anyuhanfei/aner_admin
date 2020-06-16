<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\SysAdv;

class Adv extends Validate{
    protected $rule = [
        'adv_name'=> 'require|checkAdvName|checkUpdateAdvName',
        'sign'=> 'require|checkSign|checkUpdateSign',
        'adv_id'=> 'checkAdv'
    ];

    protected $message = [
        'adv_name.require'=> '请输入广告位标题',
        'sign.require'=> '请输入广告位标签'
    ];

    protected $scene = [
        'add'=> [
            'adv_name'=> 'require|checkAdvName',
            'sign'=> 'require|checkSign',
            'sort'=> 'checkSort'
        ],
        'update'=> [
            'adv_name'=> 'require|checkUpdateAdvName',
            'sign'=> 'require|checkUpdateSign',
            'sort'=> 'checkSort',
            'adv_id'=> 'checkAdv'
        ]
    ];

    protected function checkSign($value, $rule, $data){
        $adv = SysAdv::where('sign', $value)->find();
        if($adv){
            return "此广告位标签已存在";
        }
        return true;
    }

    protected function checkUpdateSign($value, $rule, $data){
        $adv = SysAdv::where('sign', $value)->find();
        if($adv){
            if($adv->adv_id != $data['adv_id']){
                return "此广告位标签已存在";
            }
        }
        return true;
    }

    protected function checkAdvName($value, $rule, $data){
        $adv = SysAdv::where('adv_name', $value)->find();
        if($adv){
            return "此广告位标题已存在";
        }
        return true;
    }

    protected function checkUpdateAdvName($value, $rule, $data){
        $adv = SysAdv::where('adv_name', $value)->find();
        if($adv){
            if($adv->adv_id != $data['adv_id']){
                return "此广告位标题已存在";
            }
        }
        return true;
    }

    protected function checkAdv($value, $rule, $data){
        $adv = SysAdv::get($value);
        if($adv->adv_name == $data['adv_name'] && $adv->sign == $data['sign'] && $adv->sort = $data['sort']){
            return "没有修改的信息";
        }
        return true;
    }
}