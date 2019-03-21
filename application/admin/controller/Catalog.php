<?php
namespace app\admin\controller;

use think\Request;
use think\Loader;

use app\admin\controller\Base;

use app\admin\model\SysCatalogAdmin;

class Catalog extends Base{
    public function index(){
        return $this->redirect('Catalog/admin');
    }

    /**
     * 后台菜单列表
     *
     * @return void
     */
    public function admin(){
        $list = SysCatalogAdmin::order('sort asc')->paginate($this->page_number,false,['query'=>request()->param()]);
        $this->assign('list', $list);
        return $this->fetch('Catalog/admin');
    }
}