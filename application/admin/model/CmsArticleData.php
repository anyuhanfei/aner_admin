<?php
namespace app\admin\model;

use think\Model;


class CmsArticleData extends Model{
    protected $table = 'cms_article_data';

    public function article(){
        return $this->hasOne('cms_article', 'article_id', 'article_id');
    }
}