<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\SysSiteinfo;
use app\admin\model\LogAdminOperation;
use app\admin\model\SysSettings;

use app\admin\controller\Base;

class Settings extends Base{
    public function index(){
        return $this->redirect('Settings/siteinfo');
    }

    /**
     * 网站seo设置
     *
     * @return void
     */
    public function siteinfo(){
        $siteinfo = SysSiteinfo::get(1);
        if(!$siteinfo){
            SysSiteinfo::create_data();
            $siteinfo = SysSiteinfo::get(1);
        }
        $this->assign('detail', $siteinfo);
        return $this->fetch('Settings/siteinfo');
    }

    /**
     * 网站seo设置修改
     *
     * @return void
     */
    public function siteinfo_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('Siteinfo');
        if(!$validate->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $siteinfo = new SysSiteinfo();
        $res = $siteinfo->allowField(true)->save($data,['id' => 1]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了网站seo设置');
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }
    
    /**
     * 网站设置
     *
     * @return void
     */
    public function settings(){
        $title = Request::instance()->param('title', '');
        $sign = Request::instance()->param('sign', '');
        $settings = new SysSettings;
        $log = ($title != '') ? $log->where('title', $title) : $log;
        $log = ($sign != '') ? $log->where('sign', $sign) : $log;
        $list = $settings->order('id desc')->paginate($this->page_number, false,['query'=>request()->param()]);
        self::many_assign(['list'=> $list, 'title'=> $title, 'sign'=> $sign]);
        return $this->fetch('Settings/settings');
    }

    /**
     * 网站设置添加页面
     *
     * @return void
     */
    public function settings_add(){
        return $this->fetch('Settings/settings_add');
    }

    /**
     * 网站设置添加提交
     *
     * @return void
     */
    public function settings_add_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('SysSettings');
        if(!$validate->scene('add')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $settings = new SysSettings($data);
        $res = $settings->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了设置:' . $data['title']);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 网站设置修改
     *
     * @return void
     */
    public function settings_update(){
        $id = Request::instance()->param('id', 0);
        $detail = SysSettings::get($id);
        $this->assign('detail', $detail);
        return $this->fetch('Settings/settings_update');
    }

    /**
     * 网站设置修改提交
     *
     * @return void
     */
    public function settings_update_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('SysSettings');
        if(!$validate->scene('update')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $model = new SysSettings();
        $res = $model->allowField(true)->save($data, ['id'=> $data['id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了设置:' . $data['title']);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }   

    /**
     * 网站设置删除提交
     *
     * @return void
     */
    public function settings_delete_submit(){
        $id = Request::instance()->param('id', 0);
        $model = SysSettings::get($id);
        if(!$model){
            return json_data(2, '', '系统错误！');
        }
        $res = SysSettings::destroy($id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了设置' . $id . ',设置名称为：' . $model->title);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }
}
