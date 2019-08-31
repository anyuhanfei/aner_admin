<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;

use app\admin\model\IdxUser;
use app\admin\model\CmsArticle;

class Index extends Base{
    public function index(){
        //会员数量
        $user_count = IdxUser::count();
        //文章数量
        $article_count = CmsArticle::count();
        //系统信息
        if(strtoupper(substr(PHP_OS,0,3))==='WIN'){
            $system = $this->windows_data();
            $system_type = 'windows';
        }else{
            $system_type = 'linux';
        }
        $this->assign('user_count', $user_count);
        $this->assign('article_count', $article_count);
        $this->assign('system', $system);
        $this->assign('system_type', $system_type);
        return $this->fetch();
    }


    private function windows_data(){
        $data = array('system'=> 'windows');
        // 系统名称、版本和类型
        $out = '';
        $info = exec('wmic os get Caption,Version,OSArchitecture',$out,$status);
        $osinfo_array = explode('  ',$out[1]);
        $osinfo = array_values(array_filter($osinfo_array));
        $data['system_name'] = $osinfo[0];
        $data['system_version'] = $osinfo[2];
        $data['system_type'] = $osinfo[1];
        // 已运行时长
        $out = '';
        $info = exec('wmic os get lastBootUpTime,LocalDateTime',$out,$status);
        $datetime_array = explode('.',$out[1]);
        $dt_array = explode(' ',$datetime_array[1]);
        $localtime = substr($datetime_array[1],-14);
        $boottime = $datetime_array[0];
        $uptime = strtotime($localtime) - strtotime($datetime_array[0]);

        $day=floor(($uptime)/86400);
        $hour=floor(($uptime)%86400/3600);
        $minute=floor(($uptime)%86400%3600/60);
        $second=floor(($uptime)%86400%60);
        $data['run_time'] = "<span id='day'>".$day."</span>天<span id='hour'>".$hour."</span>小时<span id='minute'>".$minute."</span>分钟<span id='second'>".$second."</span>秒";

        // 硬盘用量
        $out = '';
        $info = exec('wmic logicaldisk get FreeSpace,size /format:list',$out,$status);
        $hd = '';
        foreach($out as $vaule){
            $hd .= $vaule . ' ';;
        }
        $hd_array = explode('   ', trim($hd));
        $key = 'CDEFGHIJKLMNOPQRSTUVWXYZ';
        foreach($hd_array as $k => $v){
            $s_array = explode('Size=', $v);
            $fs_array = explode('FreeSpace=', $s_array[0]);
            $size = round(trim($s_array[1])/(1024*1024*1024), 1);
            $freespace = round(trim($fs_array[1])/(1024*1024*1024), 1);
            $drive = $key[$k];
            $data['hdd'][$drive] = array('drive'=> $drive, 'size'=> $size, 'freespace'=> $freespace, 'use'=> (($size - $freespace) / $size) * 100);
        }
        // 物理内存
        $out = '';
        $info = exec('wmic os get TotalVisibleMemorySize,FreePhysicalMemory',$out,$status);
        # 多个空格转为一个空格
        $phymem = preg_replace ( "/\s(?=\s)/","\\1",$out[1]);
        $phymem_array = explode(' ',$phymem);
        $freephymem = ceil($phymem_array[0]/1024);
        $totalphymem = ceil($phymem_array[1]/1024);
        $data['pm'] = array('size'=> $totalphymem, 'freespace'=> $freephymem, 'use'=> (($totalphymem - $freephymem) / $totalphymem) * 100);
        return $data;
    }
}