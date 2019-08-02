<?php
namespace app\admin\controller;

use think\Controller;


class Resource extends Base{
    /**
     * 列表
     *
     * @return void
     */
    public function table(){
        return $this->fetch();
    }

    /**
     * 表单
     *
     * @return void
     */
    public function form(){
        return $this->fetch();
    }

    /**
     * 图标
     *
     * @return void
     */
    public function icon(){
        return $this->fetch();
    }

    /**
     * 按钮
     *
     * @return void
     */
    public function button(){
        return $this->fetch();
    }

    /**
     * 标题
     *
     * @return void
     */
    public function text(){
        return $this->fetch();
    }

    public function notify(){
        return $this->fetch();
    }
}