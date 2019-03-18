<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\SysSiteinfo;
use app\admin\model\LogAdminOperation;

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
}