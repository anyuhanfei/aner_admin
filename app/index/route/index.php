<?php
use think\facade\Route;

// 首页
Route::get('/', 'index/index/index');

// 登录
Route::get('/login', 'index/login/login');