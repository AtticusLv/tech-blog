# Git迁移已有仓库到新仓库


## 目标

- [x] 将一个已有的仓库里全部内容迁移到新的仓库里去

- [x] 迁移后保留commit历史记录和所有分支



## 步骤

### 1. 创建新仓库

在git托管平台上手动创建代码仓库



### 2. 克隆旧仓库

```
git clone git@github.com:xxx/A.git --bare
```



### 3. 推送新仓库

```
cd A.git
# 推送所有分支
git push git@github.com:xxx/B.git --all
# 推送所有tag
git push git@github.com:xxx/B.git --tags
```



---

> 作者: 大卓  
> URL: https://nuoyang.tech/tech/other/git_migrate_existed_repository/  

