<?php
use think\facade\Route;

// 首页模块
Route::get('/', 'admin/index/index');

// 登录模块
Route::get('login', 'admin/login/login');
Route::post('login/submit', 'admin/login/login_submit');
Route::get('login/out', 'admin/login/login_out');

// 广告模块
Route::get('ad', 'admin/ad/ad');
Route::get('adv/add', 'admin/ad/ad_adv_add');
Route::post('adv/add/submit', 'admin/ad/ad_adv_add_submit');
Route::get('adv/update/:id', 'admin/ad/ad_adv_update');
Route::post('adv/update/submit/:id', 'admin/ad/ad_adv_update_submit');
Route::post('adv/delete/submit/:id', 'admin/ad/ad_adv_delete_submit');
Route::get('ad/add', 'admin/ad/ad_ad_add');
Route::post('ad/add/submit', 'admin/ad/ad_ad_add_submit');
Route::get('ad/update/:id', 'admin/ad/ad_ad_update');
Route::post('ad/update/submit/:id', 'admin/ad/ad_ad_update_submit');
Route::post('ad/delete/submit/:id', 'admin/ad/ad_ad_delete_submit');
Route::post('ad/img', 'admin/ad/ad_img');

// 管理模块
Route::get('role', 'admin/adm/role');
Route::get('role/add', 'admin/adm/role_add');
Route::post('role/add/submit', 'admin/adm/role_add_submit');
Route::get('role/update/:id', 'admin/adm/role_update');
Route::post('role/update/submit/:id', 'admin/adm/role_update_submit');
Route::get('role/delete/submit/:id', 'admin/adm/role_delete_submit');
Route::get('role/power/:id', 'admin/adm/role_power');
Route::post('role/power/submit/:id', 'admin/adm/role_power_submit');
Route::get('admin', 'admin/adm/admin');
Route::get('admin/add', 'admin/adm/admin_add');
Route::post('admin/add/submit', 'admin/adm/admin_add_submit');
Route::get('admin/update/:id', 'admin/adm/admin_update');
Route::post('admin/update/submit/:id', 'admin/adm/admin_update_submit');
Route::get('admin/delete/submit/:id', 'admin/adm/admin_delete_submit');
Route::post('admin/allot', 'admin/adm/admin_allot');

//模块管理
Route::get('system/module', 'admin/system/module');
Route::get('system/module/add', 'admin/system/module_add');
Route::post('system/module/add/submit', 'admin/system/module_add_submit');
Route::get('system/module/update/:id', 'admin/system/module_update');
Route::post('system/module/update/submit/:id', 'admin/system/module_update_submit');
Route::post('system/module/delete/submit/:id', 'admin/system/module_delete_submit');
Route::get('system/action', 'admin/system/action');
Route::get('system/action/add', 'admin/system/action_add');
Route::post('system/action/add/submit', 'admin/system/action_add_submit');
Route::get('system/action/update/:id', 'admin/system/action_update');
Route::post('system/action/update/submit/:id', 'admin/system/action_update_submit');
Route::get('system/action/delete/submit/:id', 'admin/system/action_delete_submit');
Route::get('system/catalog', 'admin/system/catalog');
Route::get('system/catalog/add', 'admin/system/catalog_add');
Route::post('system/catalog/add/submit', 'admin/system/catalog_add_submit');
Route::get('system/catalog/update/:id', 'admin/system/catalog_update');
Route::post('system/catalog/update/submit/:id', 'admin/system/catalog_update_submit');
Route::post('system/catalog/delete/submit/:id', 'admin/system/catalog_delete_submit');

// 日志模块
Route::rule('admin/operation/log', 'admin/log/admin_operation_log');
Route::rule('admin/login/log', 'admin/log/admin_login_log');

//个人模块
Route::get('me/detail', 'admin/me/detail');
Route::post('me/detail/submit', 'admin/me/detail_submit');
Route::get('me/update/password', 'admin/me/update_password');
Route::post('me/update/password/submit', 'admin/me/update_password_submit');

//资源模块
Route::get('system/resource/table', 'admin/system/table');
Route::get('system/resource/form', 'admin/system/form');
Route::get('system/resource/icon', 'admin/system/icon');
Route::get('system/resource/button', 'admin/system/button');
Route::get('system/resource/text', 'admin/system/text');
Route::get('system/resource/notify', 'admin/system/notify');

//网站设置
Route::get('basic', 'admin/webset/basic');
Route::post('basic/submit', 'admin/webset/basic_submit');
Route::get('setting/[:cgory]', 'admin/webset/setting');
Route::get('setting/add/input', 'admin/webset/setting_add');
Route::post('setting/add/submit', 'admin/webset/setting_add_submit');
Route::post('setting/value/submit', 'admin/webset/setting_value_submit');

//文章管理
Route::get('cms/tag', 'admin/cms/tag');
Route::get('cms/tag/add', 'admin/cms/tag_add');
Route::post('cms/tag/add/submit', 'admin/cms/tag_add_submit');
Route::get('cms/tag/update/:id', 'admin/cms/tag_update');
Route::post('cms/tag/update/submit/:id', 'admin/cms/tag_update_submit');
Route::get('cms/tag/delete/submit/:id', 'admin/cms/tag_delete_submit');
Route::get('cms/category', 'admin/cms/category');
Route::get('cms/category/add', 'admin/cms/category_add');
Route::post('cms/category/add/submit', 'admin/cms/category_add_submit');
Route::get('cms/category/update/:id', 'admin/cms/category_update');
Route::post('cms/category/update/submit/:id', 'admin/cms/category_update_submit');
Route::get('cms/category/delete/submit/:id', 'admin/cms/category_delete_submit');
Route::rule('cms/article', 'admin/cms/article');
Route::get('cms/article/add', 'admin/cms/article_add');
Route::post('cms/article/add/submit', 'admin/cms/article_add_submit');
Route::post('cms/img', 'admin/cms/article_img');
Route::get('cms/article/update/:id', 'admin/cms/article_update');
Route::post('cms/article/update/submit/:id', 'admin/cms/article_update_submit');
Route::post('cms/article/delete/submit/:id', 'admin/cms/article_delete_submit');
Route::get('cms/article/content/:id', 'admin/cms/article_content');
Route::post('cms/article/status/:id', 'admin/cms/article_status');

// 会员管理
Route::rule('user', 'admin/user/user');
Route::get('user/add', 'admin/user/user_add');
Route::post('user/add/submit', 'admin/user/user_add_submit');
Route::get('user/team/:id', 'admin/user/user_team');
Route::get('user/detail/:id', 'admin/user/user_detail');
Route::get('user/recharge/:id', 'admin/user/user_recharge');
Route::post('user/recharge/submit/:id', 'admin/user/user_recharge_submit');
Route::get('user/update/:id', 'admin/user/user_update');
Route::post('user/update/submit/:type/:id', 'admin/user/user_update_submit');
Route::get('user/freeze/:id', 'admin/user/user_freeze');
Route::get('user/delete/:id', 'admin/user/user_delete');
Route::rule('user/highlight/:id', 'admin/user/highlight');

Route::rule('user/fund/log', 'admin/log/user_fund_log');
Route::rule('user/operation/log', 'admin/log/user_operation_log');
