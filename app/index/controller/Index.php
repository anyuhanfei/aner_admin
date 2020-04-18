<?php
namespace app\index\controller;

use think\facade\Session;
use think\facade\View;

use app\admin\model\IdxUser;


class Index extends Base{
    protected $user = null;
    protected $middleware = [
        \app\index\middleware\CheckIndex::class,
    ];

    public function __construct(){
        parent::__construct();
        $this->user_id = Session::get('user_id');
        $this->user = IdxUser::find($this->user_id);
        View::assign('user_id', $this->user_id);
        View::assign('user', $this->user);
    }

    public function index(){
        return 'aner_admin';
    }
}