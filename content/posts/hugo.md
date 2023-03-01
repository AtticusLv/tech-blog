---
title: Hugo写作指南
date: 2023-02-28T09:59:43+08:00
tags:
  - Hugo
categories:
  - Hugo
---
<!--more-->
> Tips：
>
> 本站点针对技术文档做过调整，写作方式只针对本博客

## 创建日常博客

### 只文字版

```
hugo new posts/xxx.md
```

### 图文版

```
hugo new posts/xxx/index.md
```



## 创建技术文档

### 只文字版

```
hugo new tech/[catalog]/xxx.md
```

### 图文版

```
hugo new tech/[catalog]/xxx/index.md
```




## 更新FixIt样式

站点样式采用 [**FixIt**](https://github.com/hugo-fixit/FixIt)，因为有部分样式要调整，已fork到 ``````

```git
git submodule update --remote --merge
```



## 使用bash一键提交

编辑bash脚本```./deploy.sh```一键提交git

```
./deploy.sh [commit content]
```

脚本内容如下：

```
#!/bin/bash
# date time
currentDateTime=`date '+%Y-%m-%d %H:%M:%S'`
commitMsg=$currentDateTime" "$1

echo "提交commit: "${commitMsg}

git add .
git commit -m "${commitMsg}"
git pull
git status

echo "git add/commit/pull done..."
# push to remote main branch
git push -u origin main
```

给脚本添加权限

```
chmod 755 deploy.sh
```

