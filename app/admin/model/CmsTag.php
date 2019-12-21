<?php
namespace app\admin\model;

use think\Model;


class CmsTag extends Model{
    protected $table = "cms_tag";
    protected $pk = 'tag_id';
    protected $schema = [
        'tag_id'=> 'int',
        'tag_name'=> 'varchar',
        'tag_image'=> 'varchar',
        'sort'=> 'tinyint'
    ];
}