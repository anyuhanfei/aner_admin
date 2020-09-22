<?php
namespace app\admin\middleware;

use app\admin\model\LogAdminOperation;


class LogOperation{
    public function handle($request, \Closure $next){
        $response = $next($request);

        try{
            $data = json_decode($response->getData());
            if(isset($data->code) && $data->code == 1 && isset($data->operation) && $data->operation != ''){
                LogAdminOperation::create_data($data->operation, 'operation');
            }
        }catch(\Throwable $th) {
            //throw $th;
        }

        return $response;
    }
}