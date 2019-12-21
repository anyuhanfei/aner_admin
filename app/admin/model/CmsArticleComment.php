<?php
namespace app\admin\model;

use think\Model;


class CmsArticleComment extends Model{
    protected $table = 'cms_article_comment';
    protected $pk = 'comment_id';
    protected $schema = [
        'comment_id'=> 'int',
        'article_id'=> 'int',
        'user_id'=> 'int',
        'user_identity'=> 'varchar',
        'top_id'=> 'int',
        'content'=> 'varchar',
        'insert_time'=> 'datetime'
    ];

    /**
     * 关联文章表
     *
     * @return void
     */
    public function article(){
        return $this->hasOne('cms_article', 'article_id', 'article_id');
    }

    /**
     * 关联会员表
     *
     * @return void
     */
    public function user(){
        return $this->hasOne('idx_user', 'user_id', 'user_id');
    }

    /**
     * 关联文章评论表（自己的上级）
     *
     * @return void
     */
    public function top(){
        return $this->hasOne('cms_article_comment', 'comment_id', 'top_id');
    }
}