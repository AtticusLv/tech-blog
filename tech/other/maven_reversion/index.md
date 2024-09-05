# Maven Pom文件多版本管理revision





maven工程中，对多个子module及相应的pom版本进行管理是很头疼的事，利用**flatten-maven-plugin** 插件将pom版本统一管理起来，在变更的时候只需要改

&lt;!-- more --&gt;

```
&lt;revision&gt;1.0.0-SNAPSHOT&lt;/revision&gt;
```

# 使用姿势

使用${revision}对maven工程中多个pom里的版本号进行关联

## 父pom

```
&lt;project&gt;
  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;parent&gt;
    &lt;groupId&gt;org.apache&lt;/groupId&gt;
    &lt;artifactId&gt;apache&lt;/artifactId&gt;
    &lt;version&gt;18&lt;/version&gt;
  &lt;/parent&gt;
  &lt;groupId&gt;org.apache.maven.ci&lt;/groupId&gt;
  &lt;artifactId&gt;ci-parent&lt;/artifactId&gt;
  &lt;name&gt;First CI Friendly&lt;/name&gt;
  &lt;version&gt;${revision}&lt;/version&gt;
  ...
  &lt;properties&gt;
    &lt;revision&gt;1.0.0-SNAPSHOT&lt;/revision&gt;
  &lt;/properties&gt;
&lt;/project&gt;
```

注意revision在properties中声明

在build中使用相关插件

```
&lt;build&gt;
  &lt;plugins&gt;
    &lt;plugin&gt;
      &lt;groupId&gt;org.codehaus.mojo&lt;/groupId&gt;
      &lt;artifactId&gt;flatten-maven-plugin&lt;/artifactId&gt;
      &lt;version&gt;1.1.0&lt;/version&gt;
      &lt;configuration&gt;
          &lt;!-- 是否更新pom文件，此处还有更高级的用法 --&gt;
        &lt;updatePomFile&gt;true&lt;/updatePomFile&gt;
        &lt;flattenMode&gt;resolveCiFriendliesOnly&lt;/flattenMode&gt;
      &lt;/configuration&gt;
      &lt;executions&gt;
        &lt;execution&gt;
          &lt;id&gt;flatten&lt;/id&gt;
          &lt;phase&gt;process-resources&lt;/phase&gt;
          &lt;goals&gt;
            &lt;goal&gt;flatten&lt;/goal&gt;
          &lt;/goals&gt;
        &lt;/execution&gt;
        &lt;execution&gt;
          &lt;id&gt;flatten.clean&lt;/id&gt;
          &lt;phase&gt;clean&lt;/phase&gt;
          &lt;goals&gt;
            &lt;goal&gt;clean&lt;/goal&gt;
          &lt;/goals&gt;
        &lt;/execution&gt;
      &lt;/executions&gt;
    &lt;/plugin&gt;
  &lt;/plugins&gt;
  &lt;/build&gt;
```
## 子pom
在parent的声明version中直接使用${revision}即可

```
&lt;project&gt;
  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;parent&gt;
    &lt;groupId&gt;org.apache.maven.ci&lt;/groupId&gt;
    &lt;artifactId&gt;ci-parent&lt;/artifactId&gt;
    &lt;version&gt;${revision}&lt;/version&gt;
  &lt;/parent&gt;
  &lt;groupId&gt;org.apache.maven.ci&lt;/groupId&gt;
  &lt;artifactId&gt;ci-child&lt;/artifactId&gt;
   ...
  &lt;dependencies&gt;
        &lt;dependency&gt;
      &lt;groupId&gt;org.apache.maven.ci&lt;/groupId&gt;
      &lt;artifactId&gt;child2&lt;/artifactId&gt;
      &lt;version&gt;${project.version}&lt;/version&gt;
    &lt;/dependency&gt;
  &lt;/dependencies&gt;
&lt;/project&gt;
```

# 参考

https://www.cnblogs.com/ElEGenT/p/12938773.html

---

> 作者: 大卓  
> URL: https://nuoyang.tech/tech/other/maven_reversion/  

