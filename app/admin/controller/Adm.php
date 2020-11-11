<?php
namespace app\admin\controller;

use think\facade\View;
use think\facade\Session;
use think\facade\Request;

use app\admin\controller\Admin;

use app\admin\model\AdmRole;
use app\admin\model\SysModule;
use app\admin\model\SysModuleAction;
use app\admin\model\AdmAdmin;


class Adm extends Admin{
    /**
     * 角色管理-列表
     *
     * @return void
     */
    public function role(){
        $list = Admrole::order('role_id asc')->select();
        View::assign('list', $list);
        return View::fetch();
    }

    /**
     * 角色信息添加表单
     *
     * @return void
     */
    public function role_add(){
        return View::fetch();
    }

    /**
     * 角色信息添加提交
     *
     * @return void
     */
    public function role_add_submit(){
        $role_name = Request::instance()->param('role_name', '');
        $remark = Request::instance()->param('remark', '');
        $validate = new \app\admin\validate\Role;
        if(!$validate->scene('add')->check(['role_name'=> $role_name])){
            return return_data(2, '', $validate->getError());
        }
        $res = Admrole::create([
            'role_name'=> $role_name,
            'remark'=> $remark,
        ]);
        if($res){
            return return_data(1, '', '添加成功', '角色信息添加：'.$role_name);
        }else{
            return return_data(3, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 角色信息修改表单
     *
     * @return void
     */
    public function role_update($id){
        $role = Admrole::find($id);
        $has_data = "true";
        if(!$role){
            $has_data = "false";
        }
        View::assign('has_data', $has_data);
        View::assign('detail', $role);
        return View::fetch();
    }

    /**
     * 角色信息修改提交
     *
     * @return void
     */
    public function role_update_submit($id){
        $role_name = Request::instance()->param('role_name', '');
        $remark = Request::instance()->param('remark', '');
        $validate = new \app\admin\validate\Role;
        if(!$validate->scene('update')->check(['role_id'=> $id, 'role_name'=> $role_name, 'remark'=> $remark])){
            return return_data(2, '', $validate->getError());
        }
        $role = Admrole::find($id);
        $old_role_name = $role->role_name;
        $role->role_name = $role_name;
        $role->remark = $remark;
        $res = $role->save();
        if($res){
            return return_data(1, '', '修改成功', '角色信息修改：'.$old_role_name.'->'.$role_name);
        }else{
            return return_data(3, '', '修改失败,请联系管理员');
        }
    }

    /**
     * 角色信息删除提交
     *
     * @return void
     */
    public function role_delete_submit($id){
        $role = Admrole::where('role_id', $id)->find();
        $res = Admrole::where('role_id', $id)->delete();
        if($res){
            return return_data(1, '', '删除成功', '角色信息删除：'.$role->role_name);
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 角色权限设置表单
     *
     * @return void
     */
    public function role_power($id){
        $role = Admrole::find($id);
        $module = SysModule::order('sort asc')->select();
        $action = SysModuleAction::order('sort asc')->select();
        foreach($action as &$v){
            if(strpos($role->power, ",$v->action_id,") === false){
                $v['has_power'] = 0;
            }else{
                $v['has_power'] = 1;
            }
        }
        View::assign('module', $module);
        View::assign('action', $action);
        View::assign('role', $role);
        return View::fetch();
    }

    /**
     * 角色权限设置提交
     *
     * @return void
     */
    public function role_power_submit($id){
        $action_ids = Request::instance()->param('action_ids', '');
        $role = AdmRole::find($id);
        $role->power = $action_ids;
        $res = $role->save();
        if($res){
            return return_data(1, '', '修改成功', '角色信息权限设置：'.$role->role_name);
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
        View::assign('list', $list);
        $role = AdmRole::select();
        View::assign('role', $role);
        return View::fetch();
    }

    /**
     * 管理员信息添加表单
     *
     * @return void
     */
    public function admin_add(){
        return View::fetch();
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
        $validate = new \app\admin\validate\Admin;
        if(!$validate->scene('add')->check(['account'=> $account, 'nickname'=> $nickname, 'password'=> $password, 'password_confirm'=> $password_confirm])){
            return return_data(2, '', $validate->getError());
        }
        $password_salt = create_captcha(8, 'lowercase+uppercase+figure');
        $res = AdmAdmin::create([
            'account'=> $account,
            'nickname'=> $nickname,
            'password'=> md5($password . $password_salt),
            'password_salt'=> $password_salt
        ]);
        if($res){
            return return_data(1, '', '添加成功', '管理员信息添加：'.$account);
        }else{
            return return_data(3, '', '添加失败,请联系管理员');
        }
    }

    /**
     * 管理员信息修改表单
     *
     * @return void
     */
    public function admin_update($id){
        $admin = AdmAdmin::find($id);
        $has_data = "true";
        if(!$admin){
            $has_data = "false";
        }
        View::assign('has_data', $has_data);
        View::assign('detail', $admin);
        return View::fetch();
    }

    /**
     * 管理员信息修改提交
     *
     * @return void
     */
    public function admin_update_submit($id){
        $account = Request::instance()->param('account', '');
        $nickname = Request::instance()->param('nickname', '');
        $password = Request::instance()->param('password', '');
        $validate = new \app\admin\validate\Admin;
        if(!$validate->scene('update')->check(['admin_id'=> $id, 'account'=> $account, 'nickname'=> $nickname])){
            return return_data(2, '', $validate->getError());
        }
        $admin = AdmAdmin::find($id);
        $old_admin_account = $admin->account;
        $admin->account = $account;
        $admin->nickname = $nickname;
        $admin->password = $password == '' ? $admin->password : md5($password . $admin->password_salt);
        $res = $admin->save();
        if($res){
            return return_data(1, '', '修改成功', '管理员信息修改：'.$old_admin_account.'->'.$account);
        }else{
            return return_data(2, '', '未修改任何信息或修改失败，请检查原因');
        }
    }

    /**
     * 管理员信息删除提交
     *
     * @return void
     */
    public function admin_delete_submit($id){
        $admin = AdmAdmin::where('admin_id', $id)->find();
        $res = AdmAdmin::where('admin_id', $id)->delete();
        if($res){
            return return_data(1, '', '删除成功', '管理员信息删除：'.$admin->account);
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
        $admin = AdmAdmin::find($admin_id);
        $role = AdmRole::find($role_id);
        if(!$admin && !$role){
            return return_data(2, '', '非法操作');
        }
        if($role->role_id == $admin->role_id){
            return return_data(2, '', '已经是此角色了');
        }
        $admin->role_id = $role_id;
        $res = $admin->save();
        if($res){
            return return_data(1, array('admin_id'=> $admin_id, 'role_name'=> $admin->role->role_name), '分配角色成功', '分配角色给管理员：'.$admin->account.'->'.$role->role_name);
        }else{
            return return_data(3, '', '分配角色失败,请联系管理员');
        }
    }
}