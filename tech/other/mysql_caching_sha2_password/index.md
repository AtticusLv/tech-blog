# Mysql修改root密码，修复caching_sha2_password无法连接问题


通过Sequel连接mysql时发现无法连接，报错为：
```
MySQL said: Authentication plugin &#39;caching_sha2_password&#39; cannot be loaded: dlopen(/usr/local/lib/pl.....
```

原因是mysql8默认为**caching_sha2_password**加密方式，而sequel只支持**mysql_native_password**

# 修复方式
可以直接使用sql server来连接，在安装时选择支持全部的加密方式

本文因项目需要，手动改mysql的加密方式

1. 加入mysql
```
mysql -uroot -p
```

2. 查看当前信息
```
use mysql;
select Host, User, plugin from user;
```
可以看到

```
&#43;-----------&#43;------------------&#43;-----------------------&#43;
| Host      | User             | plugin                |
&#43;-----------&#43;------------------&#43;-----------------------&#43;
| %         | root             | caching_sha2_password |
| localhost | mysql.infoschema | caching_sha2_password |
| localhost | mysql.session    | caching_sha2_password |
| localhost | mysql.sys        | caching_sha2_password |
| localhost | root             | mysql_native_password |
&#43;-----------&#43;------------------&#43;-----------------------&#43;
```
只修改root@localhost是不够的，root@%也需要修改
3. 修改加密方式

```
alter user &#39;root&#39;@&#39;localhost&#39; identified with mysql_native_password by &#39;12345678&#39;;
alter user &#39;root&#39;@&#39;%&#39; identified with mysql_native_password by &#39;12345678&#39;;
```

4. 刷新
```
flush privileges;
```

---

> 作者: 大卓  
> URL: https://nuoyang.tech/tech/other/mysql_caching_sha2_password/  

