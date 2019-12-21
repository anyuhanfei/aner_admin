<?php
namespace app\admin\controller;

use think\facade\Env;


class Base{
    public function __construct(){
        $this->version = Env::get('ANER_ADMIN_VERSION');
        //调试模式，true开false关
        $this->debug = Env::get('ANER_ADMIN_DEBUG');
        //管理员异常登录的最大次数
        $this->admin_error_login_maximum = Env::get('ANER_ADMIN_ADMIN_ERROR_LOGIN_MAXIMUM');
        //管理员异常登录后的冻结时间
        $this->admin_freeze_time = Env::get('ANER_ADMIN_ADMIN_FREEZE_TIME');
        //列表分页每页数据量
        $this->page_number = Env::get('ANER_ADMIN_PAGE_DATA_NUMBER');

        /*cms*/
        //标签图片上传开关
        $this->cms_tag_image_onoff = Env::get('ANER_ADMIN_CMS_TAG_IMAGE_ONOFF');
        //分类图片上传开关
        $this->cms_category_image_onoff = Env::get('ANER_ADMIN_CMS_CATRGORY_IMAGE_ONOFF');
        //文章字段控制
        $this->cms_article = [
            'tag_ids'=> Env::get('ANER_ADMIN_CMS_TAG_IDS_ONOFF'),  //文章标签
            'author'=> Env::get('ANER_ADMIN_CMS_AUTHOR_ONOFF'),  //作者
            'intro'=> Env::get('ANER_ADMIN_CMS_INTRO_ONOFF'),  //简介
            'keyword'=> Env::get('ANER_ADMIN_CMS_KEYWORD_ONOFF'),  //关键字
            'image'=> Env::get('ANER_ADMIN_CMS_IMAGE_ONOFF'),  //图片
            'content_type'=> Env::get('ANER_ADMIN_CMS_CONTENT_TYPE_ONOFF'),  //文章格式
        ];

        /*会员*/
        //会员标识，用于会员与其他表之间的关联标识（user_id是计算机识别的关联标识，此设置为会员识别的关联标识）
        $this->user_identity = 'phone';
        //会员唯一标识说明
        $this->user_identity_text = '手机号';
        //会员资金种类，key为资金类型说明，value为字段名
        $this->user_fund_type = ['余额'=> 'money'];
        //会员删除操作的开关
        $this->user_delete_onoff = Env::get('ANER_ADMIN_USER_DELETE_ONOFF');
    }
}