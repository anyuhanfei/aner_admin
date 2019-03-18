<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Loader;

use app\admin\controller\Base;

use app\admin\model\SysModule;
use app\admin\model\LogAdminOperation;
use app\admin\model\SysModuleAction;

class Module extends Base{
    public function index(){
        $this->redirect('Module/module');
        return;
    }

    /**
     * 模块列表
     *
     * @return void
     */
    public function module(){
        $list = SysModule::order('sort asc')->paginate($this->page_number,false,['query'=>request()->param()]);
        $this->many_assign(['list'=> $list]);
        return $this->fetch('Module/module');
    }

    /**
     * 添加模块页面
     *
     * @return void
     */
    public function module_add(){
        return $this->fetch('Module/module_add');
    }

    /**
     * 添加模块
     *
     * @return void
     */
    public function module_add_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('Module');
        if(!$validate->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $module = new SysModule($data);
        $res = $module->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了一个模块,模块名称为：' . $data['module_name']);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 模块修改页面
     *
     * @return void
     */
    public function module_update(){
        $module_id = Request::instance()->param('module_id', 0);
        $detail = SysModule::get($module_id);
        $this->many_assign(['detail'=> $detail]);
        return $this->fetch('Module/module_update');
    }

    /**
     * 模块修改
     *
     * @return void
     */
    public function module_update_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('Module');
        if(!$validate->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $module = new SysModule();
        $res = $module->allowField(true)->save($data, ['module_id'=> $data['module_id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了模块' . $data['module_id'] . ',模块名称修改为：' . $data['module_name']);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 删除模块
     *
     * @return void
     */
    public function module_delete_submit(){
        $module_id = Request::instance()->param('module_id', 0);
        $module = SysModule::get($module_id);
        if(!$module){
            return json_data(2, '', '系统错误！');
        }
        $res = SysModule::destroy($module_id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了模块' . $module_id . ',模块名称为：' . $module->module_name);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }

    /**
     * 方法列表
     *
     * @return void
     */
    public function module_action(){
        $module = SysModule::order('sort asc')->select();
        $module_action = SysModuleAction::order("sort asc")->select();
        $this->get_module();
        $this->assign('action', $module_action);
        return $this->fetch('Module/module_action');
    }

    /**
     * 方法添加页面
     *
     * @return void
     */
    public function module_action_add(){
        $this->get_module();
        return $this->fetch('Module/module_action_add');
    }

    /**
     * 方法添加提交
     *
     * @return void
     */
    public function module_action_add_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('ModuleAction');
        if(!$validate->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $action = new SysModuleAction($data);
        $res = $action->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了一个方法,方法名称为：' . $data['action_name']);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 方法修改页面
     *
     * @return void
     */
    public function module_action_update(){
        $action_id = Request::instance()->param('action_id', 0);
        $detail = SysModuleAction::get($action_id);
        $this->many_assign(['detail'=> $detail]);
        $this->get_module();
        return $this->fetch('Module/module_action_update');
    }

    /**
     * 方法修改
     *
     * @return void
     */
    public function module_action_update_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('ModuleAction');
        if(!$validate->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $module = new SysModuleAction();
        $res = $module->allowField(true)->save($data, ['action_id'=> $data['action_id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了方法' . $data['action_id'] . ',方法名称修改为：' . $data['action_name']);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 删除方法
     *
     * @return void
     */
    public function module_action_delete_submit(){
        $action_id = Request::instance()->param('action_id', 0);
        $action = SysModuleAction::get($action_id);
        if(!$action){
            return json_data(2, '', '系统错误！');
        }
        $res = SysModuleAction::destroy($action_id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了方法' . $action_id . ',方法名称为：' . $action->action_name);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }



    /**
     * 内部使用，获取全部模块数据
     *
     * @return void
     */
    protected function get_module(){
        $module = SysModule::field('module_name, module_id')->order('sort asc')->select();
        $this->assign('module', $module);
    }
}