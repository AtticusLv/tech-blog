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

## Hugo初始化搭建

官网：https://gohugo.io/

### 安装Hugo

安装方式有如下两种：

- 使用brew工具安装（国内镜像源一般都不是最新版本，有些新的主题无法使用）

```
brew install hugo
```

- 直接下载release文件绑定到PATH上

最新的release包可以在[Hugo releases](https://github.com/gohugoio/hugo/releases)拿到 



### 安装Theme

```
git submodule add https://github.com/AtticusLv/FixIt themes/FixIt
```



## 创建日常博客

### 只文字版

```
hugo new posts/xxx.md
```

### 图文版

```
hugo new posts/xxx/index.md
```

使用typora编辑时，会自动在posts/xxx/目录下增加相关图片目录

## 创建技术文档

### 只文字版

```
hugo new tech/[catalog]/xxx.md
```

### 图文版

```
hugo new tech/[catalog]/xxx/index.md
```

### 增加catalog分类



### 如何在1级标题栏【技术文档】增加2级目录

![image-20230301130258500](index.assets/image-20230301130258500.png)

以【cloudnative】举例

1. 在tech下创建目录/tech/cloudnative
2. 在layouts下创建目录/tech/cloudnative，创建文件```cloudnative.html```
3. 
4. 创建 ```_index.md``` 



<br/>

```
---
title: "架构文档"
layout: architecture
hidden: true
type: tech
summary: 历史文章按照年月归档.
url: /tech/architecture
menu:
  main:
    title: 架构文档
    parent: tech
    params:
      icon: fa-brands fa-readme
catalog: 架构
---
```




## 更新Theme样式

站点样式采用 [**FixIt**](https://github.com/hugo-fixit/FixIt)，因为有部分样式要调整，已fork到 ```https://github.com/AtticusLv/FixIt```

```git
git submodule update --remote --merge
```



## 使用bash一键提交

编辑bash脚本```./deploy.sh```一键提交git

```
./deploy.sh "[commit content]"
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

**注意**：使用前需要给脚本添加权限

```
chmod 755 deploy.sh
```





## 剩余未完成工作

- [ ] 搜索功能
- [ ] 代码块行数和复制功能
- [ ] 技术文档目录下展示所有文章不全
