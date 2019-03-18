<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\SysAdmin;
use app\admin\model\LogAdminOperation;
use app\admin\model\SysAdminRole;

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
        self::many_assign(['list'=> $list]);
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
}