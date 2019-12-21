<?php
namespace app\admin\model;

use think\Model;


class CmsCategory extends Model{
    protected $table = "cms_category";
    protected $pk = 'category_id';
    protected $schema = [
        'category_id'=> 'int',
        'category_name'=> 'varchar',
        'category_image'=> 'varchar',
        'sort'=> 'tinyint'
    ];
}