# My Wordpress Init

## 1st: 安装软件
安装LAMP环境，直接使用yum方式安装，因为我发现我用源码方式安装的有些页面访问不了，等以后有空了在研究吧，先把博客搭起来

<font color=red size=3 face="Courier New">**Linux + Apache 2.2 + MySQL 5.1 + PHP 5.3 + Varnish 2.1**</font>
(这么一看 确实够老的...有空在升升级吧...)

命令如下：
  > `yum -y install httpd mysql-server php php-mysql varnish`

## 2nd: 设置MySQL

先设置MySQL安装数据库、启动服务、安全初始化、创建数据库、授权
命令如下：
1. 安装数据库
  > `mysql_install_db --default-files=<my.cnf_path> --data_dir=<data_path>`

* 启动服务
  > `service mysqld start`

* 设置开机启动
  > `chkconfig mysqld on`

* 安全初始化
  > `mysql_secure_installation`

* 登陆MySQL后，创建数据库
  > mysql\> `create database <base_name> character set utf8;`

* 授权
  > mysql\> `grant all privileges on <base_name>.* to '<user>'@'localhost' identified by '<passwd>';`


## 3rd:下载wordpress并解压缩至数据盘
```
$ tar -xf wordpress-XXX.tar.gz
$ mv wordpress <blog_dir>
$ chown -R apache.apache <blog_dir>
```

## 4th:设置apache

修改apache配置文件
1. 修改根目录为对应的路径 <blog_dir>
* 修改监听端口80 为 8080
注： 其实，我是在安装好Wordpress后，在修改的端口
* 设置服务器名称 ServerName 为 localhost:80
  > ```
  DocumentRoot "/data/mywphtml"
  Listen 8080
  ServerName localhost:80
  ```

* 设置开机启动
  > `chkconfig httpd on `

* 启动服务
  > ` service httpd start`

## 5th:开始安装wordpress
一切都是根据前面的设置赋值即可
主要设置如下值:
  1. database_name
  * user
  * passwd

我是后来执行的chown命令，所以在开始安装之前，需要创建一个wp-config.php
并将一些文档复制上去...

## 6th:设置Varnish

1. 修改代理端口 8080
* 修改监听端口 80
* 设置开机启动，并启动服务
注：这里要注意httpd和varnish的顺序，不然会造成端口占用而启动失败
  1. 先修改httpd端口为8080，重启服务后
  * 在修改varnish的端口，然后接着重启服务

# 心得体会

不知道怎么写啊...好纠结
1. 遇到问题，先看日志
* 官方的文档是最权威的！ 但是不好找
* 网络上的文档很好找，但是很少能对症解决问题！
