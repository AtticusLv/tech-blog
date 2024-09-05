# Git迁移项目到新的地址




&gt; 将代码从仓库A迁移到仓库B



1. 创建一个新的仓库B
2. 从原地址克隆(使用--bare)

```
git clone --bare git@git.com:test/A.git
```

3、进入到该目录，push mirror

```
git push --mirror git@git.com:test/B.git
```



---

> 作者: 大卓  
> URL: https://nuoyang.tech/tech/other/git_clone_new_project/  

