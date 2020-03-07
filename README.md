# aner_admin3

使用框架：`ThinkPHP6.0.0`

## 使用前置操作
- 在项目根目录下打开命令行输入 "composer install" 命令来安装更新扩展
- 将项目根目录下的 ".example.env" 文件的文件名修改为 ".env"

## 安装扩展

### vendor

==仅列出了需手动安装的扩展，安装 `thinkphp6` 时自带的扩展未列出==

- `think-multi-app` -- 多应用模式扩展
  - 安装命令：`composer require topthink/think-multi-app`
- `think-view` -- 模板引擎
  - 安装命令：`composer require topthink/think-view`
  - 自动安装 `think-template` 依赖库

## 配置文件

`.example.env` 文件中有项目所需的所有参数，但因一些敏感信息和保密信息，这个文件中的参数值不是正确的。

修改参数值后，需要在同目录下创建新文件或直接将此文件改名为`.env`，配置文件才能生效。


## 一些未完成的脑洞和问题
- 会员资金流水表内置
  - 预计表字段： 会员id 会员账号或手机号(系统的指定) 金额 资金类型 操作类型 说明 备注 时间
- 会员操作日志内置
  - 预计表字段： 会员id 操作说明 时间
  - 搜索栏输入会员账号、手机号、昵称等，输入一点显示匹配会员
- 广告位修改报错
- 广告位应该添加一个备注字段
