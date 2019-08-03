<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;

use app\admin\model\SysSetup;


class Base extends Control{
    public function _initialize(){
        //系统设置
        $setup = SysSetup::find();
        $this->assign('setup', $setup);
    }
}