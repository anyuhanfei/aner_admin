<?php
namespace app\admin\model;

use think\Model;

class CmsCategory extends Model{
    protected $table = 'cms_category';
    
    /**
     * 添加
     *
     * @param [type] $name
     * @return void
     */
    public static function create_data($name){
        return self::create([
            'category_name' => $name
        ]);
    }

    /**
     * 改
     *
     * @param array $where 查询条件
     * @param array $update 修改字段
     * @return void
     */
    public static function update_data($where = [], $update = []){
        return self::where($where)->update($update);
    }
}