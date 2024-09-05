# 使用apt-Get安装工具


apt-get install是应用程序管理器，用于一键安装软件包，与源码安装不同的是，该指令会自动检测并安装依赖，而且用apt-get安装的包都是成熟的软件包，基本不存在安装包有严重bug或者文件缺失的情况。

1、首先执行如下命令，更新相关资源

```
apt-get update
```

  将所有包的来源更新，也就是提取最新的包信息，这一命令使用率非常高。

2、安装telnet

```
apt-get install telnet
```

3、安装curl

```
apt-get install curl
```

4、安装ifconfig

```
apt-get install net-tools
```

5、安装vim

```
apt-get install vim
```

6、安装ping

```
apt-get install inetutils-ping
```



---

> 作者: 大卓  
> URL: https://nuoyang.tech/tech/other/apt-get/  

