<?php
namespace app\admin\model;

use think\Model;
use think\Request;

class LogAdminOperation extends Model{
    protected $table = 'log_admin_operation';

    /**
     * 添加一条记录
     *
     * @param [type] $admin_id 管理员id
     * @param [type] $content 内容
     * @return void
     */
    public static function create_data($admin_id, $content){
        return self::create([
            'admin_id' => $admin_id,
            'ip' => Request::instance()->ip(),
            'content' => $content,
            'insert_time' => date("Y-m-d H:i:s", time())
        ]);
    }
}