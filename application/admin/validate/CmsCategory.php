<?php
namespace app\index\validate;

use think\Validate;

use app\admin\model\CmsCategory as CCM;

class CmsCategory extends Validate{
    protected $rule = [
        'cateogry_id' => 'require|checkExistsCategoryId',
        'category_name' => 'require|checkExistsCategoryName|checkNotOldCategoryName',
    ];

    protected $message = [
        'cateogry_id.require' => '系统错误！',
        'category_name.require' => '文章分类名称不能为空！',
    ];

    protected $scene = [
        'add_name' => [
            'category_name' => 'require|checkExistsCategoryName'
        ],
        'update_name' => [
            'cateogry_id',
            'category_name'
        ]
    ];

    /**
     * 根据id判断文章分类是否存在(必须存在)
     *
     * @param [type] $value
     * @param [type] $rule
     * @param [type] $data
     * @return void
     */
    protected function checkExistsCategoryId($value, $rule, $data){
        $category = CCM::get($value);
        return $category ? true : '此文章分类不存在！';
    }

    protected function checkExistsCategoryName($value, $rule, $data){
        $category = CCM::where('category_name', $value)->find();
    }
}