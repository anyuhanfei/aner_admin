<?php
namespace app\admin\model;

use think\Model;


class CmsArticleCount extends Model
{
    protected $title = 'cms_article_count';

    public static function create_data($article_id){
        $res = self::create([
            'article_id'=> $article_id
        ]);
        return $res;
    }
}