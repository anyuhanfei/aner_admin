<?php
namespace app\admin\model;

use think\Model;


class CmsArticleCount extends Model
{
    protected $title = 'cms_article_count';

    public function article(){
        $field = 'article_id, title, category_id, tag_id, author, keyword, image, intro, status, is_recommend, is_stick, insert_time';
        return $this->hasOne('cms_article', 'article_id', 'article_id')->field($field);
    }

    public static function create_data($article_id){
        $res = self::create([
            'article_id'=> $article_id
        ]);
        return $res;
    }
}