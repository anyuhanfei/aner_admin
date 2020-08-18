<?php
namespace app;

use think\facade\Env;

use Qiniu\Auth;
use Qiniu\Storage\UploadManager;


class qiniu{
    public function __construct(){
        $this->accessKey = Env::get('QINIU.ACCESS_KEY');
        $this->secretKey = Env::get('QINIU.SECRET_KEY');
        $this->bucket = Env::get('QINIU.BUCKET_NAME');
        $this->DOMAIN_NAME = Env::get('QINIU.DOMAIN_NAME');

        $auth = new Auth($this->accessKey, $this->secretKey);
        $this->token = $auth->uploadToken($this->bucket);
    }

    /**
     * 上传图片
     *
     * @param str $file_path 要上传图片所在的路径
     * @param str $key 保存至七牛云的文件名称
     * @return void
     */
    public function upload($file_path, $key){
        $uploadMgr = new UploadManager();
        list($ret, $err) = $uploadMgr->putFile($this->token, $key, $file_path);
        if ($err !== null) {
            return [false, $file_path];
        } else {
            return [true, 'http://' . $this->DOMAIN_NAME . '/' . $key];
        }
    }
}

