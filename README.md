# ruoyi-vue-example
整合多模块分离例子


## 简介

前端采用Vue、Element UI

后端采用Spring Boot、Spring Security、Redis & Jwt

高效率开发，使用代码生成器可以一键生成前后端代码

没有相关环境的小伙伴，吃我俩枣子
## 接口文档

[http://ip:port/swagger-ui.html](http://ip:port/swagger-ui.html)

## 模块组成

1、**`ruoyi-admin`** 后台服务模块，后台控制的Controller在这里

2、**`ruoyi-common`** 工具类模块，包含公用的工具类和类库

3、**`ruoyi-framework`** 框架核心模块，包括config系统配置、过滤器

4、**`ruoyi-generator`** 代码生成器模块，对代码生成内容格式的控制

5、**`ruoyi-quartz`** 定时任务模块，作业调度的地方，定时执行任务

6、**`ruoyi-system`** 系统代码模块，包含系统Controller所用到的业务和实体

7、**`your's module`**  自定义模块,也是具体操作模块

...

## 主要扩展

* `flyway` 数据库版本控制

* `mybatis-plus` 数据库插件

## 开始项目步骤

1、配置项目maven地址 (我建议是配置，原因不解释，他是管理依赖)
<img src="http://m.qpic.cn/psc?/V12PDn0m3Qk5yx/ruAMsa53pVQWN7FLK88i5hh2614R5R5xUltXu3Oy8*zM*qj64mOsT.X1h3aMUEwoDJp5CUue8YTWiojqcsmwH7nfgnfx*uVEuqMyhd8pyXs!/mnull&bo=7QKlAO0CpQADCSw!&rf=photolist&t=5">

2、克隆项目

```bash
依次clone
git clone https://github.com/fumingqin/backEndLib.git

maven clean	#清理
maven install	#打包

git clone https://github.com/liuxs123/ruoyi-vue-gl.git
```
3、创建数据库修改对应`yml`文件
<img src="http://m.qpic.cn/psc?/V12PDn0m3Qk5yx/ruAMsa53pVQWN7FLK88i5myG8lToRA0rLBdKfoRQjR2HkJMDdzJEytxadn7vbVX*TZDEO2kgp3d95f.9ruQjFvOcTCjPG32PysakLLxvE1o!/mnull&bo=bAMnAQAAAAADB2s!&rf=photolist&t=5">
4、运行后端项目

`如下说明成功`
<img src="http://m.qpic.cn/psc?/V12PDn0m3Qk5yx/ruAMsa53pVQWN7FLK88i5j7ddtIh1beOBRzDnJgGfNJHSZ3FbE8KU8KPQcxT*9QYx3bDMaTTa1ZKi.PU1x2UGP8P4.KbgPFkgggokMmFgbc!/mnull&bo=hgZgAQAAAAADB8M!&rf=photolist&t=5">
5、根据前端readme提示运行前端项目`example-ui`

```bash
npm install     #安装依赖
npm run dev	#运行
```

