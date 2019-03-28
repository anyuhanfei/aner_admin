<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\CmsCategory;
use app\admin\model\CmsTag;

use app\admin\controller\Base;

class Cms extends Base{
    public function index(){
        return $this->redirect('Cms/cms');
    }

    /**
     * 文章列表
     *
     * @return void
     */
    public function cms(){

    }

    /**
     * 文章分类列表
     *
     * @return void
     */
    public function cms_category(){
        $list = CmsCategory::order('category_id desc')->paginate(10, false,['query'=>request()->param()]);
        $this->assign('list', $list);
        return $this->fetch('Cms/cms_category');
    }

    /**
     * 文章分类添加
     *
     * @return void
     */
    public function cms_category_add_submit(){
        $category_name = Request::instance()->param('category_name', '');
        $validate = Loader::validate('CmsCategory');
        if(!$validate->scene('add_name')->check(['category_name'=> $category_name])){
            return json_data(2, '', $validate->getError());
        }
        $res = CmsCategory::create_data($category_name);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了一条文章分类，名称为' . $category_name);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 文章分类修改
     *
     * @return void
     */
    public function cms_category_update_submit(){
        $category_id = Request::instance()->param('category_id', 0);
        $category_name = Request::instance()->param('category_name', '');
        $validate = Loader::validate('CmsCategory');
        if(!$validate->scene('update_name')->check(['category_id'=>$category_id, 'category_name'=> $category_name])){
            return json_data(2, '', $validate->getError());
        }
        $res = CmsCategory::update_data(['category_id'=> $category_id], ['category_name'=> $category_name]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了id为'. $category_id .'的文章分类名称，新名称为' . $category_name);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }
    
    /**
     * 文章标签列表
     *
     * @return void
     */
    public function tag(){
        $list = CmsTag::order('tag_id desc')->paginate(10, false,['query'=>request()->param()]);
        $this->assign('list', $list);
        return $this->fetch('Cms/cms_tag');
    }

    /**
     * 文章标签添加提交
     *
     * @return void
     */
    public function tag_add_submit(){
        $tag_name = Request::instance()->param('tag_name', '');
        $validate = Loader::validate('CmsTag');
        if(!$validate->scene('add')->check(['tag_name'=> $tag_name])){
            return json_data(2, '', $validate->getError());
        }
        $model = new CmsTag(['tag_name'=> $tag_name]);
        $res = $model->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了一条文章标签，名称为' . $tag_name);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 文章标签修改提交
     *
     * @return void
     */
    public function tag_update_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('CmsTag');
        if(!$validate->scene('update')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $model = new CmsTag();
        $res = $model->allowField(true)->save($data, ['id'=> $data['id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了一条文章标签，名称为' . $data['tag_name']);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 文章标签删除提交
     *
     * @return void
     */
    public function tag_delete_submit(){
        $id = Request::instance()->param('id', 0);
        $model = CmsTag::get($id);
        if(!$model){
            return json_data(2, '', '系统错误！');
        }
        $res = CmsTag::destroy($id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了一条文章标签，名称为' . $model->tag_name);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }
}
