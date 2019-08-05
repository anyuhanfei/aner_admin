<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\SysModule;
use app\admin\model\SysModuleAction;
use app\admin\model\SysCatalog;


class Developer extends Base{
    /**
     * 模块管理-列表
     *
     * @return void
     */
    public function module(){
        $list = SysModule::order('sort asc')->select();
        $this->assign('list', $list);
        return $this->fetch();
    }

    /**
     * 模块信息添加表单
     *
     * @return void
     */
    public function module_add(){
        $max_sort = SysModule::order('sort desc')->value('sort');
        $this->assign('max_sort', $max_sort);
        return $this->fetch();
    }

    /**
     * 模块信息添加提交
     *
     * @return void
     */
    public function module_add_submit(){
        $title = Request::instance()->param('title', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', '');
        $validate = Loader::validate('module');
        if(!$validate->scene('add')->check(['title'=> $title])){
            return return_data(2, '', $validate->getError());
        }
        $res = SysModule::create([
            'title'=> $title,
            'remark'=> $remark,
            'sort'=> $sort
        ]);
        if($res){
            $max_sort = SysModule::order('sort desc')->value('sort');
            return return_data(1, $max_sort, '添加成功');
        }else{
            return return_data(3, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 模块信息修改表单
     *
     * @return void
     */
    public function module_update(){
        $module_id = Request::instance()->param('module_id', 0);
        $module = SysModule::get($module_id);
        $has_data = "true";
        if(!$module){
            $has_data = "false";
        }
        $this->assign('has_data', $has_data);
        $this->assign('detail', $module);
        return $this->fetch();
    }

    /**
     * 模块信息修改提交
     *
     * @return void
     */
    public function module_update_submit(){
        $module_id = Request::instance()->param('module_id', '');
        $title = Request::instance()->param('title', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', '');
        $validate = Loader::validate('module');
        if(!$validate->scene('update')->check(['module_id'=> $module_id, 'title'=> $title, 'remark'=> $remark, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $module = SysModule::get($module_id);
        $module->title = $title;
        $module->remark = $remark;
        $module->sort = $sort;
        $res = $module->save();
        if($res){
            return return_data(1, '', '修改成功');
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
        }
    }

    /**
     * 模块信息删除提交
     *
     * @return void
     */
    public function module_delete_submit(){
        $module_id = Request::instance()->param('module_id', '');
        $res = SysModule::where('module_id', $module_id)->delete();
        if($res){
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 方法模块-列表
     *
     * @return void
     */
    public function action(){
        $module = SysModule::order('sort asc')->select();
        $this->assign('list', $module);
        return $this->fetch();
    }

    /**
     * 方法信息添加表单
     *
     * @return void
     */
    public function action_add(){
        $max_sort = SysModuleAction::order('sort desc')->value('sort');
        $module = SysModule::order('sort asc')->select();
        $this->assign('max_sort', $max_sort);
        $this->assign('module', $module);
        return $this->fetch();
    }

    /**
     * 方法信息添加提交
     *
     * @return void
     */
    public function action_add_submit(){
        $title = Request::instance()->param('title', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', '');
        $path = Request::instance()->param('path', '');
        $module_id = Request::instance()->param('module_id', 0);
        $validate = Loader::validate('action');
        if(!$validate->scene('add')->check(['title'=> $title, 'path'=> $path, 'module_id'=> $module_id, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $res = SysModuleAction::create([
            'title'=> $title,
            'module_id'=> $module_id,
            'path'=> $path,
            'remark'=> $remark,
            'sort'=> $sort
        ]);
        if($res){
            $max_sort = SysModuleAction::order('sort desc')->value('sort');
            return return_data(1, $max_sort, '添加成功');
        }else{
            return return_data(3, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 方法信息修改表单
     *
     * @return void
     */
    public function action_update(){
        $action_id = Request::instance()->param('action_id', 0);
        $action = SysModuleAction::get($action_id);
        $has_data = "true";
        if(!$action){
            $has_data = "false";
        }
        $module = SysModule::order('sort asc')->select();
        $this->assign('has_data', $has_data);
        $this->assign('detail', $action);
        $this->assign('module', $module);
        return $this->fetch();
    }

    /**
     * 方法信息修改提交
     *
     * @return void
     */
    public function action_update_submit(){
        $action_id = Request::instance()->param('action_id', 0);
        $title = Request::instance()->param('title', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', '');
        $path = Request::instance()->param('path', '');
        $module_id = Request::instance()->param('module_id', 0);
        $validate = Loader::validate('action');
        if(!$validate->scene('update')->check(['action_id'=> $action_id, 'path'=> $path, 'module_id'=> $module_id, 'title'=> $title, 'remark'=> $remark, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $module = SysModuleAction::get($action_id);
        $module->title = $title;
        $module->path = $path;
        $module->module_id = $module_id;
        $module->remark = $remark;
        $module->sort = $sort;
        $res = $module->save();
        if($res){
            return return_data(1, '', '修改成功');
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
        }
    }

    /**
     * 方法信息删除提交
     *
     * @return void
     */
    public function action_delete_submit(){
        $action_id = Request::instance()->param('action_id', '');
        $res = SysModuleAction::where('action_id', $action_id)->delete();
        if($res){
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 后台目录
     *
     * @return void
     */
    public function catalog(){
        $list = SysCatalog::order('sort asc')->select();
        $this->assign('list', $list);
        return $this->fetch();
    }

    /**
     * 后台目录添加表单
     *
     * @return void
     */
    public function catalog_add(){
        $module = SysModule::order('sort asc')->select();
        $action = SysModuleAction::order('sort asc')->select();
        $max_sort = SysCatalog::order('sort desc')->value('sort');
        $catalog = SysCatalog::where('top_id', 0)->where('path', '')->select();
        $this->assign('module', $module);
        $this->assign('action', $action);
        $this->assign('max_sort', $max_sort);
        $this->assign('catalog', $catalog);
        return $this->fetch();
    }

    /**
     * 后台目录添加提交
     *
     * @return void
     */
    public function catalog_add_submit(){
        $title = Request::instance()->param('title', '');
        $icon = Request::instance()->param('icon', '');
        $action_id = Request::instance()->param('action_id', 0);
        $module_id = Request::instance()->param('module_id', 0);
        $top_id = Request::instance()->param('top_id', 0);
        $sort = Request::instance()->param('sort', 0);
        $validate = Loader::validate('catalog');
        if(!$validate->scene('add')->check(['title'=> $title, 'icon'=> $icon, 'action_id'=> $action_id, 'module_id'=> $module_id, 'sort'=> $sort, 'top_id'=> $top_id])){
            return return_data(2, '', $validate->getError());
        }
        $action_path = SysModuleAction::where('action_id', $action_id)->value('path');
        $path = $action_path ? $action_path : '';
        $res = SysCatalog::create([
            'title'=> $title,
            'icon'=> $icon,
            'top_id'=> $top_id,
            'action_id'=> $action_id,
            'module_id'=> $module_id,
            'path'=> $path,
            'sort'=> $sort,
        ]);
        if($res){
            $max_sort = SysCatalog::order('sort desc')->value('sort');
            return return_data(1, $max_sort, '添加成功');
        }else{
            return return_data(3, '', '添加失败,请联系管理员');
        }
    }

    /**
     * 后台目录修改表单
     *
     * @return void
     */
    public function catalog_update(){
        $catalog_id = Request::instance()->param('catalog_id', 0);
        $detail = SysCatalog::where('catalog_id', $catalog_id)->find();
        $module = SysModule::order('sort asc')->select();
        $action = SysModuleAction::order('sort asc')->select();
        $catalog = SysCatalog::where('top_id', 0)->where('path', '')->select();
        $this->assign('module', $module);
        $this->assign('detail', $detail);
        $this->assign('action', $action);
        $this->assign('catalog', $catalog);
        return $this->fetch();
    }

    /**
     * 后台目录修改提交
     *
     * @return void
     */
    public function catalog_update_submit(){
        $title = Request::instance()->param('title', '');
        $icon = Request::instance()->param('icon', '');
        $action_id = Request::instance()->param('action_id', 0);
        $module_id = Request::instance()->param('module_id', 0);
        $catalog_id = Request::instance()->param('catalog_id', 0);
        $top_id = Request::instance()->param('top_id', 0);
        $sort = Request::instance()->param('sort', 0);
        $validate = Loader::validate('catalog');
        if(!$validate->scene('update')->check(['title'=> $title, 'icon'=> $icon, 'action_id'=> $action_id, 'module_id'=> $module_id, 'sort'=> $sort, 'top_id'=> $top_id, 'catalog_id'=> $catalog_id])){
            return return_data(2, '', $validate->getError());
        }
        $action_path = SysModuleAction::where('action_id', $action_id)->value('path');
        $catalog = SysCatalog::get($catalog_id);
        $catalog->title = $title;
        $catalog->icon = $icon;
        $catalog->action_id = $action_id;
        $catalog->module_id = $module_id;
        $catalog->top_id = $top_id;
        $catalog->sort = $sort;
        $catalog->path = $action_path ? $action_path : '';
        $res = $catalog->save();
        if($res){
            return return_data(1, '', '修改成功');
        }else{
            return return_data(3, '', '修改失败，请联系管理员');
        }
    }

    /**
     * 后台目录删除提交
     *
     * @return void
     */
    public function catalog_delete_submit(){
        $catalog_id = Request::instance()->param('catalog_id', '');
        $res = SysCatalog::where('catalog_id', $catalog_id)->delete();
        if($res){
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }
}