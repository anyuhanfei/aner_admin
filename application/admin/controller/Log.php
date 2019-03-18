<?php
namespace app\admin\controller;

use app\admin\controller\Base;

use app\admin\model\LogAdminOperation;

class Log extends Base{
    public function index(){
        return $this->redirect('Log/admin_operation');
    }

    /**
     * 管理员操作日志
     *
     * @return void
     */
    public function admin_operation(){
        $account = Request::instance()->param('account', '');
        $start_time = Request::instance()->param('start_time', '');
        $end_time = Request::instance()->param('end_time', '');
        $log = new LogAdminOperation;
        $account != '' ? self::where_admin_account($log, $account) : 0;
        $log = self::where_time($log, $start_time, $end_time);
        $list = $log->order('insert_time desc')->paginate(10,false,['query'=>request()->param()]);
        self::many_assign(['list'=> $list, 'account'=> $account, 'start_time'=> $start_time, 'end_time'=> $end_time]);
        return $this->fetch('Log/admin_operation');
    }

    //base.php
    /**
     * 通过管理员账号检索，表中只存储了admin_id的情况
     *
     * @param [type] $model
     * @param [type] $account
     * @return void
     */
    public function where_admin_account($model, $account){
        if($account != ''){
            $admin = SysAdmin::where('account', $account)->find();
            $admin ? $model->where('admin_id', $admin->admin_id) : 0;
        }
        return $model;
    }
}