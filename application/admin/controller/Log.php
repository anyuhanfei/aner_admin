<?php
namespace app\admin\controller;

use think\Session;
use think\Controller;


class Log extends Base{
    public function admin_operation_log(){
        return $this->fetch();
    }
}