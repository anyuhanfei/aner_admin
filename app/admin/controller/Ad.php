<?php
namespace app\admin\controller;

use think\facade\View;
use think\facade\Session;
use think\facade\Request;

use app\admin\controller\Admin;

use app\admin\model\SysAd;
use app\admin\model\SysAdv;
use app\admin\model\LogAdminOperation;


class Ad extends Admin{
    /**
     * 广告管理-列表
     *
     * @return void
     */
    public function ad(){
        $ad = SysAd::order('ad_id desc')->select();
        $adv = SysAdv::order('adv_id desc')->select();
        View::assign('ad', $ad);
        View::assign('adv', $adv);
        //删除未被上传的图片
        $ad_images = Session::get('ad_content_images');
        if($ad_images){
            foreach($ad_images as $k => $v){
                delete_image($v);
                unset($ad_images[$k]);
            }
        }
        Session::set('ad_content_images', array());
        return View::fetch();
    }

    /**
     * 广告位信息添加表单
     *
     * @return void
     */
    public function ad_adv_add(){
        return View::fetch();
    }

    /**
     * 广告位信息添加提交
     *
     * @return void
     */
    public function ad_adv_add_submit(){
        $adv_name = Request::instance()->param('adv_name', '');
        $sign = Request::instance()->param('sign', '');
        $validate = new \app\admin\validate\Adv;
        if(!$validate->scene('add')->check(['adv_name'=> $adv_name, 'sign'=> $sign])){
            return return_data(2, '', $validate->getError());
        }
        $res = SysAdv::create([
            'adv_name'=> $adv_name,
            'sign'=> $sign,
        ]);
        if($res){
            LogAdminOperation::create_data('广告位信息添加：'.$adv_name, 'operation');
            return return_data(1, '', '添加成功');
        }else{
            return return_data(3, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 广告位信息修改表单
     *
     * @return void
     */
    public function ad_adv_update($id){
        $adv = SysAdv::find($id);
        $has_data = "true";
        if(!$adv){
            $has_data = "false";
        }
        View::assign('has_data', $has_data);
        View::assign('detail', $adv);
        return View::fetch();
    }

    /**
     * 广告位信息修改提交
     *
     * @return void
     */
    public function ad_adv_update_submit($id){
        $adv_name = Request::instance()->param('adv_name', '');
        $sign = Request::instance()->param('sign', '');
        $validate = new \app\admin\validate\Adv;
        if(!$validate->scene('update')->check(['adv_name'=> $adv_name, 'sign'=> $sign, 'adv_id'=> $id])){
            return return_data(2, '', $validate->getError());
        }
        $adv = SysAdv::find($id);
        $old_adv_name = $adv->adv_name;
        $adv->adv_name = $adv_name;
        $adv->sign = $sign;
        $res = $adv->save();
        if($res){
            LogAdminOperation::create_data('广告位信息修改：'.$old_adv_name.'->'.$adv_name, 'operation');
            return return_data(1, '', '修改成功');
        }else{
            return return_data(2, '', '修改失败，请联系管理员');
        }
    }

    /**
     * 广告位信息删除提交
     *
     * @return void
     */
    public function ad_adv_delete_submit($id){
        $adv = SysAdv::where('adv_id', $id)->find();
        $res = SysAdv::where('adv_id', $id)->delete();
        if($res){
            LogAdminOperation::create_data('广告位信息删除：'.$adv->adv_name, 'operation');
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 广告信息添加表单
     *
     * @return void
     */
    public function ad_ad_add(){
        $adv = SysAdv::order('adv_id asc')->select();
        View::assign('adv', $adv);
        return View::fetch();
    }

    /**
     * 广告信息添加提交
     *
     * @return void
     */
    public function ad_ad_add_submit(){
        $title = Request::instance()->param('title', '');
        $adv_id = Request::instance()->param('adv_id', '');
        $sign = Request::instance()->param('sign', '');
        $value = Request::instance()->param('value', '');
        $content = Request::instance()->param('content', '');
        $image = Request::instance()->file('image');
        $validate = new \app\admin\validate\Ad;
        if(!$validate->scene('add')->check(['title'=> $title, 'adv_id'=> $adv_id])){
            return return_data(2, '', $validate->getError());
        }
        if($image){
            $image_res = file_upload($image, 'ad');
            $path = $image_res['file_path'];
        }else{
            $path = '';
        }
        if($sign == ''){
            $adv = SysAdv::find($adv_id);
            $sign = $adv->sign;
        }
        $res = SysAd::create([
            'title'=> $title,
            'adv_id'=> $adv_id,
            'sign'=> $sign,
            'value'=> $value,
            'content'=> $content,
            'image'=> $path
        ]);
        if($res){
            $this->remove_content_image($content, 'cookie', 'ad_content_images');
            LogAdminOperation::create_data('广告信息添加：'.$title, 'operation');
            return return_data(1, '', '添加成功');
        }else{
            delete_image($path);
            return return_data(3, '', '添加失败,请联系管理员');
        }
    }

    /**
     * 广告信息修改表单
     *
     * @return void
     */
    public function ad_ad_update($id){
        $ad = SysAd::find($id);
        $adv = SysAdv::order('adv_id asc')->select();
        $has_data = "true";
        if(!$ad){
            $has_data = "false";
        }
        View::assign('has_data', $has_data);
        View::assign('adv', $adv);
        View::assign('detail', $ad);
        return View::fetch();
    }

    /**
     * 广告信息修改提交
     *
     * @return void
     */
    public function ad_ad_update_submit($id){
        $title = Request::instance()->param('title', '');
        $adv_id = Request::instance()->param('adv_id', '');
        $value = Request::instance()->param('value', '');
        $content = Request::instance()->param('content', '');
        $image = Request::instance()->file('image');
        $validate = new \app\admin\validate\Ad;
        if(!$validate->scene('update')->check(['title'=> $title, 'adv_id'=> $adv_id, 'ad_id'=> $id])){
            return return_data(2, '', $validate->getError());
        }
        $path = '';
        if($image){
            $image_res = file_upload($image, 'ad');
            $path = $image_res['file_path'];
        }
        $ad = SysAd::find($id);
        $old_ad_title = $ad->title;
        $old_ad_content = $ad->content;
        $ad->title = $title;
        $ad->adv_id = $adv_id;
        $ad->value = $value;
        $ad->content = $content;
        $ad->image = $path == '' ? $ad->image : $path;
        $res = $ad->save();
        if($res){
            //删除编辑中删除掉的已上传图片，删除旧文本中被删除的图片
            $this->remove_content_image($content, 'cookie', 'ad_content_images');
            $this->remove_content_image($content, 'update', $old_ad_content);
            LogAdminOperation::create_data('广告信息修改：'.$old_ad_title.'->'.$title, 'operation');
            return return_data(1, '', '修改成功');
        }else{
            delete_image($path);
            return return_data(3, '', '修改失败或没有修改信息');
        }
    }

    /**
     * 广告信息删除提交
     *
     * @return void
     */
    public function ad_ad_delete_submit($id){
        $ad = SysAd::find($id);
        $res = SysAd::where('ad_id', $id)->delete();
        if($res){
            delete_image($ad->image);
            $this->remove_content_image($ad->content, 'delete');
            LogAdminOperation::create_data('广告信息删除：'.$ad->title, 'operation');
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 广告信息上传图片提交
     *
     * @return void
     */
    public function ad_img(){
        $image = Request::instance()->file('upload');
        $image_path = $this->content_image_upload($image, 'ad_content', 'ad_content_images');
        return json(array('uploaded'=> 1, 'url'=> $image_path));
    }
}