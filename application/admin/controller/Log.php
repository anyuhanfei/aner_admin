<?php
namespace app\admin\controller;

use think\Session;
use think\Controller;
use think\Request;

use app\admin\model\LogAdminOperation;

class Log extends Base{
    /**
     * 管理员操作日志列表
     *
     * @return void
     */
    public function admin_operation_log(){
        $account = Request::instance()->param('account', '');
        $nickname = Request::instance()->param('nickname', '');
        $ip = Request::instance()->param('ip', '');
        $start_time = Request::instance()->param('start_time', '');
        $end_time = Request::instance()->param('end_time', '');
        $log = new LogAdminOperation;
        $log = ($account != '') ? $this->where_admin($log, 'account', $account) : $log;
        $log = ($account != '') ? $this->where_admin($log, 'nickname', $nickname) : $log;
        $log = ($ip != '') ? $log->where('ip', $ip) : $log;
        $log = self::where_time($log, $start_time, $end_time);
        $list = $log->where('type', 'operation')->order('insert_time desc')->paginate($this->page_number,false,['query'=>request()->param()]);
        self::many_assign(['list'=> $list, 'account'=> $account, 'nickname'=> $nickname, 'ip'=> $ip, 'start_time'=> $start_time, 'end_time'=> $end_time]);
        return $this->fetch();
    }

    /**
     * 管理员登录日志
     *
     * @return void
     */
    public function admin_login_log(){
        $ip = Request::instance()->param('ip', '');
        $start_time = Request::instance()->param('start_time', '');
        $end_time = Request::instance()->param('end_time', '');
        $log = new LogAdminOperation;
        $log = ($ip != '') ? $log->where('ip', $ip) : $log;
        $log = self::where_time($log, $start_time, $end_time);
        $list = $log->where('type', 'login')->order('insert_time desc')->paginate($this->page_number,false,['query'=>request()->param()]);
        self::many_assign(['list'=> $list, 'ip'=> $ip, 'start_time'=> $start_time, 'end_time'=> $end_time]);
        return $this->fetch();
    }

    /**
     * 检索管理员信息
     *
     * @param obj $model
     * @param string $key
     * @param string $value
     * @return void
     */
    public function where_admin($model, $key, $value){
        if($account != ''){
            $admin = AdmAdmin::where($key, $value)->find();
            $model = $admin ? $model->where('admin_id', $admin->admin_id) : $model->where('admin_id', 0);
        }
        return $model;
    }
}