<?php
namespace app\admin\controller;

use think\facade\View;

use app\admin\controller\Admin;


class Resource extends Admin{
    /**
     * 列表资源
     *
     * @return void
     */
    public function table(){
        return View::fetch();
    }

    /**
     * 表单资源
     *
     * @return void
     */
    public function form(){
        return View::fetch();
    }

    /**
     * 图标资源
     *
     * @return void
     */
    public function icon(){
        return View::fetch();
    }

    /**
     * 按钮资源
     *
     * @return void
     */
    public function button(){
        return View::fetch();
    }

    /**
     * 标题资源
     *
     * @return void
     */
    public function text(){
        return View::fetch();
    }

    /**
     * 引导提示资源
     *
     * @return void
     */
    public function notify(){
        return View::fetch();
    }
}