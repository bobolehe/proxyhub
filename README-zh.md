# 代理工具

`Proxy_list` 通过提供代理地址，实现通过网络通道检索免费代理IP地址。 通过验证代理来执行初始过滤，然后在使用它们之前进行第二轮筛选。 目标是获得稳定可靠的代理IP地址及其相应的端口。

# 来源

代理获取来源不展示

# 配置

在启动程序之前，需要修改配置文件中的参数

1. 权限相关
       1、启用权限需要访问接口时携带权限参数及参数值

2. 存储相关(redis)



# 使用方法

## 启动Flask项目

使用Python执行主文件或通过终端启动Flask程序

```bash
# -p post -h access
flask run -p 8888 -h 0.0.0.0
```

| 接口                          | 描述                                     |
| ----------------------------- | ---------------------------------------- |
| /proxy/get                    | 获取代理池代理                           |
| /proxy/all                    | 获取代理池全部代理                       |
| /proxy/verify/?url={url}      | 提交一个验证任务验证出指定地址可用代理   |
| /proxy/confirm/get/?url={url} | 通过指定地址获取任务验证出的可用代理     |
| /proxy/confirm/all/?url={url} | 通过指定地址获取任务验证出的可用全部代理 |

## 通过docker启动

需要安装完成docker，相关安装自行解决

修改目录下yml文件中

```
version: '3.0'

services:
  proxyhub:
    image: bobolehe/proxyhub:latest
    container_name: proxyhub
    ports:
      - "这里可修改为本地访问端口:8888"

```

```
# 后台启动
docker-compose up -d
```

# 代办项

| function | state | notes |
| -------- | ----- | ----- |
| 待定     |       |       |
|          |       |       |



# 环境依赖

除非你是通过拉取代码执行脚本，那么你需要安装一些必要依赖

```
pip install -r requirements.txt
playwright install  # 下载playwright需要依赖
```

