---
layout: '[post]'
title: syzoj中文简易docker版搭建教程
date: 2018-05-13 16:24:25
tags:
---

今天，由likecoding的博主给大家带来如何安装syzoj

## 准备工具：
一台ubuntu18.04的电脑

本文GitHub地址： https://github.com/jyeric/hexo3/blob/master/source/_posts/syzoj.md

本文第二链接（自己的hexo博客链接）：https://jyeric.likecoding.gq

更新将在第二链接及github进行更新csdn请关注评论内容

预备依赖项：

```
sudo apt-get update && sudo apt-get install -y vim git
sudo apt-get install docker-compose
```

## 第一步 git clone (注：git内容不是我写的，出现问题请加入loj群询问）
```
git clone https://github.com/hewenyang/syzoj-docker
```
## 第二步 sandbox
```
cd ..   （回到根目录中）
cd home
mkdir hewenyang
cd hewenyang
```
下载sandbox （注：sandbox不是我写的，安全性未知，内容请询问t123yh）
```
https://seafile.t123yh.xyz:2/f/65f061a56f414b3db478/
```
服务器请先下载，使用filezilla进行上传

## 第三部 修改文件
```
cd ..
```
（返回根目录）
```
vi /etc/default/grub
```
找到 `GRUB_CMDLINE_LINUX_DEFAULT` 一行，在引号内加入 `swapaccount=1`

如果在这一行中有其他内容请在引号内先空格，再加入上述内容

## 备注：配置文件
*daemon.json* 默认，不建议更改

