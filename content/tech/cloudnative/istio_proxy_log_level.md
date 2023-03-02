---
title: "调整Istio Proxy日志级别"
date: 2023-03-02T13:35:39+08:00
tags:
- istio
categories:
- 技术
# 技术文档分类：架构/云原生/Linux/其他
catalog: 云原生 
---

> 日志级别包括```trace, debug, info, warning, error, critical, off```

## istioctl命令动态调整

istio默认使用的```warning```级别的日志，可以通过istioctl命令来指定sidecar修改日志级别

```
istioctl -n [namespace] proxy-config log [podname] --level debug
```

可以更细粒度的控制proxy的各个组件的日志级别

```
istioctl -n [namespace] proxy-config log [podname] --level grpc:trace,config:debug
```

当然，proxy-config也可以缩写，istioctl都可以识别到的

```
istioctl -n [namespace] pc log [podname] --level debug
```

envoy有提供admin的api，直接进入到容器内容```curl```调用接口来调整也是可以的

```
kubectl exec -n [namespace]  [podname] -c istio-proxy -- curl -XPOST -s -o /dev/null http://localhost:15000/logging?level=debug
```

这里istio-proxy是istio部署sidecar时固定的容器名字

可以通过一下命令查看帮助文档

```
istioctl pc log --help
```



## annotation方式调整

可以在k8s yaml配置文件中通过annotation的方式配置日志级别

```
  template:
    metadata:
      annotations:
        "sidecar.istio.io/logLevel": debug # 可选: trace, debug, info, warning, error, critical, off
```

## 全局配置

istio配置都是在configmap中的，可以通过修改configmap来修改全局的proxy日志级别：

```
kubectl -n istio-system edit configmap istio-sidecar-injector
```

修改```values```里面的```global.proxy.logLevel```字段即可

也可以使用istioctl来配置全局proxy日志级别

```
istioctl install --set profile=demo --set values.global.proxy.logLevel=debug
```

## 配置envoy componentLogLevel

我们可以在pod中指定annotation来设置envoy内部各个组件的日志级别

```
  template:
    metadata:
      annotations:
        "sidecar.istio.io/componentLogLevel": "ext_authz:trace,filter:debug"
```

可以参考：https://www.envoyproxy.io/docs/envoy/latest/operations/cli#cmdoption-component-log-level

最终该配置会作为envoy```--component-log-level```启动参数

