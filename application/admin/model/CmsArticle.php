<?php
namespace app\admin\model;

use think\Model;

use app\admin\model\CmsTag;


class CmsArticle extends Model{
    protected $table = 'cms_article';

    public function artdata(){
        return $this->hasOne('cms_article_data', 'article_id', 'article_id');
    }

    public function comment(){
        return $this->hasMany('cms_article_comment', 'article_id', 'article_id');
    }

    public function category(){
        return $this->hasOne('cms_category', 'category_id', 'category_id');
    }

    public function tag($tag_ids){
        $tags = self::where('tag_ids', 'in', $tag_ids)->select();
        return $tags;
    }

}