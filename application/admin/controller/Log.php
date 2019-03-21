<?php
namespace app\admin\controller;

use think\Request;

use app\admin\controller\Base;

use app\admin\model\LogAdminOperation;
use app\admin\model\SysAdmin;

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
        $ip = Request::instance()->param('ip', '');
        $start_time = Request::instance()->param('start_time', '');
        $end_time = Request::instance()->param('end_time', '');
        $log = new LogAdminOperation;
        $log = ($account != '') ? $this->where_admin_account($log, $account) : $log;
        ($ip != '') ? $log->where('ip', $ip) : 0;
        $log = self::where_time($log, $start_time, $end_time);
        $list = $log->order('insert_time desc')->paginate($this->page_number,false,['query'=>request()->param()]);
        self::many_assign(['list'=> $list, 'account'=> $account, 'ip'=> $ip, 'start_time'=> $start_time, 'end_time'=> $end_time]);
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
            $model = $admin ? $model->where('admin_id', $admin->admin_id) : $model->where('admin_id', 0);
        }
        return $model;
    }
}