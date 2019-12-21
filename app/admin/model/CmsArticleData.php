<?php
namespace app\admin\model;

use think\Model;


class CmsArticleData extends Model{
    protected $table = 'cms_article_data';
    protected $pk = 'article_id';
    protected $schema = [
        'article_id'=> 'int',
        'is_stick'=> 'tinyint',
        'is_hot'=> 'tinyint',
        'is_recomment'=> 'tinyint',
        'looknum'=> 'int',
        'likenum'=> 'int',
        'commentnum'=> 'int'
    ];

    /**
     * 关联文章表
     *
     * @return void
     */
    public function article(){
        return $this->hasOne('cms_article', 'article_id', 'article_id');
    }
}