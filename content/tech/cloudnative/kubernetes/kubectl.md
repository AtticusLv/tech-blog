---
title: "kubectl command"
date: 2023-03-01T17:03:10+08:00
layout: cloudnative
tags:
- kubernetes
- k8s
categories:
- 云原生
# 技术文档分类
catalog: 云原生
---

## kubectl指令

帮助

```
kubectl --help
```

查看apiVersion

```
kubectl api-versions
```

创建pod

```
kubectl create -f [file.yaml] -n [namespace]
```

应用配置

```
kubectl apply -f [file.yaml] -n [namespace]
```

删除资源

```
kubectl delete -f [file.yaml] -n [namespace]
```

查看pods

```
kubectl get pods
```

查看service

```
kubectl get services
```

查看deployment

```
kubectl get deployments
```

查看详细信息 (后面加-o wide)

```
kubectl get pods -o wide
kubectl get services -o wide
kubecetl get deployments -o wide
```

进入到指定pod

```
kubectl exec -it [pod name] -n [namespace] -- bash

# desprecated
kubectl exec -it [pod name] bash
```

查看指定容器log

```
kubectl logs -f service-a-v1-97966586b-cg6rh -n [namespace] -c istio-init
```

查看k8s当前集群配置信息

```
kubectl config view
```

查看pod里容器数

```
kubectl get pods [pod名称] -o jsonpath={.spec.initContainers[*].name} -n [namespace]
```



