# 使用命令行查询目录下文件大小


<!--more-->

命令如下

```bash
find . -maxdepth 1 -type d ! -name "." ! -name ".." -print0 2>/dev/null \
  | xargs -0 du -sk 2>/dev/null \
  | sort -rn \
  | awk '{
      size = $1 / 1024;
      path = $0;
      sub(/^[0-9]+[[:space:]]+/, "", path);  # 移除开头的数字和空白
      gsub(/^\.\/+/, "", path);               # 清理路径前缀 "./"
      printf "%7.2f MB  %s\n", size, path
    }'

```



---

> 作者: 大卓  
> URL: https://nuoyang.tech/posts/2026/72ab2f1/  

