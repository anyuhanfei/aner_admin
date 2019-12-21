<?php
namespace app\admin\model;

use think\Model;

use app\admin\model\CmsTag;


class CmsArticle extends Model{
    protected $table = 'cms_article';
    protected $pk = 'article_id';
    protected $schema = [
        'article_id'=> 'int',
        'tag_ids'=> 'varchar',
        'category_id'=> 'int',
        'title'=> 'varchar',
        'author'=> 'varchar',
        'intro'=> 'varchar',
        'keyword'=> 'varchar',
        'image'=> 'varchar',
        'sort'=> 'int',
        'content_type'=> 'varchar',
        'content'=> 'text'
    ];

    /**
     * 关联文章统计表
     *
     * @return void
     */
    public function artdata(){
        return $this->hasOne('cms_article_data', 'article_id', 'article_id');
    }

    /**
     * 关联文章评论表
     *
     * @return void
     */
    public function comment(){
        return $this->hasMany('cms_article_comment', 'article_id', 'article_id');
    }

    /**
     * 关联文章分类表
     *
     * @return void
     */
    public function category(){
        return $this->hasOne('cms_category', 'category_id', 'category_id');
    }

    /**
     * 关联文章标签表
     *
     * @param array $tag_ids 标签集
     * @return void
     */
    public function tag($tag_ids){
        $tags = CmsTag::where('tag_id', 'in', $tag_ids)->select();
        return $tags;
    }
}