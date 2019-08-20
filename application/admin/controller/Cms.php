<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\CmsTag;
use app\admin\model\CmsCategory;
use app\admin\model\LogAdminOperation;


class Cms extends Base{
    public function _initialize(){
        parent::_initialize();
        $this->assign('cms_tag_image_onoff', $this->cms_tag_image_onoff);
        $this->assign('cms_category_image_onoff', $this->cms_category_image_onoff);
    }

    /**
     * 文章标签管理-列表
     *
     * @return void
     */
    public function tag(){
        $list = CmsTag::order('sort asc, tag_id desc')->select();
        $this->assign('list', $list);
        return $this->fetch();
    }

    /**
     * 文章标签信息添加表单
     */
    public function tag_add(){
        $max_sort = CmsTag::order('sort desc')->value('sort');
        $this->assign('max_sort', $max_sort);
        return $this->fetch();
    }

    /**
     * 文章标签信息添加提交
     *
     * @return void
     */
    public function tag_add_submit(){
        $tag_name = Request::instance()->param('tag_name', '');
        $sort = Request::instance()->param('sort', '');
        $tag_image = Request::instance()->file('tag_image');
        $validate = Loader::validate('tag');
        if(!$validate->scene('add')->check(['tag_name'=> $tag_name, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $path = '';
        if($this->cms_tag_image_onoff == 'on'){
            if(!$tag_image){
                return return_data(2, '', '请上传标签图片');
            }
            $image_res = file_upload($tag_image, 'tag');
            $path = $image_res['file_path'];
        }
        $res = CmsTag::create(['tag_name'=> $tag_name, 'sort'=> $sort, 'tag_image'=> $path]);
        if($res){
            LogAdminOperation::create_data('文章标签信息添加：'.$tag_name, 'operation');
            return return_data(1, '', '添加成功');
        }else{
            if($path != ''){
                delete_image($path);
            }
            return return_data(2, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 文章标签信息修改表单
     *
     * @return void
     */
    public function tag_update($id){
        $tag = CmsTag::get($id);
        $has_data = "true";
        if(!$tag){
            $has_data = "false";
        }
        $this->assign('has_data', $has_data);
        $this->assign('detail', $tag);
        return $this->fetch();
    }

    /**
     * 文章标签信息修改提交
     *
     * @return void
     */
    public function tag_update_submit($id){
        $tag_name = Request::instance()->param('tag_name', '');
        $sort = Request::instance()->param('sort', '');
        $tag_image = Request::instance()->file('tag_image');
        $validate = Loader::validate('tag');
        if(!$validate->scene('update')->check(['tag_name'=> $tag_name, 'sort'=> $sort, 'tag_id'=> $id])){
            return return_data(2, '', $validate->getError());
        }
        $path = '';
        if($this->cms_tag_image_onoff == 'on'){
            if($tag_image){
                $image_res = file_upload($tag_image, 'tag');
                $path = $image_res['file_path'];
            }
        }
        $tag = CmsTag::get($id);
        $old_path = $tag->tag_image;
        $old_tag_name = $tag->tag_name;
        $tag->tag_name = $tag_name;
        $tag->sort = $sort;
        $tag->tag_image = $path == '' ? $tag->tag_image : $path;
        $res = $tag->save();
        if($res){
            $path != '' ? delete_image($old_path) : false;
            LogAdminOperation::create_data('文章标签信息修改：'.$old_tag_name.'->'.$tag->tag_name, 'operation');
            return return_data(1, array('tag_id'=> $tag->tag_id, 'tag_image'=> $tag->tag_image), '修改成功');
        }else{
            $path != '' ? delete_image($path) : false;
            return return_data(2, '', '修改失败或没有要修改的信息');
        }
    }

    /**
     * 文章标签信息删除提交
     *
     * @return void
     */
    public function tag_delete_submit($id){
        $tag = CmsTag::get($id);
        $res = CmsTag::where('tag_id', $id)->delete();
        if($res){
            delete_image($tag->tag_image);
            LogAdminOperation::create_data('文章标签信息删除：'.$tag->tag_name, 'operation');
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 文章分类管理-列表
     *
     * @return void
     */
    public function category(){
        $list = CmsCategory::order('sort asc, category_id desc')->select();
        $this->assign('list', $list);
        return $this->fetch();
    }

    /**
     * 文章分类信息添加表单
     */
    public function category_add(){
        $max_sort = CmsCategory::order('sort desc')->value('sort');
        $this->assign('max_sort', $max_sort);
        return $this->fetch();
    }

    /**
     * 文章分类信息添加提交
     *
     * @return void
     */
    public function category_add_submit(){
        $category_name = Request::instance()->param('category_name', '');
        $sort = Request::instance()->param('sort', '');
        $category_image = Request::instance()->file('category_image');
        $validate = Loader::validate('category');
        if(!$validate->scene('add')->check(['category_name'=> $category_name, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $path = '';
        if($this->cms_category_image_onoff == 'on'){
            if(!$category_image){
                return return_data(2, '', '请上传标签图片');
            }
            $image_res = file_upload($category_image, 'category');
            $path = $image_res['file_path'];
        }
        $res = CmsCategory::create(['category_name'=> $category_name, 'sort'=> $sort, 'category_image'=> $path]);
        if($res){
            LogAdminOperation::create_data('文章分类信息添加：'.$category_name, 'operation');
            return return_data(1, '', '添加成功');
        }else{
            if($path != ''){
                delete_image($path);
            }
            return return_data(2, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 文章分类信息修改表单
     *
     * @return void
     */
    public function category_update($id){
        $category = CmsCategory::get($id);
        $has_data = "true";
        if(!$category){
            $has_data = "false";
        }
        $this->assign('has_data', $has_data);
        $this->assign('detail', $category);
        return $this->fetch();
    }

    /**
     * 文章分类信息修改提交
     *
     * @return void
     */
    public function category_update_submit($id){
        $category_name = Request::instance()->param('category_name', '');
        $sort = Request::instance()->param('sort', '');
        $category_image = Request::instance()->file('category_image');
        $validate = Loader::validate('category');
        if(!$validate->scene('update')->check(['category_name'=> $category_name, 'sort'=> $sort, 'category_id'=> $id])){
            return return_data(2, '', $validate->getError());
        }
        $path = '';
        if($this->cms_category_image_onoff == 'on'){
            if($category_image){
                $image_res = file_upload($category_image, 'category');
                $path = $image_res['file_path'];
            }
        }
        $category = CmsCategory::get($id);
        $old_path = $category->category_image;
        $old_category_name = $category->category_name;
        $category->category_name = $category_name;
        $category->sort = $sort;
        $category->category_image = $path == '' ? $category->category_image : $path;
        $res = $category->save();
        if($res){
            $path != '' ? delete_image($old_path) : false;
            LogAdminOperation::create_data('文章分类信息修改：'.$old_category_name.'->'.$category->category_name, 'operation');
            return return_data(1, array('category_id'=> $category->category_id, 'category_image'=> $category->category_image), '修改成功');
        }else{
            $path != '' ? delete_image($path) : false;
            return return_data(2, '', '修改失败或没有要修改的信息');
        }
    }

    /**
     * 文章分类信息删除提交
     *
     * @return void
     */
    public function category_delete_submit($id){
        $category = CmsCategory::get($id);
        $res = CmsCategory::where('category_id', $id)->delete();
        if($res){
            delete_image($category->category_image);
            LogAdminOperation::create_data('文章分类信息删除：'.$category->category_name, 'operation');
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    public function article(){

    }
}