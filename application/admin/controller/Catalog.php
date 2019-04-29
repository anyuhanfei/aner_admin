<?php
namespace app\admin\controller;

use think\Request;
use think\Loader;
use think\Session;

use app\admin\controller\Base;

use app\admin\model\SysCatalogAdmin;
use app\admin\model\SysCatalogIndex;
use app\admin\model\LogAdminOperation;

class Catalog extends Base{
    /**
     * 后台菜单列表
     *
     * @return void
     */
    public function admin(){
        $list = SysCatalogAdmin::order('sort asc')->select();
        $this->assign('list', $list);
        return $this->fetch('Catalog/admin');
    }

    /**
     * 后台菜单添加页面
     *
     * @return void
     */
    public function admin_add(){
        $one_level_list = SysCatalogAdmin::field('title, id')->order('sort asc')->where('top_id', 0)->select();
        $this->assign('list', $one_level_list);
        return $this->fetch('Catalog/admin_add');
    }

    /**
     * 后台菜单添加提交
     *
     * @return void
     */
    public function admin_add_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('CatalogAdmin');
        if(!$validate->scene('add')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $admin = new SysCatalogAdmin($data);
        $res = $admin->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了一个后台菜单,名称为：' . $data['title']);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 后台菜单修改页面
     *
     * @return void
     */
    public function admin_update(){
        $id = Request::instance()->param('id', 0);
        $detail = SysCatalogAdmin::get($id);
        $one_level_list = SysCatalogAdmin::field('title, id')->order('sort asc')->where('top_id', 0)->select();
        $this->many_assign(['detail'=> $detail, 'list'=> $one_level_list]);
        return $this->fetch('Catalog/admin_update');
    }

    /**
     * 后台菜单修改提交
     *
     * @return void
     */
    public function admin_update_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('CatalogAdmin');
        if(!$validate->scene('update')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $admin = new SysCatalogAdmin();
        $res = $admin->allowField(true)->save($data, ['id'=> $data['id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了后台菜单' . $data['id'] . ',后台菜单名称修改为：' . $data['title']);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 后台菜单删除提交
     *
     * @return void
     */
    public function admin_delete_submit(){
        $id = Request::instance()->param('id', 0);
        $admin = SysCatalogAdmin::get($id);
        if(!$admin){
            return json_data(2, '', '系统错误！');
        }
        $res = SysCatalogAdmin::destroy($id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了后台菜单' . $id . ',后台菜单名称为：' . $admin->title);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }

    /**
     * 后台菜单排序
     *
     * @return void
     */
    public function update_admin_sort_submit(){
        $id = Request::instance()->param('id', 0);
        $sort = Request::instance()->param('sort', 0);
        $admin = SysCatalogAdmin::get($id);
        $admin->sort = $sort;
        $res = $admin->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了后台菜单排序' . $id . ',后台菜单名称为：' . $admin->title . '排序为:' . $sort);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 前台菜单列表
     *
     * @return void
     */
    public function index(){
        $list = SysCatalogIndex::order('sort asc')->select();
        $this->assign('list', $list);
        return $this->fetch('Catalog/index');
    }

    /**
     * 前台菜单添加页面
     *
     * @return void
     */
    public function index_add(){
        $one_level_list = SysCatalogIndex::field('title, id')->order('sort asc')->where('top_id', 0)->select();
        $this->assign('list', $one_level_list);
        return $this->fetch('Catalog/index_add');
    }

    /**
     * 前台菜单添加提交
     *
     * @return void
     */
    public function index_add_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('CatalogIndex');
        if(!$validate->scene('add')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $index = new SysCatalogIndex($data);
        $res = $index->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了一个前台菜单,名称为：' . $data['title']);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 前台菜单修改页面
     *
     * @return void
     */
    public function index_update(){
        $id = Request::instance()->param('id', 0);
        $detail = SysCatalogIndex::get($id);
        $one_level_list = SysCatalogIndex::field('title, id')->order('sort asc')->where('top_id', 0)->select();
        $this->many_assign(['detail'=> $detail, 'list'=> $one_level_list]);
        return $this->fetch('Catalog/index_update');
    }

    /**
     * 前台菜单修改提交
     *
     * @return void
     */
    public function index_update_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('CatalogIndex');
        if(!$validate->scene('update')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $index = new SysCatalogIndex();
        $res = $index->allowField(true)->save($data, ['id'=> $data['id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了前台菜单' . $data['id'] . ',前台菜单名称修改为：' . $data['title']);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 前台菜单删除提交
     *
     * @return void
     */
    public function index_delete_submit(){
        $id = Request::instance()->param('id', 0);
        $index = SysCatalogIndex::get($id);
        if(!$index){
            return json_data(2, '', '系统错误！');
        }
        $res = SysCatalogIndex::destroy($id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了前台菜单' . $id . ',前台菜单名称为：' . $index->title);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }

    /**
     * 前台菜单排序
     *
     * @return void
     */
    public function update_index_sort_submit(){
        $id = Request::instance()->param('id', 0);
        $sort = Request::instance()->param('sort', 0);
        $index = SysCatalogIndex::get($id);
        $index->sort = $sort;
        $res = $index->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了前台菜单排序' . $id . ',前台菜单名称为：' . $index->title . '排序为:' . $sort);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }
}