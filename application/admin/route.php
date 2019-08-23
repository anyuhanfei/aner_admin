<?php
use think\Route;

/**
 * admin
 */
// 首页模块
Route::get('adm', 'admin/index/index');

// 登录模块
Route::get('adm/login', 'admin/login/login');
Route::post('adm/login/submit', 'admin/login/login_submit');

// 广告模块
Route::get('adm/ad', 'admin/ad/ad');
Route::get('adm/adv/add', 'admin/ad/ad_adv_add');
Route::post('adm/adv/add/submit', 'admin/ad/ad_adv_add_submit');
Route::get('adm/adv/update/:id', 'admin/ad/ad_adv_update');
Route::post('adm/adv/update/submit/:id', 'admin/ad/ad_adv_update_submit');
Route::get('adm/adv/delete/submit/:id', 'admin/ad/ad_adv_delete_submit');
Route::get('adm/ad/add', 'admin/ad/ad_ad_add');
Route::post('adm/ad/add/submit', 'admin/ad/ad_ad_add_submit');
Route::get('adm/ad/update/:id', 'admin/ad/ad_ad_update');
Route::post('adm/ad/update/submit/:id', 'admin/ad/ad_ad_update_submit');
Route::get('adm/ad/delete/submit/:id', 'admin/ad/ad_ad_delete_submit');
Route::post('adm/ad/img', 'admin/ad/ad_img');

// 管理模块
Route::get('adm/role', 'admin/adm/role');
Route::get('adm/role/add', 'admin/adm/role_add');
Route::post('adm/role/add/submit', 'admin/adm/role_add_submit');
Route::get('adm/role/update/:id', 'admin/adm/role_update');
Route::post('adm/role/update/submit/:id', 'admin/adm/role_update_submit');
Route::get('adm/role/delete/submit/:id', 'admin/adm/role_delete_submit');
Route::get('adm/role/power/:id', 'admin/adm/role_power');
Route::post('adm/role/power/submit/:id', 'admin/adm/role_power_submit');
Route::get('adm/admin', 'admin/adm/admin');
Route::get('adm/admin/add', 'admin/adm/admin_add');
Route::post('adm/admin/add/submit', 'admin/adm/admin_add_submit');
Route::get('adm/admin/update/:id', 'admin/adm/admin_update');
Route::post('adm/admin/update/submit/:id', 'admin/adm/admin_update_submit');
Route::get('adm/admin/delete/submit/:id', 'admin/adm/admin_delete_submit');
Route::post('adm/admin/allot', 'admin/adm/admin_allot');

//模块管理
Route::get('adm/module', 'admin/developer/module');
Route::get('adm/module/add', 'admin/developer/module_add');
Route::post('adm/module/add/submit', 'admin/developer/module_add_submit');
Route::get('adm/module/update/:id', 'admin/developer/module_update');
Route::post('adm/module/update/submit/:id', 'admin/developer/module_update_submit');
Route::get('adm/module/delete/submit/:id', 'admin/developer/module_delete_submit');
Route::get('adm/action', 'admin/developer/action');
Route::get('adm/action/add', 'admin/developer/action_add');
Route::post('adm/action/add/submit', 'admin/developer/action_add_submit');
Route::get('adm/action/update/:id', 'admin/developer/action_update');
Route::post('adm/action/update/submit/:id', 'admin/developer/action_update_submit');
Route::get('adm/action/delete/submit/:id', 'admin/developer/action_delete_submit');
Route::get('adm/catalog', 'admin/developer/catalog');
Route::get('adm/catalog/add', 'admin/developer/catalog_add');
Route::post('adm/catalog/add/submit', 'admin/developer/catalog_add_submit');
Route::get('adm/catalog/update/:id', 'admin/developer/catalog_update');
Route::post('adm/catalog/update/submit/:id', 'admin/developer/catalog_update_submit');
Route::get('adm/catalog/delete/submit/:id', 'admin/developer/catalog_delete_submit');

// 日志模块
Route::get('adm/admin/operation/log', 'admin/log/admin_operation_log');
Route::get('adm/admin/login/log', 'admin/log/admin_login_log');

//个人模块
Route::get('adm/me/detail', 'admin/me/detail');
Route::post('adm/me/detail/submit', 'admin/me/detail_submit');
Route::get('adm/me/update/password', 'admin/me/update_password');
Route::post('adm/me/update/password/submit', 'admin/me/update_password_submit');

//资源模块
Route::get('adm/resource/table', 'admin/resource/table');
Route::get('adm/resource/form', 'admin/resource/form');
Route::get('adm/resource/icon', 'admin/resource/icon');
Route::get('adm/resource/button', 'admin/resource/button');
Route::get('adm/resource/text', 'admin/resource/text');
Route::get('adm/resource/notify', 'admin/resource/notify');

//网站设置
Route::get('adm/basic', 'admin/webset/basic');
Route::post('adm/basic/submit', 'admin/webset/basice');
Route::get('adm/set', 'admin/webset/set');
Route::get('adm/set/category/add', 'admin/webset/set_category_add');
Route::post('adm/set/category/add/submit', 'admin/webset/set_category_add_submit');
Route::get('adm/set/category/update/:id', 'admin/webset/set_category_update');
Route::post('adm/set/category/update/submit/:id', 'admin/webset/set_category_update_submit');
Route::get('adm/set/category/delete/submit/:id', 'admin/webset/set_category_delete_submit');
Route::get('adm/set/add', 'admin/webset/set_set_add');
Route::post('adm/set/add/submit', 'admin/webset/set_set_add_submit');
Route::get('adm/set/update/:id', 'admin/webset/set_set_update');
Route::post('adm/set/update/submit/:id', 'admin/webset/set_set_update_submit');
Route::get('adm/set/delete/submit/:id', 'admin/webset/set_set_delete_submit');
Route::post('adm/set/value/submit/:id', 'admin/webset/set_set_value_submit');

//文章管理
Route::get('adm/cms/tag', 'admin/cms/tag');
Route::get('adm/cms/tag/add', 'admin/cms/tag_add');
Route::post('adm/cms/tag/add/submit', 'admin/cms/tag_add_submit');
Route::get('adm/cms/tag/update/:id', 'admin/cms/tag_update');
Route::post('adm/cms/tag/update/submit/:id', 'admin/cms/tag_update_submit');
Route::get('adm/cms/tag/delete/submit/:id', 'admin/cms/tag_delete_submit');
Route::get('adm/cms/category', 'admin/cms/category');
Route::get('adm/cms/category/add', 'admin/cms/category_add');
Route::post('adm/cms/category/add/submit', 'admin/cms/category_add_submit');
Route::get('adm/cms/category/update/:id', 'admin/cms/category_update');
Route::post('adm/cms/category/update/submit/:id', 'admin/cms/category_update_submit');
Route::get('adm/cms/category/delete/submit/:id', 'admin/cms/category_delete_submit');
Route::get('adm/cms/article', 'admin/cms/article');
Route::get('adm/cms/article/add', 'admin/cms/article_add');
Route::post('adm/cms/article/add/submit', 'admin/cms/article_add_submit');
Route::post('adm/cms/img', 'admin/cms/article_img');
Route::get('adm/cms/article/update/:id', 'admin/cms/article_update');
Route::post('adm/cms/article/update/submit/:id', 'admin/cms/article_update_submit');
Route::post('adm/cms/article/delete/submit/:id', 'admin/cms/article_delete_submit');
Route::get('adm/cms/article/content/:id', 'admin/cms/article_content');