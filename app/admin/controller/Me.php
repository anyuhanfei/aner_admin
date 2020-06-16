<?php
namespace app\admin\controller;

use think\facade\View;
use think\facade\Session;
use think\facade\Request;

use app\admin\controller\Admin;

use app\admin\model\AdmAdmin;
use app\admin\model\LogAdminOperation;


class Me extends Admin{
    /**
     * 个人资料
     *
     * @return void
     */
    public function detail(){
        $admin_id = Session::get('admin_id');
        $admin = AdmAdmin::find($admin_id);
        View::assign('detail', $admin);
        return View::fetch();
    }

    /**
     * 个人资料修改提交
     *
     * @return void
     */
    public function detail_submit(){
        $nickname = Request::instance()->param('nickname', '');
        $phone = Request::instance()->param('phone', '');
        $email = Request::instance()->param('email', '');
        $qq = Request::instance()->param('qq', '');
        $wx = Request::instance()->param('wx', '');
        $via_img = Request::instance()->file('via');
        $via = '';
        if($via_img){
            $image_res = file_upload($via_img, 'admin_via');
            $via = $image_res['file_path'];
        }
        $admin_id = Session::get('admin_id');
        $admin = AdmAdmin::find($admin_id);
        $old_admin_via = $admin->via;
        $admin->nickname = $nickname != '' ? $nickname : $admin->nickname;
        $admin->phone = $phone != '' ? $phone : $admin->phone;
        $admin->email = $email != '' ? $email : $admin->email;
        $admin->qq = $qq != '' ? $qq : $admin->qq;
        $admin->wx = $wx != '' ? $wx : $admin->wx;
        $admin->via = $via != '' ? $via : $admin->via;
        $res = $admin->save();
        if($res){
            if($via != ''){
                delete_image($old_admin_via);
            }
            LogAdminOperation::create_data('修改个人资料', 'operation');
            return return_data(1, '', '个人资料修改成功');
        }else{
            delete_image($via);
            return return_data(2, '', '个人资料修改失败或没有要修改的资料');
        }
    }

    /**
     * 修改密码
     *
     * @return void
     */
    public function update_password(){
        return View::fetch();
    }

    /**
     * 修改密码提交
     *
     * @return void
     */
    public function update_password_submit(){
        $old_password = Request::instance()->param('old_password', '');
        $password = Request::instance()->param('password', '');
        $password_confirm = Request::instance()->param('password_confirm', '');
        $validate = new \app\admin\validate\UpdatePassword;
        if(!$validate->check(['old_password'=> $old_password, 'password'=> $password, 'password_confirm'=> $password_confirm])){
            return return_data(2, '', $validate->getError());
        }
        $admin_id = Session::get('admin_id');
        $admin = AdmAdmin::find($admin_id);
        $admin->password = md5($password . $admin->password_salt);
        $res = $admin->save();
        if($res){
            LogAdminOperation::create_data('修改个人登录密码', 'operation');
            return return_data(1, '', '密码修改成功');
        }else{
            return return_data(2, '', '密码修改失败，请查明错误原因');
        }
    }
}