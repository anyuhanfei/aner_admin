<?php
namespace app\admin\controller;

use think\facade\Session;
use think\facade\Request;
use think\facade\View;

use app\admin\controller\Admin;

use app\admin\model\SysBasic;
use app\admin\model\SysSet;
use app\admin\model\SysSetCategory;
use app\admin\model\LogAdminOperation;


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
            LogAdminOperation::create_data('基本信息修改', 'operation');
            return return_data(1, '', '修改成功', 'json');
        }else{
            return return_data(3, '', '修改失败,请联系管理员', 'json');
        }
    }

    /**
     * 网站设置-列表
     *
     * @return void
     */
    public function set(){
        $list = SysSet::order('sort asc')->select();
        $category = SysSetCategory::order('category_id desc')->select();
        View::assign('list', $list);
        View::assign('category', $category);
        return View::fetch();
    }

    /**
     * 网站设置分类信息添加表单
     *
     * @return void
     */
    public function set_category_add(){
        $max_sort = SysSetCategory::order('sort desc')->value('sort');
        View::assign('max_sort', $max_sort);
        return View::fetch();
    }

    /**
     * 网站设置分类信息添加提交
     *
     * @return void
     */
    public function set_category_add_submit(){
        $category_name = Request::instance()->param('category_name', '');
        $sort = Request::instance()->param('sort', 0);
        $validate = new \app\admin\validate\SetCategory;
        if(!$validate->scene('add')->check(['category_name'=> $category_name, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError(), 'json');
        }
        $res = SysSetCategory::create([
            'category_name'=> $category_name,
            'sort'=> $sort
        ]);
        if($res){
            $max_sort = SysSetCategory::order('sort desc')->value('sort');
            LogAdminOperation::create_data('网站设置分类信息添加：'.$category_name, 'operation');
            return return_data(1, $max_sort, '添加成功', 'json');
        }else{
            return return_data(3, '', '添加失败，请联系管理员', 'json');
        }
    }

    /**
     * 网站设置分类信息修改表单
     *
     * @return void
     */
    public function set_category_update($id){
        $category = SysSetCategory::find($id);
        $has_data = "true";
        if(!$category){
            $has_data = "false";
        }
        View::assign('has_data', $has_data);
        View::assign('detail', $category);
        return View::fetch();
    }

    /**
     * 网站设置分类信息修改提交
     *
     * @return void
     */
    public function set_category_update_submit($id){
        $category_name = Request::instance()->param('category_name', '');
        $sort = Request::instance()->param('sort', 0);
        $validate = new \app\admin\validate\SetCategory;
        if(!$validate->scene('update')->check(['category_id'=> $id, 'category_name'=> $category_name, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError(), 'json');
        }
        $category = SysSetCategory::find($id);
        $old_category_name = $category->category_name;
        $category->category_name = $category_name;
        $category->sort = $sort;
        $res = $category->save();
        if($res){
            LogAdminOperation::create_data('网站设置分类信息修改：'.$old_category_name.'->'.$category_name, 'operation');
            return return_data(1, '', '修改成功', 'json');
        }else{
            return return_data(3, '', '修改失败,请联系管理员', 'json');
        }
    }

    /**
     * 网站设置分类信息删除提交
     *
     * @return void
     */
    public function set_category_delete_submit($id){
        $category = SysSetCategory::where('category_id', $id)->find();
        $res = SysSetCategory::where('category_id', $id)->delete();
        if($res){
            LogAdminOperation::create_data('网站设置分类信息删除：'.$category->category_name, 'operation');
            return return_data(1, '', '删除成功', 'json');
        }else{
            return return_data(3, '', '删除失败,请联系管理员', 'json');
        }
    }

    /**
     * 网站设置信息添加表单
     *
     * @return void
     */
    public function set_set_add(){
        $max_sort = SysSet::order('sort desc')->value('sort');
        View::assign('max_sort', $max_sort);
        $category = SysSetCategory::order('sort asc')->select();
        View::assign('category', $category);
        return View::fetch();
    }

    /**
     * 网站设置信息添加提交
     *
     * @return void
     */
    public function set_set_add_submit(){
        $category_id = Request::instance()->param('category_id', '');
        $title = Request::instance()->param('title', '');
        $sign = Request::instance()->param('sign', '');
        $type = Request::instance()->param('type', '');
        $value = Request::instance()->param('value', '');
        $sort = Request::instance()->param('sort', 0);
        $validate = new \app\admin\validate\Set;
        if(!$validate->scene('add')->check(['category_id'=> $category_id, 'title'=> $title, 'sign'=> $sign, 'sort'=> $sort, 'type'=> $type, 'value'=> $value])){
            return return_data(2, '', $validate->getError(), 'json');
        }
        $res = SysSet::create([
            'category_id'=> $category_id,
            'title'=> $title,
            'sign'=> $sign,
            'type'=> $type,
            'value'=> $value,
            'sort'=> $sort
        ]);
        if($res){
            $max_sort = SysSet::order('sort desc')->value('sort');
            LogAdminOperation::create_data('网站设置信息添加：'.$title, 'operation');
            return return_data(1, $max_sort, '添加成功', 'json');
        }else{
            return return_data(3, '', '添加失败，请联系管理员', 'json');
        }
    }

    /**
     * 网站设置信息修改表单
     *
     * @return void
     */
    public function set_set_update($id){
        $detail = SysSet::find($id);
        $has_data = "true";
        if(!$detail){
            $has_data = "false";
        }
        View::assign('has_data', $has_data);
        View::assign('detail', $detail);
        $category = SysSetCategory::order('sort asc')->select();
        View::assign('category', $category);
        return View::fetch();
    }

    /**
     * 网站设置信息修改提交
     *
     * @return void
     */
    public function set_set_update_submit($id){
        $title = Request::instance()->param('title', '');
        $sign = Request::instance()->param('sign', '');
        $type = Request::instance()->param('type', '');
        $value = Request::instance()->param('value', '');
        $sort = Request::instance()->param('sort', 0);
        $category_id = Request::instance()->param('category_id', 0);
        $validate = new \app\admin\validate\Set;
        if(!$validate->scene('update')->check(['title'=> $title, 'category_id'=> $category_id, 'sign'=> $sign, 'sort'=> $sort, 'type'=> $type, 'value'=> $value, 'set_id'=> $id])){
            return return_data(2, '', $validate->getError(), 'json');
        }
        $set = SysSet::find($id);
        $old_set_title = $set->title;
        $set->title = $title;
        $set->sign = $sign;
        $set->type = $type;
        $set->value = $value;
        $set->sort = $sort;
        $set->category_id = $category_id;
        $res = $set->save();
        if($res){
            LogAdminOperation::create_data('网站设置信息修改：'.$old_set_title.'->'.$title, 'operation');
            return return_data(1, '', '修改成功', 'json');
        }else{
            return return_data(3, '', '修改失败,请联系管理员', 'json');
        }
    }

    /**
     * 网站设置信息删除提交
     *
     * @return void
     */
    public function set_set_delete_submit($id){
        $set = SysSet::where('set_id', $id)->find();
        $res = SysSet::where('set_id', $id)->delete();
        if($res){
            LogAdminOperation::create_data('网站设置信息删除：'.$set->title, 'operation');
            return return_data(1, '', '删除成功', 'json');
        }else{
            return return_data(3, '', '删除失败,请联系管理员', 'json');
        }
    }

    /**
     * 网站设置信息值提交
     *
     * @return void
     */
    public function set_set_value_submit($id){
        $value = Request::instance()->param('value', '');
        $set = SysSet::find($id);
        if(!$set){
            return return_data(3, '', '非法操作', 'json');
        }
        $set->value = $value;
        $res = $set->save();
        if($res){
            LogAdminOperation::create_data('网站设置信息值修改：'.$set->title, 'operation');
            return return_data(1, '', '设置成功', 'json');
        }else{
            return return_data(3, '', '设置失败,请联系管理员', 'json');
        }
    }
}