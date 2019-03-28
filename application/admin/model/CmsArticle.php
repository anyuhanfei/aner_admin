<?php
namespace app\admin\model;

use think\Model;

class CmsArticle extends Model{
    protected $table = 'cms_article';
    
    public function cms_category(){
        return $this->hasOne('cms_category', 'category_id', 'category_id');
    }
    
    public function cms_tag(){
        return $this->hasOne('cms_tag', 'tag_id', 'tag_id');
    }
}
