<?php
namespace app\index\middleware;

use think\facade\Request;
use think\facade\Session;

use app\admin\model\LogUserOperation;


class LogOperation{
    public function handle($request, \Closure $next){
        $response = $next($request);

        $data = json_decode($response->getData());
        if(isset($data->code) && $data->code == 1 && isset($data->operation) && $data->operation != ''){
            $user_id = Session::get('user_id');
            LogUserOperation::create_data($user_id, $data->operation, 'operation');
        }

        return $response;
    }
}