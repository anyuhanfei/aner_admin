<?php
namespace app\admin\controller;

use think\facade\View;
use think\facade\Db;

use app\admin\controller\Admin;

use app\admin\model\中文测试;

class Index extends Admin{

    public function index(){
        Db::name('中文测试')->insert(['姓名'=> 'a', '创建时间'=> date("Y-m-d H:i:s", time())]);
        // 中文测试::create(['姓名'=> 'a', '创建时间'=> date("Y-m-d H:i:s", time())]);
        // var_dump(中文测试::)
        return View::fetch();
    }
}


/**

CREATE TABLE `中文测试` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `姓名` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `创建时间` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

 */