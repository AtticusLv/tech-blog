---
title: "git迁移项目到新的地址"
date: 2024-07-22T15:27:01+08:00
tags: 
- git
categories:
- 技术
# 技术文档分类：架构/云原生/Linux/其他
catalog: 其他
---



> 将代码从仓库A迁移到仓库B



1. 创建一个新的仓库B
2. 从原地址克隆(使用--bare)

```
git clone --bare git@git.com:test/A.git
```

3、进入到该目录，push mirror

```
git push --mirror git@git.com:test/B.git
```

