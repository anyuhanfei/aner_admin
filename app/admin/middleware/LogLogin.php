<?php
namespace app\admin\middleware;

use app\admin\model\LogAdminOperation;


class LogLogin{
    public function handle($request, \Closure $next){
        $response = $next($request);

        $data = json_decode($response->getData());
        if(isset($data->code) && isset($data->operation) && $data->operation != ''){
            LogAdminOperation::create_data($data->operation, 'login');
        }

        return $response;
    }
}