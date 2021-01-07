<?php
namespace app\admin\model;

use think\Model;


class SysSetting extends Model{
    protected $table = "sys_setting";
    protected $pk = "id";


    public static function get_value($sign){
        return self::where('sign', $sign)->value('value');
    }
}