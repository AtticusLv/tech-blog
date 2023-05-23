---
title: "本地测试不注册Eureka"
date: 2023-05-23T10:11:25+08:00
tags:
- eureka
categories:
- 技术
# 技术文档分类：架构/云原生/Linux/其他
catalog: 其他
---

## 本地开发时不注册Eureka

在启动指令中加入

```
--eureka.instance.metadata-map.version=LOCAL
```

