<?php
namespace app\admin\model;

use think\Model;

class CmsArticle extends Model{
    protected $table = 'cms_article';
    
    public function category(){
        return $this->hasOne('cms_category', 'category_id', 'category_id');
    }

    public function count(){
        return $this->hasOne('cms_article_count', 'article_id', 'article_id');
    }
}
