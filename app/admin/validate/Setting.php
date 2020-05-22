<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\SysSetting;


class Setting extends Validate{
    protected $rule = [
        'type'=> 'require|checkType',
        'category_name'=> 'require|checkCategoryName',
        'title'=> 'require',
        'sign'=> 'require|checkSign',
        'input_type'=> 'require|checkInputType',
    ];

    protected $message = [
        'type.require' => '类型未选择',
        'category_name.require' => '请设置分组',
        'title.require'=> '请输入标题',
        'sign.require'=> '请输入标签',
        'input_type.require'=> '请选择设置类型'
    ];

    protected $scene = [
        'category'=> ['type', 'category_name'],
        'value'=> ['type', 'category_name', 'title', 'sign', 'input_type']
    ];

    public function checkType($value, $rule, $data){
        if($value != 'cgory' && $value != 'value'){
            return '请选择正确的类型';
        }
        return true;
    }

    public function checkCategoryName($value, $rule, $data){
        $category = SysSetting::where('type', 'cgory')->where('category_name', $value)->find();
        if($data['type'] == 'cgory'){
            if($category){
                return "分组名称重复, 请重新输入";
            }
        }else{
            if(!$category){
                return "选择的分组不存在";
            }
        }
        return true;
    }

    public function checkSign($value, $rule, $data){
        $data = SysSetting::where('sign', $value)->find();
        if($data){
            return "签名重复, 请重新输入";
        }
        return true;
    }

    public function checkInputType($value, $rule, $data){
        if($value != 'number' && $value != 'text' && $value != 'password' && $value != 'select' && $value != 'onoff'){
            return "请选择正确的表单类型";
        }
        return true;
    }
}