<?php
namespace app\admin\middleware;

use app\admin\model\LogAdminOperation;


class LogOperation{
    public function handle($request, \Closure $next){
        $response = $next($request);

        $data = json_decode($response->getData());
        if(isset($data->code) && $data->code == 1 && isset($data->operation) && $data->operation != ''){
            LogAdminOperation::create_data($data->operation, 'operation');
        }

        return $response;
    }
}