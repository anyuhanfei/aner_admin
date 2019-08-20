<?php
namespace app\admin\model;

use think\Model;


class CmsArticleComment extends Model{
    protected $table = 'cms_article_comment';

    public function article(){
        return $this->hasOne('cms_article', 'article_id', 'article_id');
    }
}