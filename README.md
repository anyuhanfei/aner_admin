# aner_admin3
当前版本: 3.3.1

使用框架：`ThinkPHP6.0.3`

## 使用前置操作
- 在项目根目录下打开命令行输入 "composer install" 命令来安装更新扩展
- 将项目根目录下的 ".env.default" 文件的文件名修改为 ".env"

## 安装扩展

### vendor

==仅列出了需手动安装的扩展，安装 `thinkphp6` 时自带的扩展未列出==

- `think-multi-app` -- 多应用模式扩展
  - 安装命令：`composer require topthink/think-multi-app`
- `think-view` -- 模板引擎
  - 安装命令：`composer require topthink/think-view`
  - 自动安装 `think-template` 依赖库

## 配置文件

`.env.default` 文件中有项目所需的所有参数，但因一些敏感信息和保密信息，这个文件中的参数值不是正确的。

修改参数值后，需要在同目录下创建新文件或直接将此文件改名为`.env`，配置文件才能生效。


## 一些未完成的脑洞和问题
- 搜索栏输入会员账号、手机号、昵称等，输入一点显示匹配会员

## 更新日志

查看更新日志请点击 https://github.com/anyuhanfei/aner_admin/blob/master/public/log.md