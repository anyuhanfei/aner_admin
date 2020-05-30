<?php
namespace app\admin\controller;

use think\facade\Session;
use think\facade\View;
use think\facade\Request;

use app\admin\controller\Admin;

use app\admin\model\LogAdminOperation;
use app\admin\model\AdmAdmin;
use app\admin\model\LogUserFund;
use app\admin\model\LogUserOperation;

class Log extends Admin{
    public function __construct(){
        parent::__construct();
        View::assign('user_fund_type', $this->user_fund_type);
        View::assign('user_delete_onoff', $this->user_delete_onoff);
        View::assign('user_identity', $this->user_identity);
        View::assign('user_identity_text', $this->user_identity_text);
    }

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
        $log = $this->where_time($log, $start_time, $end_time);
        $list = $log->where('type', 'operation')->order('insert_time desc')->paginate(['list_rows'=> $this->page_number, 'query'=>Request()->param()]);
        $this->many_assign(['list'=> $list, 'account'=> $account, 'nickname'=> $nickname, 'ip'=> $ip, 'start_time'=> $start_time, 'end_time'=> $end_time]);
        return View::fetch();
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
        $log = $this->where_time($log, $start_time, $end_time);
        $list = $log->where('type', 'login')->order('insert_time desc')->paginate(['list_rows'=> $this->page_number, 'query'=>Request()->param()]);
        $this->many_assign(['list'=> $list, 'ip'=> $ip, 'start_time'=> $start_time, 'end_time'=> $end_time]);
        return View::fetch();
    }

    /**
     * 检索管理员信息
     *
     * @param obj $model
     * @param string $key
     * @param string $value
     * @return void
     */
    protected function where_admin($model, $key, $value){
        if($key != ''){
            $admin = AdmAdmin::where($key, $value)->find();
            $model = $admin ? $model->where('admin_id', $admin->admin_id) : $model->where('admin_id', 0);
        }
        return $model;
    }

    /**
     * 会员资金流水
     *
     * @return void
     */
    public function user_fund_log(){
        $user_identity = Request::instance()->param('user_identity', '');
        $coin_type = Request::instance()->param('coin_type', '');
        $fund_type = Request::instance()->param('fund_type', '');
        $start_time = Request::instance()->param('start_time', '');
        $end_time = Request::instance()->param('end_time', '');
        $log = new LogUserFund;
        $log = $this->where_time($log, $start_time, $end_time);
        $log = ($user_identity != '') ? $log->where('user_identity', $user_identity) : $log;
        $log = ($coin_type != '') ? $log->where('coin_type', $coin_type) : $log;
        $log = ($fund_type != '') ? $log->where('fund_type', $fund_type) : $log;
        $list = $log->order('insert_time desc')->paginate(['list_rows'=> $this->page_number, 'query'=>Request()->param()]);
        $this->many_assign(['list'=> $list, 'user_identity'=> $user_identity, 'coin_type'=> $coin_type, 'fund_type'=> $fund_type, 'start_time'=> $start_time, 'end_time'=> $end_time]);
        // 操作集
        View::assign('fund_type_text', LogUserFund::fund_type_text());
        return View::fetch();
    }

    /**
     * 会员操作表
     *
     * @return void
     */
    public function user_operation_log(){
        $user_identity = Request::instance()->param('user_identity', '');
        $ip = Request::instance()->param('ip', '');
        $start_time = Request::instance()->param('start_time', '');
        $end_time = Request::instance()->param('end_time', '');
        $log = new LogUserFund;
        $log = $this->where_time($log, $start_time, $end_time);
        $log = ($user_identity != '') ? $log->where('user_identity', $user_identity) : $log;
        $log = ($ip != '') ? $log->where('ip', $ip) : $log;
        $list = $log->order('insert_time desc')->paginate(['list_rows'=> $this->page_number, 'query'=>Request()->param()]);
        $this->many_assign(['list'=> $list, 'user_identity'=> $user_identity, 'ip'=> $ip, 'start_time'=> $start_time, 'end_time'=> $end_time]);
        return View::fetch();
    }
}