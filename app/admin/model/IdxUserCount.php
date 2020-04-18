<?php
namespace app\admin\model;

use think\Model;

use app\admin\controller\Base;

use app\admin\model\IdxUser;


class IdxUserCount extends Model{
    protected $table = 'idx_user_count';
    protected $pk = 'user_id';

    /**
     * 关联会员表
     *
     * @return void
     */
    public function user(){
        $Base = new Base();
        return $this->hasOne('idx_user', 'user_id', 'user_id')->field($Base->user_fund_type);
    }

    /**
     * 添加团队人数
     *
     * @param integer $top_id 上级id
     * @return void
     */
    public static function add_team_number($top_id=0){
        $hierarchy = 1;
        while($top_id != 0){
            $top_user = IdxUser::field('user_id, top_id')->where('user_id', $top_id)->find();
            if(!$top_user){
                break;
            }
            $top_user_count = self::where('user_id', $top_user->user_id)->find();
            $top_user_count->team_number += 1;
            if($hierarchy == 1){
                $top_user_count->down_team_number += 1;
            }
            $top_user_count->save();
            $hierarchy++;
            $top_id = $top_user->top_id;
        }
    }
}