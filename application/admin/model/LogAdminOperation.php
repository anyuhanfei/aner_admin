<?php
namespace app\admin\model;

use think\Model;
use think\Session;


class LogAdminOperation extends Model{
    protected $table = "log_admin_operation";

    public function admin(){
        return $this->hasOne('adm_admin', 'admin_id', 'admin_id');
    }

    public static function create_data($content, $type){
        if($type == 'login'){
            self::create([
                'type'=> 'login',
                'ip'=> get_ip(),
                'content'=> $content,
                'insert_time'=> date("Y-m-d H:i:s", time())
            ]);
        }elseif($type == 'operation'){
            $admin_id = Session::get('admin_id');
            self::create([
                'admin_id'=> $admin_id,
                'type'=> 'operation',
                'ip'=> get_ip(),
                'content'=> $content,
                'insert_time'=> date("Y-m-d H:i:s", time())
            ]);
        }
    }
}