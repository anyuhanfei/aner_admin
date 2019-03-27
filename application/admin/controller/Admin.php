<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\SysAdmin;
use app\admin\model\LogAdminOperation;
use app\admin\model\SysAdminRole;
use app\admin\model\SysModule;
use app\admin\model\SysModuleAction;

use app\admin\controller\Base;

class Admin extends Base{
    public function index(){
        return $this->redirect('Admin/admin');
    }

    /**
     * 管理员列表
     *
     * @return void
     */
    public function admin(){
        $list = SysAdmin::order('admin_id desc')->paginate(10,false,['query'=>request()->param()]);
        $role = SysAdminRole::field('role_id, role_name')->order('sort asc')->select();
        self::many_assign(['list'=> $list, 'role'=> $role]);
        return $this->fetch('Admin/admin');
    }

    /**
     * 管理员添加页面
     *
     * @return void
     */
    public function admin_add(){
        $role = SysAdminRole::field('role_id, role_name')->order('sort desc')->select();
        $this->assign('role', $role);
        return $this->fetch('Admin/admin_add');
    }

    /**
     * 管理员添加提交
     *
     * @return void
     */
    public function admin_add_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('Admin');
        if(!$validate->scene('add')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $data['password'] = md5($data['password']);
        $admin = new SysAdmin($data);
        $res = $admin->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了账号为:' . $data['account'] . ',昵称为:' . $data['nickname'] . '的新管理员');
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 修改管理员昵称
     *
     * @return void
     */
    public function admin_update_nickname(){
        $admin_id = Request::instance()->param('admin_id', 0);
        $nickname = Request::instance()->param('nickname', '');
        $validate = Loader::validate('Admin');
        if(!$validate->scene('update_nickname')->check(['admin_id'=> $admin_id, 'nickname'=> $nickname])){
            return json_data(2, '', $validate->getError());
        }
        $admin = SysAdmin::get($admin_id);
        $admin->nickname = $nickname;
        $res = $admin->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了账号为:' . $admin->account . '管理员的昵称，新昵称为:'. $nickname);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 修改管理员密码
     *
     * @return void
     */
    public function admin_update_password(){
        $admin_id = Request::instance()->param('admin_id', 0);
        $password = Request::instance()->param('password', '');
        $validate = Loader::validate('Admin');
        if(!$validate->scene('update_password')->check(['admin_id'=> $admin_id, 'password'=> $password])){
            return json_data(2, '', $validate->getError());
        }
        $admin = SysAdmin::get($admin_id);
        $admin->password = md5($password);
        $res = $admin->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了账号为:' . $admin->account . '管理员的密码');
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 修改管理员密码
     *
     * @return void
     */
    public function admin_update_role(){
        $admin_id = Request::instance()->param('admin_id', 0);
        $role_id = Request::instance()->param('role_id', '');
        $admin = SysAdmin::get($admin_id);
        $admin->role_id = $role_id;
        $res = $admin->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了账号为:' . $admin->account . '的管理员的权限');
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 管理员删除提交
     *
     * @return void
     */
    public function admin_delete_submit(){
        $id = Request::instance()->param('id', 0);
        $model = SysAdmin::get($id);
        if(!$model){
            return json_data(2, '', '系统错误！');
        }
        $res = SysAdmin::destroy($id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了管理员' . $id . ',管理员账号为：' . $model->account);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }

    /**
     * 角色管理列表
     *
     * @return void
     */
    public function role(){
        $list = SysAdminRole::field('role_id, role_name, remark, sort')->order('sort asc')->select();
        $this->assign('list', $list);
        return $this->fetch('Admin/role');
    }

    /**
     * 添加角色
     *
     * @return void
     */
    public function role_add(){
        return $this->fetch('Admin/role_add');
    }

    /**
     * 角色添加提交
     *
     * @return void
     */
    public function role_add_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('Role');
        if(!$validate->scene('add')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $data['action_ids'] = 'index/index';
        $role = new SysAdminRole($data);
        $res = $role->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了新角色:' . $data['role_name']);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 修改角色信息
     *
     * @return void
     */
    public function role_update(){
        $role_id = Request::instance()->param('role_id');
        $role = SysAdminRole::get($role_id);
        $this->assign('detail', $role);
        return $this->fetch('Admin/role_update');
    }

    /**
     * 角色修改提交
     *
     * @return void
     */
    public function role_update_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('Role');
        if(!$validate->scene('update')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $admin = new SysAdminRole();
        $res = $admin->allowField(true)->save($data, ['role_id'=> $data['role_id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了角色' . $data['role_id'] . ',角色名称修改为：' . $data['role_name']);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 修改角色排序
     *
     * @return void
     */
    public function update_role_sort_submit(){
        $id = Request::instance()->param('id', 0);
        $sort = Request::instance()->param('sort', 0);
        $model = SysAdminRole::get($id);
        $model->sort = $sort;
        $res = $model->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了角色' . $id . '的排序,角色名称为：' . $model->role_name . ',排序为:' . $sort);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 角色删除提交
     *
     * @return void
     */
    public function role_delete_submit(){
        $id = Request::instance()->param('id', 0);
        $model = SysAdminRole::get($id);
        if(!$model){
            return json_data(2, '', '系统错误！');
        }
        $res = SysAdminRole::destroy($id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了角色' . $id . ',角色名称为：' . $model->role_name);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }

    /**
     * 设置权限
     *
     * @return void
     */
    public function role_power_set(){
        $role_id = Request::instance()->param('role_id');
        $role = SysAdminRole::get($role_id);
        $module = SysModule::field('module_id,module_name')->order('sort asc')->select();
        $action = SysModuleAction::field('action_id,module_id,action_name,action_url')->order('sort asc')->select();
        foreach($action as &$v){
            if(strpos($role->action_ids, $v->action_url) === false){
                $v['has_power'] = 0;
            }else{
                $v['has_power'] = 1;
            }
        }
        self::many_assign(['action'=> $action, 'module'=> $module, 'role'=> $role]);
        return $this->fetch('Admin/role_power_set');
    }

    /**
     * 设置权限提交
     *
     * @return void
     */
    public function role_power_set_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('Role');
        if(!$validate->scene('power')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $model = new SysAdminRole();
        $res = $model->allowField(true)->save($data, ['role_id'=> $data['role_id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了角色' . $data['role_id'] . '的权限');
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }
}