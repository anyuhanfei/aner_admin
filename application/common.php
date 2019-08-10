<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * 前后端数据传输格式
 *
 * @param [type] $status 状态,1成功2失败
 * @param [type] $data 数据
 * @param [type] $msg 提示信息
 * @return void
 */
function return_data($status, $data, $msg, $type = 'array'){
    if($type == 'array'){
        return array('status'=>$status, 'data'=>$data, 'msg'=>$msg);
    }else{
        return json_encode(array('status'=>$status, 'data'=>$data, 'msg'=>$msg));
    }
}

/**
 * 生成简单验证码
 *
 * @param [type] $number 验证码位数
 * @param string $type 验证码内容类型
 * @return void
 */
function create_captcha($number, $type = 'figure'){
    $array_figure = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    $array_lowercase = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
    $array_uppercase = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    switch($type){
        case 'lowercase':
            $res_array = $array_lowercase;
            break;
        case 'uppercase':
            $res_array = $array_uppercase;
            break;
        case 'lowercase+figure':
            $res_array = array_merge($array_lowercase, $array_figure);
            break;
        case 'uppercase+figure':
            $res_array = array_merge($array_uppercase, $array_figure);
            break;
        case 'lowercase+uppercase':
            $res_array = array_merge($array_lowercase, $array_uppercase);
            break;
        case 'lowercase+uppercase+figure':
            $res_array = array_merge(array_merge($array_lowercase, $array_uppercase), $array_figure);
            break;
        default:
            $res_array = $array_figure;
            break;
    }
    $resstr = '';
    shuffle($res_array);
    foreach(array_rand($res_array, $number) as $v){
        $resstr .= $res_array[$v];
    }
    return $resstr;
}

/**
 * 文件上传
 *
 * @param file $file 文件资源句柄
 * @param string $save_path 文件保存子文件夹
 * @param array $file_validate 文件上传验证
 * @return void
 */
function file_upload($file, $save_path, $file_validate = array('size'=>156780000, 'ext'=>'jpg,png,gif')){
    if($file){
        $info = $file->validate(['size'=>$file_validate['size'],'ext'=>$file_validate['ext']])->move(ROOT_PATH . 'public' . DS . 'uploads'. DS . $save_path);
        if($info){
            $res = array('status'=>1, 'file_path'=>'/uploads'. DS . $save_path . DS . $info->getSaveName(), 'error'=>'');
            unset($info);
            unset($file);
            return $res;
        }else{
            $res = array('status'=>2, 'file_path'=>'', 'error'=>$file->getError());
            unset($info);
            unset($file);
            return $res;
        }
    }
}

/**
 * 删除图片
 *
 * @param [type] $oldImg 旧图片路径
 * @param boolean $is_full 是否是完整路径
 * @return void
 */
function delete_image($oldImg, $is_full = false){
    if($oldImg != ''){
        if($is_full == false){
            $path = ROOT_PATH . 'public' .$oldImg;
        }else{
            $path = $oldImg;
        }
        if ($path != ROOT_PATH . 'public' . DS) {
            if(is_file($path) == true) {
                unlink($path);
            }
        }
    }
}

/**
 * 二维码生成
 *
 * @param [type] $url
 * @param [type] $phone
 * @return void
 */
function png_erwei($url, $phone)
{
   include_once EXTEND_PATH.'phpqrcode/phpqrcode.php';//放在extend中
    //vendor('phpqrcode.phpqrcode');//放在vender中
    $errorCorrectionLevel = 'H';//容错级别
    $matrixPointSize = 5;//图片大小慢慢自己调整，只要是int就行
    $path = ROOT_PATH . 'public/uploads/qrcode/';
    $QR = $QRB = $path . $phone . ".png";
    \QRcode::png($url, $QR, $errorCorrectionLevel, $matrixPointSize, 2);
    if(file_exists($path . $phone . ".png")){
        return "/uploads/qrcode/" . $phone . ".png";
    }else{
        return false;
    }
}

/**
 * 随机生成订单号
 *
 * @return void
 */
function order_sn(){
    return date('ymdhis') . str_pad(mt_rand(1, 9999), 4, '0', STR_PAD_LEFT);
}

/**
 * 获取用户IP
 *
 * @return string
 */
function get_ip()
{
    $ip = 'xxxx';
    if(!empty($_SERVER['HTTP_CLIENT_IP']))
    {
        return is_ip($_SERVER['HTTP_CLIENT_IP']) ? $_SERVER['HTTP_CLIENT_IP'] : $ip;
    }
    elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
    {
        return is_ip($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $ip;
    }
    else
    {
        return is_ip($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : $ip;
    }
}


/**
 * 判断是否是IP地址
 *
 * @param $str
 * @return bool|int
 */
function is_ip($str)
{
    $ip = explode('.', $str);
    for($i=0; $i<count($ip); $i++)
    {
        if($ip[$i]>255)
        {
            return false;
        }
    }
    return preg_match('/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/', $str);
}