位置：syzoj-docker/config/daemon.json
```
{
    "RabbitMQUrl": "amqp://localhost/",
    "RedisUrl": "redis://127.0.0.1:6379",
    "TestData": "/mnt/syzoj-data/uploads/testdata",
    "Priority": 1,
    "DataDisplayLimit": 100,
    "TempDirectory": "/tmp"
}
```
*runner-shared.json*默认，不建议更改
位置：syzoj-docker/config/runner-shared.json
```
{
    "RabbitMQUrl": "amqp://localhost/",
    "RedisUrl": "redis://127.0.0.1:6379",
    "TestData": "/mnt/syzoj-data/uploads/testdata",
    "Priority": 1,
    "DebugMessageDisplayLimit": 5000,
    "OutputLimit": 104857600,
    "StderrDisplayLimit": 5120,
    "DataDisplayLimit": 128,
    "CompilerMessageLimit": 50000,
    "SpjTimeLimit": 1501,
    "SpjMemoryLimit": 256,
    "SandboxEnvironments": [
        "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        "HOME=/tmp"
    ],
    "SandboxUser": "nobody",
    "SandboxRoot": "/sandbox-rootfs",
    "BinaryDirectory": "/mnt/syzoj-bin"
}
```
*web.json*可以更改，更改请见下面说明
位置：syzoj-docker/config/web.json
```
{
  "title": "SYZOJ", // 网站名，可以改！
  "hostname": "0.0.0.0",   // 不要改！
  "db": {
    "database": "syzoj",  //若使用外部mysql数据库，请进行更改
    "username": "syzoj",
    "password": "syzoj",
    "host": "mysql",
    "dialect": "mysql"
  },
  "register_mail": false,   // 见 https://github.com/syzoj/syzoj#邮件配置
  "email": {
    "method": "aliyundm",
    "options": {
      "AccessKeyId": "xxxx",
      "AccessKeySecret": "xxxx",
      "AccountName": "xxxx"
    }
  },
  "upload_dir": "uploads", // 评测数据上传目录
  "default": {             // 默认配置
    "problem": {
      "time_limit": 1000,  // 时间限制
      "memory_limit": 256  // 内存限制
    },
    "user": {
      "show": true,
      "rating": 1500
    }
  },
  "sorting": {
    "ranklist": {
      "field": "rating",
      "order": "desc"
    },
    "problem": {
      "field": "id",
      "order": "asc"
    }
  },
  "limit": {
    "time_limit": 10000,
    "memory_limit": 1024,
    "data_size": 209715200,
    "testdata": 209715200,
    "submit_code": 102400,
    "submit_answer": 10485760,
    "custom_test_input": 20971520,
    "testdata_filecount": 5
  },
  "page": {
    "problem": 50,
    "problem_statistics": 10,
    "judge_state": 10,
    "ranklist": 20,
    "discussion": 10,
    "article_comment": 10,
    "contest": 10,
    "edit_contest_problem_list": 10,
    "edit_problem_tag_list": 10
  },
  "languages": {
    "cpp": {
      "show": "C++",
      "highlight": "cpp",
      "version": "GCC 5.4.0",
      "editor": "c_cpp"
    },
    "cpp11": {
      "show": "C++11",
      "highlight": "cpp",
      "version": "GCC 5.4.0",
      "editor": "c_cpp"
    },
    "csharp": {
      "show": "C#",
      "highlight": "csharp",
      "version": "MCS 4.8.0.0, Mono 4.8.0",
      "editor": "csharp"
    },
    "c": {
      "show": "C",
      "highlight": "c",
      "version": "GCC 5.4.0",
      "editor": "c_cpp"
    },
    "vala": {
      "show": "Vala",
      "highlight": "vala",
      "version": "Vala 0.30.1, GCC 5.4.0",
      "editor": "vala"
    },
    "java": {
      "show": "Java",
      "highlight": "java",
      "version": "GCC 5.4.0",
      "editor": "java"
    },
    "pascal": {
      "show": "Pascal",
      "highlight": "pascal",
      "version": "FPC 3.0.0",
      "editor": "pascal"
    },
    "lua": {
      "show": "Lua",
      "highlight": "lua",
      "version": "Lua 5.2.4",
      "editor": "lua"
    },
    "luajit": {
      "show": "LuaJIT",
      "highlight": "lua",
      "version": "LuaJIT 2.0.4",
      "editor": "lua"
    },
    "python2": {
      "show": "Python 2",
      "highlight": "python",
      "version": "CPython 2.7.12",
      "editor": "python"
    },
    "python3": {
      "show": "Python 3",
      "highlight": "python",
      "version": "CPython 3.5.2",
      "editor": "python"
    },
    "nodejs": {
      "show": "Node.js",
      "highlight": "js",
      "version": "7.7.3",
      "editor": "javascript"
    },
    "ruby": {
      "show": "Ruby",
      "highlight": "ruby",
      "version": "2.3.1",
      "editor": "ruby"
    },
    "haskell": {
      "show": "Haskell",
      "highlight": "haskell",
      "version": "GHC 7.10.3",
      "editor": "haskell"
    },
    "ocaml": {
      "show": "OCaml",
      "highlight": "ocaml",
      "version": "Ocamlbuild 4.02.3",
      "editor": "ocaml"
    },
    "vbnet": {
      "show": "Visual Basic",
      "highlight": "vbnet",
      "version": "VBNC 0.0.0.5943, Mono 4.8.0",
      "editor": "vbscript"
    }
  },
  "links": [ // 友链
    {
      "title": "LibreOJ",
      "url": "https://loj.ac/"
    }
  ],
  "session_secret": "233",                      // session
  "judge_server_addr": "http://127.0.0.1:5284", // 评测机地址
  "judge_token": "233",                         // 评测机 Token
  "email_jwt_secret": "test"                    // email jsonwebtoken secret
}
```
docker-compose.yml:
位置:syzoj-docker/docker-compose.yml
```
version: '2.3'
services:
  web:
    build: .
    ports:
      - "5283:5283"   //5283:5283前面的是暴露的端口可以改成80（80:5283,后面的不要改动
    tmpfs:
      - /mnt/syzoj-tmp1
      - /mnt/syzoj-tmp2
      - /mnt/syzoj-bin
    volumes:
      - /home/hewenyang/syzoj-docker/sandbox-rootfs:/sandbox-rootfs
      - /opt/syzoj/data:/mnt/syzoj-data
    privileged: true
    networks:
      syzoj_net:
        ipv4_address: 172.16.0.2
        ipv6_address: fc00::10
    depends_on:
      - mysql

    stdin_open: true
    tty: true
  mysql:
    image: "mysql:5.6"
    networks:
      syzoj_net:
        ipv4_address: 172.16.0.3
        ipv6_address: fc00::11
    environment:
      MYSQL_ROOT_PASSWORD: "root"

networks:
  syzoj_net:
    driver: bridge
    enable_ipv6: true
    ipam:
      driver: default
      config:
        - subnet: 172.16.0.0/24
        - subnet: fc00::/64
```
## 第四部 安装

回到刚才git clone的目录

运行 `docker-compose up -d`，随后便可以通过 127.0.0.1:5283 （或您指定的端口）访问。根据网络情况，构建过程可能会花费几分钟至几小时不等，也可能由于失败而中断，重新执行该指令即可，直到最终显示出 mysql 和 web 等字样。

打开`你的ip:5283`就可以访问了，注册一个号，即可使用。

## 第五步 安装后的操作
可以通过 `docker exec -it build_web_1 /bin/bash` 来访问容器的 shell。

随后执行 `mysql -hmysql -uroot -proot` 可以访问 MySQL 服务器，执行赋予管理员权限等操作。

在user中的is_admin体现了是不是管理员

然后就可以放题目了！

## 参考资料
1.官方syzoj:https://github.com/syzoj/syzoj

2.syzoj-docker:https://github.com/hewenyang/syzoj-docker

3.billchenchina的博客:https://billchen.bid/jekyll/update/2018/05/13/SYZOJ-Install-Guide/

更新日期：20180822
