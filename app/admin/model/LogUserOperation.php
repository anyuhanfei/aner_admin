<?php
namespace app\admin\model;

use think\Model;
use think\facade\Env;

use app\admin\model\IdxUser;


class LogUserOperation extends Model{
    protected $table = "log_user_operation";
    protected $pk = "id";

    /**
     * 关联会员表
     *
     * @return object
     */
    public function user(){
        return $this->hasOne('idx_user', 'user_id', 'user_id');
    }

    /**
     * 创建一条数据
     *
     * @param int $user_id 会员id
     * @param string $content 内容
     * @param string $remark 备注
     * @param string $insert_time 创建时间
     * @return bool
     */
    public static function create_data($user_id, $content, $remark='', $insert_time=''){
        $user_identity_set = Env::get('USER_IDENTITY', 'phone');
        $user_identity = IdxUser::where('user_id', $user_id)->value($user_identity_set);
        $res = self::create([
            'user_id'=> $user_id,
            'user_identity'=> $user_identity,
            'content'=> $content,
            'remark'=> $remark,
            'insert_time'=> ($insert_time == '' ? date("Y-m-d H:i:s", time()) : $insert_time)
        ]);
        return $res;
    }
}