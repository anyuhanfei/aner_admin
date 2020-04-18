<?php
namespace app\admin\model;

use think\Model;


class AdmFreezeIp extends Model{
    protected $table = "adm_freeze_ip";
    protected $pk = 'id';

    /**
     * 创建一条新数据
     *
     * @param string $ip  ip地址
     * @param int $freeze_time  冻结时间
     * @return void
     */
    public static function create_data($ip, $freeze_time){
        self::create([
            'ip'=> $ip,
            'freeze_start_time'=> date("Y-m-d H:i:s", time()),
            'freeze_end_time'=> date("Y-m-d H:i:s", time() + $freeze_time)
        ]);
    }
}