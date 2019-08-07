<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\SysAdv;
use app\admin\model\SysAd;


class Ad extends Validate{
    protected $rule = [
        'title'=> 'require|checkTitle|checkUpdateTitle',
        'adv_id'=> 'require|checkAdvId',
        'sort'=> 'checkSort'
    ];

    protected $message = [
        'title.require'=> '请填写标题',
        'adv_id.require'=> '请选择广告位'
    ];

    protected $scene = [
        'add'=> [
            'title'=> 'require|checkTitle',
            'adv_id'=> 'require|checkAdvId',
            'sort'=> 'checkSort'
        ],
        'update'=> [
            'title'=> 'require|checkUpdateTitle',
            'adv_id'=> 'require|checkAdvId',
            'sort'=> 'checkSort'
        ]
    ];

    protected function checkTitle($value, $rule, $data){
        $ad = SysAd::where('title', $value)->find();
        if($ad){
            return "此标题已存在";
        }
        return true;
    }

    protected function checkUpdateTitle($value, $rule, $data){
        $ad = SysAd::where('title', $value)->where('ad_id', '<>', $data['ad_id'])->find();
        if($ad){
            return "此标题已存在";
        }
        return true;
    }

    protected function checkAdvId($value, $rule, $data){
        $adv = SysAdv::where('adv_id', $value)->find();
        if(!$adv){
            return "请选择正确的广告位";
        }
        return true;
    }

    protected function checkSort($value, $rule, $data){
        if($value < 0){
            return "排序请勿使用负数";
        }
        return true;
    }
}