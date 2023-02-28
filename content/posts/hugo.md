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

站点样式采用 [**FixIt**](https://github.com/hugo-fixit/FixIt)

```git
git submodule update --remote --merge
```

