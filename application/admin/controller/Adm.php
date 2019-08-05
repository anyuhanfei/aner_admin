<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\AdmRole;
use app\admin\model\SysModule;
use app\admin\model\SysModuleAction;


class Adm extends Base{
    /**
     * 角色管理-列表
     *
     * @return void
     */
    public function role(){
        $list = Admrole::order('role_id desc')->select();
        $this->assign('list', $list);
        return $this->fetch();
    }

    /**
     * 角色信息添加表单
     *
     * @return void
     */
    public function role_add(){
        $max_sort = Admrole::order('sort desc')->value('sort');
        $this->assign('max_sort', $max_sort);
        return $this->fetch();
    }

    /**
     * 角色信息添加提交
     *
     * @return void
     */
    public function role_add_submit(){
        $role_name = Request::instance()->param('role_name', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', '');
        $validate = Loader::validate('role');
        if(!$validate->scene('add')->check(['role_name'=> $role_name])){
            return return_data(2, '', $validate->getError());
        }
        $res = Admrole::create([
            'role_name'=> $role_name,
            'remark'=> $remark,
            'sort'=> $sort
        ]);
        if($res){
            $max_sort = Admrole::order('sort desc')->value('sort');
            return return_data(1, $max_sort, '添加成功');
        }else{
            return return_data(3, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 角色信息修改表单
     *
     * @return void
     */
    public function role_update(){
        $role_id = Request::instance()->param('role_id', 0);
        $role = Admrole::get($role_id);
        $has_data = "true";
        if(!$role){
            $has_data = "false";
        }
        $this->assign('has_data', $has_data);
        $this->assign('detail', $role);
        return $this->fetch();
    }

    /**
     * 角色信息修改提交
     *
     * @return void
     */
    public function role_update_submit(){
        $role_id = Request::instance()->param('role_id', '');
        $role_name = Request::instance()->param('role_name', '');
        $remark = Request::instance()->param('remark', '');
        $sort = Request::instance()->param('sort', '');
        $validate = Loader::validate('role');
        if(!$validate->scene('update')->check(['role_id'=> $role_id, 'role_name'=> $role_name, 'remark'=> $remark, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $role = Admrole::get($role_id);
        $role->role_name = $role_name;
        $role->remark = $remark;
        $role->sort = $sort;
        $res = $role->save();
        if($res){
            return return_data(1, '', '修改成功');
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
        }
    }

    /**
     * 角色信息删除提交
     *
     * @return void
     */
    public function role_delete_submit(){
        $role_id = Request::instance()->param('role_id', '');
        $res = Admrole::where('role_id', $role_id)->delete();
        if($res){
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 角色权限设置表单
     *
     * @return void
     */
    public function role_power(){
        $role_id = Request::instance()->param('role_id', '');
        $role = Admrole::get($role_id);
        $module = SysModule::order('sort asc')->select();
        $action = SysModuleAction::order('sort asc')->select();
        foreach($action as &$v){
            if(strpos($role->power, ",$v->action_id,") === false){
                $v['has_power'] = 0;
            }else{
                $v['has_power'] = 1;
            }
        }
        $this->assign('module', $module);
        $this->assign('action', $action);
        $this->assign('role', $role);
        return $this->fetch();
    }

    /**
     * 角色权限设置提交
     *
     * @return void
     */
    public function role_power_submit(){
        $action_ids = Request::instance()->param('action_ids', '');
        $role_id = Request::instance()->param('role_id', 0);
        $role = AdmRole::get($role_id);
        $role->power = $action_ids;
        $res = $role->save();
        if($res){
            return return_data(1, '', '修改成功');
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
        }
    }
}