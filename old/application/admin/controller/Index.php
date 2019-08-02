<?php
namespace app\admin\controller;

use app\admin\model\CmsArticleCount as CACM;

class Index extends Base{
    public function index(){
        //文章排行
        $rank = CACM::order('click_rate desc')->limit(5)->select();
        $i = 1;
        foreach($rank as $v){
            $v->rank = $i;
            $i++;
        }
        $this->assign('rank', $rank);
        return $this->fetch('Index/index');
    }
}