<?php
namespace app\admin\controller;

use think\facade\Session;
use think\facade\Request;
use think\facade\View;

use app\admin\controller\Admin;

use app\admin\model\SysBasic;
use app\admin\model\SysSet;
use app\admin\model\SysSetCategory;
use app\admin\model\SysSetting;


class Webset extends Admin{
    /**
     * 基本信息
     *
     * @return void
     */
    public function basic(){
        $detail = SysBasic::find(1);
        if(!$detail){
            SysBasic::create(['id'=> 1]);
            $detail = SysBasic::find(1);
        }
        View::assign('detail', $detail);
        return View::fetch();
    }

    /**
     * 基本信息修改提交
     *
     * @return void
     */
    public function basic_submit(){
        $data = Request::instance()->param();
        $basic = SysBasic::find(1);
        $res = $basic->save($data);
        if($res){
            return return_data(1, '', '修改成功', '基本信息修改');
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
        }
    }

    /**
     * 网站设置
     *
     * @return void
     */
    public function setting($cgory=''){
        $setting_category = SysSetting::where('type', 'cgory')->select();
        $category = SysSetting::where('type', 'cgory')->where('category_name', $cgory)->find();
        if($category){
            $cgory = $category->category_name;
        }else{
            $category = SysSetting::where('type', 'cgory')->order('id asc')->find();
            if($category){
                $cgory = $category->category_name;
            }else{
                $cgory = '';
            }
        }
        $setting = SysSetting::where('type', 'value')->where('category_name', $cgory)->order('sort asc')->select();
        View::assign('setting_category', $setting_category);
        View::assign('setting', $setting);
        View::assign('cgory', $cgory);
        return View::fetch();
    }

    public function setting_value_submit(){
        $data = Request::instance()->param();
        foreach($data as $k=> $v){
            if($v != ''){
                $setting = SysSetting::where('sign', $k)->find();
                if($setting){
                    $setting->value = $v;
                    $setting->save();
                }
            }
        }
        return return_data(1, '', '操作完成', '网站设置修改');
    }

    /**
     * 网站设置添加
     *
     * @return void
     */
    public function setting_add(){
        $setting_category = SysSetting::where('type', 'cgory')->select();
        $category_sort_maximum = SysSetting::where('type', 'cgory')->order('sort desc')->value('sort');
        $value_sort_maximum = SysSetting::where('type', 'value')->order('sort desc')->value('sort');
        View::assign('setting_category', $setting_category);
        View::assign('category_sort_maximum', $category_sort_maximum);
        View::assign('value_sort_maximum', $value_sort_maximum);
        return View::fetch();
    }

    /**
     * 网站设置添加提交
     *
     * @return void
     */
    public function setting_add_submit(){
        $type = Request::instance()->param('type', '');
        $category_name = Request::instance()->param('category_name', '');
        $title = Request::instance()->param('title', '');
        $sign = Request::instance()->param('sign', '');
        $input_type = Request::instance()->param('input_type', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', 999);
        $validate = new \app\admin\validate\Setting;
        if($type == 'cgory'){
            $check_array = ['type'=> $type, 'category_name'=> $category_name];
            if(!$validate->scene('category')->check($check_array)){
                return return_data(2, '', $validate->getError());
            }
        }else{
            $check_array = ['type'=> $type, 'category_name'=> $category_name, 'title'=> $title, 'sign'=> $sign, 'input_type'=> $input_type];
            if(!$validate->scene('value')->check($check_array)){
                return return_data(2, '', $validate->getError());
            }
        }
        $res = SysSetting::create(['type'=> $type, 'category_name'=> $category_name, 'title'=> $title, 'sign'=> $sign, 'input_type'=> $input_type, 'sort'=> $sort, 'remark'=> $remark]);
        if($res){
            return return_data(1, '', '添加成功', '网站设置添加');
        }else{
            return return_data(2, '', '添加失败');
        }
    }
}