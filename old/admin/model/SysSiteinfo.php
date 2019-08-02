<?php
namespace app\admin\model;

use think\Model;

class SysSiteinfo extends Model{
    protected $table = 'sys_siteinfo';

    /**
     * 创建唯一的一条数据
     *
     * @return void
     */
    public static function create_data(){
        $data = self::get(1);
        return $data ? false : self::create(['id'=> 1]);
    }
}