<?php
namespace app\admin\controller;

use think\facade\View;
use think\facade\Session;
use think\facade\Request;

use app\admin\controller\Admin;

use app\admin\model\SysModule;
use app\admin\model\SysModuleAction;
use app\admin\model\SysCatalog;
use app\admin\model\LogAdminOperation;


class Developer extends Admin{
    /**
     * 模块管理-列表
     *
     * @return void
     */
    public function module(){
        $list = SysModule::order('sort asc')->select();
        View::assign('list', $list);
        return View::fetch();
    }

    /**
     * 模块信息添加表单
     *
     * @return void
     */
    public function module_add(){
        $max_sort = SysModule::order('sort desc')->value('sort');
        View::assign('max_sort', $max_sort);
        return View::fetch();
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
        $validate = new \app\admin\validate\Module;
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
            LogAdminOperation::create_data('模块信息添加：'.$title, 'operation');
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
    public function module_update($id){
        $module = SysModule::find($id);
        $has_data = "true";
        if(!$module){
            $has_data = "false";
        }
        View::assign('has_data', $has_data);
        View::assign('detail', $module);
        return View::fetch();
    }

    /**
     * 模块信息修改提交
     *
     * @return void
     */
    public function module_update_submit($id){
        $title = Request::instance()->param('title', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', '');
        $validate = new \app\admin\validate\Module;
        if(!$validate->scene('update')->check(['module_id'=> $id, 'title'=> $title, 'remark'=> $remark, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $module = SysModule::find($id);
        $old_module_title = $module->title;
        $module->title = $title;
        $module->remark = $remark;
        $module->sort = $sort;
        $res = $module->save();
        if($res){
            LogAdminOperation::create_data('模块信息修改：'.$old_module_title.'->'.$title, 'operation');
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
    public function module_delete_submit($id){
        $module = SysModule::where('module_id', $id)->find();
        $res = SysModule::where('module_id', $id)->delete();
        if($res){
            LogAdminOperation::create_data('模块信息删除：'.$module->title, 'operation');
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
        View::assign('list', $module);
        return View::fetch();
    }

    /**
     * 方法信息添加表单
     *
     * @return void
     */
    public function action_add(){
        $max_sort = SysModuleAction::order('sort desc')->value('sort');
        $module = SysModule::order('sort asc')->select();
        View::assign('max_sort', $max_sort);
        View::assign('module', $module);
        return View::fetch();
    }

    /**
     * 方法信息添加提交
     *
     * @return void
     */
    public function action_add_submit(){
        $title = Request::instance()->param('title', '');
        $type = Request::instance()->param('type', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', '');
        $path = Request::instance()->param('path', '');
        $route = Request::instance()->param('route', '');
        $module_id = Request::instance()->param('module_id', 0);
        $validate = new \app\admin\validate\Action;
        if(!$validate->scene('add')->check(['title'=> $title, $type=> 'type', 'path'=> $path, 'module_id'=> $module_id, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $res = SysModuleAction::create([
            'title'=> $title . '--' . $type,
            'module_id'=> $module_id,
            'path'=> $path,
            'route'=> $route,
            'remark'=> $remark,
            'sort'=> $sort
        ]);
        if($res){
            $max_sort = SysModuleAction::order('sort desc')->value('sort');
            LogAdminOperation::create_data('方法信息添加：'.$title, 'operation');
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
    public function action_update($id){
        $action = SysModuleAction::find($id);
        $has_data = "true";
        if(!$action){
            $has_data = "false";
        }
        $module = SysModule::order('sort asc')->select();
        $action->type = explode('--', $action->title)[1];
        $action->title = explode('--', $action->title)[0];
        View::assign('has_data', $has_data);
        View::assign('detail', $action);
        View::assign('module', $module);
        return View::fetch();
    }

    /**
     * 方法信息修改提交
     *
     * @return void
     */
    public function action_update_submit($id){
        $title = Request::instance()->param('title', '');
        $type = Request::instance()->param('type', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', '');
        $path = Request::instance()->param('path', '');
        $route = Request::instance()->param('route', '');
        $module_id = Request::instance()->param('module_id', 0);
        $validate = new \app\admin\validate\Action;
        if(!$validate->scene('update')->check(['action_id'=> $id, 'type'=> $type, 'path'=> $path, 'module_id'=> $module_id, 'title'=> $title, 'remark'=> $remark, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $module = SysModuleAction::find($id);
        $old_module_title = $module->title;
        $module->title = $title . '--' . $type;
        $module->path = $path;
        $module->route = $route;
        $module->module_id = $module_id;
        $module->remark = $remark;
        $module->sort = $sort;
        $res = $module->save();
        if($res){
            LogAdminOperation::create_data('方法信息修改：'.$old_module_title.'->'.$title, 'operation');
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
    public function action_delete_submit($id){
        $action = SysModuleAction::where('action_id', $id)->find();
        $res = SysModuleAction::where('action_id', $id)->delete();
        if($res){
            LogAdminOperation::create_data('方法信息删除：'.$action->title, 'operation');
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
        View::assign('list', $list);
        return View::fetch();
    }

    /**
     * 后台目录添加表单
     *
     * @return void
     */
    public function catalog_add(){
        $module = SysModule::order('sort asc')->select();
        $action = SysModuleAction::where('route', '<>', '')->order('sort asc')->select();
        $max_sort = SysCatalog::order('sort desc')->value('sort');
        $catalog = SysCatalog::where('top_id', 0)->where('path', '')->select();
        View::assign('module', $module);
        View::assign('action', $action);
        View::assign('max_sort', $max_sort);
        View::assign('catalog', $catalog);
        return View::fetch();
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
        $validate = new \app\admin\validate\Catalog;
        if(!$validate->scene('add')->check(['title'=> $title, 'icon'=> $icon, 'action_id'=> $action_id, 'module_id'=> $module_id, 'sort'=> $sort, 'top_id'=> $top_id])){
            return return_data(2, '', $validate->getError());
        }
        $action_path = $action_id != 0 ? SysModuleAction::field('path, route')->where('action_id', $action_id)->find() : '';
        $res = SysCatalog::create([
            'title'=> $title,
            'icon'=> $icon,
            'top_id'=> $top_id,
            'action_id'=> $action_id,
            'module_id'=> $module_id,
            'path'=> $action_path ? $action_path->path : '',
            'route'=> $action_path ? $action_path->route : '',
            'sort'=> $sort,
        ]);
        if($res){
            $max_sort = SysCatalog::order('sort desc')->value('sort');
            LogAdminOperation::create_data('后台目录添加：'.$title, 'operation');
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
    public function catalog_update($id){
        $detail = SysCatalog::where('catalog_id', $id)->find();
        $module = SysModule::order('sort asc')->select();
        $action = SysModuleAction::where('route', '<>', '')->order('sort asc')->select();
        $catalog = SysCatalog::where('top_id', 0)->where('path', '')->select();
        $has_data = "true";
        if(!$detail){
            $has_data = "false";
        }
        View::assign('has_data', $has_data);
        View::assign('module', $module);
        View::assign('detail', $detail);
        View::assign('action', $action);
        View::assign('catalog', $catalog);
        return View::fetch();
    }

    /**
     * 后台目录修改提交
     *
     * @return void
     */
    public function catalog_update_submit($id){
        $title = Request::instance()->param('title', '');
        $icon = Request::instance()->param('icon', '');
        $action_id = Request::instance()->param('action_id', 0);
        $module_id = Request::instance()->param('module_id', 0);
        $top_id = Request::instance()->param('top_id', 0);
        $sort = Request::instance()->param('sort', 0);
        $validate = new \app\admin\validate\Catalog;
        if(!$validate->scene('update')->check(['title'=> $title, 'icon'=> $icon, 'action_id'=> $action_id, 'module_id'=> $module_id, 'sort'=> $sort, 'top_id'=> $top_id, 'catalog_id'=> $id])){
            return return_data(2, '', $validate->getError());
        }
        $action_path = SysModuleAction::field('path, route')->where('action_id', $action_id)->find();
        $action_path = $action_id != 0 ? SysModuleAction::field('path, route')->where('action_id', $action_id)->find() : '';
        $catalog = SysCatalog::find($id);
        $old_catalog_title = $catalog->title;
        $catalog->title = $title;
        $catalog->icon = $icon;
        $catalog->action_id = $action_id;
        $catalog->module_id = $module_id;
        $catalog->top_id = $top_id;
        $catalog->sort = $sort;
        $catalog->path = $action_path ? $action_path->path : '';
        $catalog->route = $action_path ? $action_path->route : '';
        $res = $catalog->save();
        if($res){
            LogAdminOperation::create_data('后台目录修改：'.$old_catalog_title.'->'.$title, 'operation');
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
    public function catalog_delete_submit($id){
        $catalog = SysCatalog::where('catalog_id', $id)->find();
        $res = SysCatalog::where('catalog_id', $id)->delete();
        if($res){
            LogAdminOperation::create_data('后台目录删除：'.$catalog->title, 'operation');
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }
}