<?php
namespace app\admin\validate;

use think\Validate;

use app\admin\model\CmsArticle;
use app\admin\model\CmsCategory;

class Article extends Validate{

    protected $rule = [
        'title'=> 'require|checkTitle|checkUpdateTitle',
        'category_id'=> 'require|checkCategoryId'
    ];

    protected $message = [
        'title.require'=> '请填写标题',
        'category_id.require'=> '请选择文章分类'
    ];

    protected $scene = [
        'add'=> [
            'title'=> 'require|checkTitle',
            'category_id'=> 'require|checkCategoryId'
        ],
        'update'=> [
            'title'=> 'require|checkUpdateTitle',
            'category_id'=> 'require|checkCategoryId'
        ]
    ];

    protected function checkTitle($value, $rule, $data){
        $article = CmsArticle::where('title', $value)->find();
        if($article){
            return "此标题已存在";
        }
        return true;
    }

    protected function checkUpdateTitle($value, $rule, $data){
        $article = CmsArticle::where('title', $value)->where('article_id', '<>', $data['article_id'])->find();
        if($article){
            return "此标题已存在";
        }
        return true;
    }

    protected function checkCategoryId($value, $rule, $data){
        $article = CmsCategory::where('category_id', $value)->find();
        if(!$article){
            return "请选择正确的文章分类";
        }
        return true;
    }

}