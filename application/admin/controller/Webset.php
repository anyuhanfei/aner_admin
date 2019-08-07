<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Controller;
use think\Loader;

use app\admin\model\SysBasic;
use app\admin\model\SysSet;
use app\admin\model\SysSetCategory;


class Webset extends Base{
    /**
     * 基本信息
     *
     * @return void
     */
    public function basic(){
        $detail = SysBasic::find();
        if(!$detail){
            SysBasic::create(['id'=> 1]);
            $detail = SysBasic::find();
        }
        $this->assign('detail', $detail);
        return $this->fetch();
    }

    /**
     * 基本信息修改提交
     *
     * @return void
     */
    public function basic_submit(){
        $data = Request::instance()->param();
        $model = new SysBasic();
        $res = $model->allowField(true)->save($_POST, ['id'=> 1]);
        if($res){
            return return_data(1, '', '修改成功');
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
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
        $this->assign('list', $list);
        $this->assign('category', $category);
        return $this->fetch();
    }

    /**
     * 网站设置分类信息添加表单
     *
     * @return void
     */
    public function set_category_add(){
        $max_sort = SysSetCategory::order('sort desc')->value('sort');
        $this->assign('max_sort', $max_sort);
        return $this->fetch();
    }

    /**
     * 网站设置分类信息添加提交
     *
     * @return void
     */
    public function set_category_add_submit(){
        $category_name = Request::instance()->param('category_name', '');
        $sort = Request::instance()->param('sort', 0);
        $validate = Loader::validate('set_category');
        if(!$validate->scene('add')->check(['category_name'=> $category_name, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $res = SysSetCategory::create([
            'category_name'=> $category_name,
            'sort'=> $sort
        ]);
        if($res){
            $max_sort = SysSetCategory::order('sort desc')->value('sort');
            return return_data(1, $max_sort, '添加成功');
        }else{
            return return_data(3, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 网站设置分类信息修改表单
     *
     * @return void
     */
    public function set_category_update(){
        $category_id = Request::instance()->param('category_id', 0);
        $category = SysSetCategory::get($category_id);
        $has_data = "true";
        if(!$category){
            $has_data = "false";
        }
        $this->assign('has_data', $has_data);
        $this->assign('detail', $category);
        return $this->fetch();
    }

    /**
     * 网站设置分类信息修改提交
     *
     * @return void
     */
    public function set_category_update_submit(){
        $category_name = Request::instance()->param('category_name', '');
        $sort = Request::instance()->param('sort', 0);
        $category_id = Request::instance()->param('category_id', 0);
        $validate = Loader::validate('set_category');
        if(!$validate->scene('update')->check(['category_id'=> $category_id, 'category_name'=> $category_name, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $category = SysSetCategory::get($category_id);
        $category->category_name = $category_name;
        $category->sort = $sort;
        $res = $category->save();
        if($res){
            return return_data(1, '', '修改成功');
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
        }
    }

    /**
     * 网站设置分类信息删除提交
     *
     * @return void
     */
    public function set_category_delete_submit(){
        $category_id = Request::instance()->param('category_id', '');
        $res = SysSetCategory::where('category_id', $category_id)->delete();
        if($res){
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 网站设置信息添加表单
     *
     * @return void
     */
    public function set_set_add(){
        $max_sort = SysSet::order('sort desc')->value('sort');
        $this->assign('max_sort', $max_sort);
        $category = SysSetCategory::order('sort asc')->select();
        $this->assign('category', $category);
        return $this->fetch();
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
        $validate = Loader::validate('set');
        if(!$validate->scene('add')->check(['category_id'=> $category_id, 'title'=> $title, 'sign'=> $sign, 'sort'=> $sort, 'type'=> $type, 'value'=> $value])){
            return return_data(2, '', $validate->getError());
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
            return return_data(1, $max_sort, '添加成功');
        }else{
            return return_data(3, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 网站设置信息修改表单
     *
     * @return void
     */
    public function set_set_update(){
        $set_id = Request::instance()->param('set_id', 0);
        $detail = SysSet::get($set_id);
        $has_data = "true";
        if(!$detail){
            $has_data = "false";
        }
        $this->assign('has_data', $has_data);
        $this->assign('detail', $detail);
        $category = SysSetCategory::order('sort asc')->select();
        $this->assign('category', $category);
        return $this->fetch();
    }

    /**
     * 网站设置信息修改提交
     *
     * @return void
     */
    public function set_set_update_submit(){
        $title = Request::instance()->param('title', '');
        $sign = Request::instance()->param('sign', '');
        $type = Request::instance()->param('type', '');
        $value = Request::instance()->param('value', '');
        $set_id = Request::instance()->param('set_id', '');
        $sort = Request::instance()->param('sort', 0);
        $category_id = Request::instance()->param('category_id', 0);
        $validate = Loader::validate('set');
        if(!$validate->scene('update')->check(['title'=> $title, 'category_id'=> $category_id, 'sign'=> $sign, 'sort'=> $sort, 'type'=> $type, 'value'=> $value, 'set_id'=> $set_id])){
            return return_data(2, '', $validate->getError());
        }
        $set = SysSet::get($set_id);
        $set->title = $title;
        $set->sign = $sign;
        $set->type = $type;
        $set->value = $value;
        $set->sort = $sort;
        $set->category_id = $category_id;
        $res = $set->save();
        if($res){
            return return_data(1, '', '修改成功');
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
        }
    }

    /**
     * 网站设置信息删除提交
     *
     * @return void
     */
    public function set_set_delete_submit(){
        $set_id = Request::instance()->param('set_id', '');
        $res = SysSet::where('set_id', $set_id)->delete();
        if($res){
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 网站设置信息值提交
     *
     * @return void
     */
    public function set_set_value_submit(){
        $set_id = Request::instance()->param('set_id', '');
        $value = Request::instance()->param('value', '');
        $set = SysSet::get($set_id);
        if(!$set){
            return return_data(3, '', '非法操作');
        }
        $set->value = $value;
        $res = $set->save();
        if($res){
            return return_data(1, '', '设置成功');
        }else{
            return return_data(3, '', '设置失败,请联系管理员');
        }
    }
}