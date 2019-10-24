<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;

use app\admin\model\IdxUser;
use app\admin\model\CmsArticle;

class Index extends Base{
    public function index(){
        //会员数量
        $user_count = IdxUser::count();
        //文章数量
        $article_count = CmsArticle::count();
        $this->assign('user_count', $user_count);
        $this->assign('article_count', $article_count);
        return $this->fetch();
    }
}