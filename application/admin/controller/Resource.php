<?php
namespace app\admin\controller;

use think\Controller;


class Resource extends Base{
    /**
     * 列表资源
     *
     * @return void
     */
    public function table(){
        return $this->fetch();
    }

    /**
     * 表单资源
     *
     * @return void
     */
    public function form(){
        return $this->fetch();
    }

    /**
     * 图标资源
     *
     * @return void
     */
    public function icon(){
        return $this->fetch();
    }

    /**
     * 按钮资源
     *
     * @return void
     */
    public function button(){
        return $this->fetch();
    }

    /**
     * 标题资源
     *
     * @return void
     */
    public function text(){
        return $this->fetch();
    }

    /**
     * 引导提示资源
     *
     * @return void
     */
    public function notify(){
        return $this->fetch();
    }
}