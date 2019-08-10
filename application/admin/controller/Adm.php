<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\AdmRole;
use app\admin\model\SysModule;
use app\admin\model\SysModuleAction;
use app\admin\model\AdmAdmin;
use app\admin\model\LogAdminOperation;


class Adm extends Base{
    /**
     * 角色管理-列表
     *
     * @return void
     */
    public function role(){
        $list = Admrole::order('sort asc')->select();
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
            LogAdminOperation::create_data('角色信息添加：'.$role_name, 'operation');
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
        $old_role_name = $role->role_name;
        $role->role_name = $role_name;
        $role->remark = $remark;
        $role->sort = $sort;
        $res = $role->save();
        if($res){
            LogAdminOperation::create_data('角色信息修改：'.$old_role_name.'->'.$role_name, 'operation');
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
        $role = Admrole::where('role_id', $role_id)->find();
        $res = Admrole::where('role_id', $role_id)->delete();
        if($res){
            LogAdminOperation::create_data('角色信息删除：'.$role->role_name, 'operation');
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
            LogAdminOperation::create_data('角色信息权限设置：'.$role->role_name, 'operation');
            return return_data(1, '', '修改成功');
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
        }
    }

    /**
     * 管理员列表
     *
     * @return void
     */
    public function admin(){
        $list = AdmAdmin::order('admin_id desc')->select();
        $this->assign('list', $list);
        $role = AdmRole::order('sort asc')->select();
        $this->assign('role', $role);
        return $this->fetch();
    }

    /**
     * 管理员信息添加表单
     *
     * @return void
     */
    public function admin_add(){
        return $this->fetch();
    }

    /**
     * 管理员信息添加提交
     *
     * @return void
     */
    public function admin_add_submit(){
        $account = Request::instance()->param('account', '');
        $nickname = Request::instance()->param('nickname', '');
        $password = Request::instance()->param('password', '');
        $password_confirm = Request::instance()->param('password_confirm', '');
        $validate = Loader::validate('admin');
        if(!$validate->scene('add')->check(['account'=> $account, 'nickname'=> $nickname, 'password'=> $password, 'password_confirm'=> $password_confirm])){
            return return_data(2, '', $validate->getError());
        }
        $res = AdmAdmin::create([
            'account'=> $account,
            'nickname'=> $nickname,
            'password'=> md5($password)
        ]);
        if($res){
            LogAdminOperation::create_data('管理员信息添加：'.$account, 'operation');
            return return_data(1, '', '添加成功');
        }else{
            return return_data(3, '', '添加失败,请联系管理员');
        }
    }

    /**
     * 管理员信息修改表单
     *
     * @return void
     */
    public function admin_update(){
        $admin_id = Request::instance()->param('admin_id', 0);
        $admin = AdmAdmin::get($admin_id);
        $this->assign('detail', $admin);
        return $this->fetch();
    }

    /**
     * 管理员信息修改提交
     *
     * @return void
     */
    public function admin_update_submit(){
        $admin_id = Request::instance()->param('admin_id', 0);
        $account = Request::instance()->param('account', '');
        $nickname = Request::instance()->param('nickname', '');
        $password = Request::instance()->param('password', '');
        $validate = Loader::validate('admin');
        if(!$validate->scene('update')->check(['admin_id'=> $admin_id, 'account'=> $account, 'nickname'=> $nickname])){
            return return_data(2, '', $validate->getError());
        }
        $admin = AdmAdmin::get($admin_id);
        $old_admin_account = $admin->account;
        $admin->account = $account;
        $admin->nickname = $nickname;
        $admin->password = $password == '' ? $admin->password : md5($password);
        $res = $admin->save();
        if($res){
            LogAdminOperation::create_data('管理员信息修改：'.$old_admin_account.'->'.$account, 'operation');
            return return_data(1, '', '修改成功');
        }else{
            return return_data(2, '', '未修改任何信息或修改失败，请检查原因');
        }
    }

    /**
     * 管理员信息删除提交
     *
     * @return void
     */
    public function admin_delete_submit(){
        $admin_id = Request::instance()->param('admin_id', '');
        $admin = AdmAdmin::where('admin_id', $admin_id)->find();
        $res = AdmAdmin::where('admin_id', $admin_id)->delete();
        if($res){
            LogAdminOperation::create_data('管理员信息删除：'.$admin->account, 'operation');
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 分配管理员角色
     *
     * @return void
     */
    public function admin_allot(){
        $admin_id = Request::instance()->param('admin_id', '');
        $role_id = Request::instance()->param('role_id', '');
        $admin = AdmAdmin::get($admin_id);
        $role = AdmRole::get($role_id);
        if(!$admin && !$role){
            return return_data(2, '', '非法操作');
        }
        if($role->role_id == $admin->role_id){
            return return_data(2, '', '已经是此角色了');
        }
        $admin->role_id = $role_id;
        $res = $admin->save();
        if($res){
            LogAdminOperation::create_data('分配角色给管理员：'.$admin->account.'->'.$role->role_name, 'operation');
            return return_data(1, array('admin_id'=> $admin_id, 'role_name'=> $admin->role->role_name), '分配角色成功');
        }else{
            return return_data(3, '', '分配角色失败,请联系管理员');
        }
    }
}