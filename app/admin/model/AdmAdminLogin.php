<?php
namespace app\admin\model;

use think\Model;


class AdmAdminLogin extends Model{
    protected $table = "adm_admin_login";
    protected $pk = 'id';

    /**
     * 创建一条新数据
     *
     * @param [type] $ip
     * @return void
     */
    public static function create_data($ip){
        self::create([
            'ip'=> $ip,
            'error_number'=> 1,
            'insert_time'=> date("Y-m-d H:i:s", time())
        ]);
    }
}