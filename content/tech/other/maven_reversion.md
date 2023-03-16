---
title: "maven pom文件多版本管理revision"
date: 2023-03-16T15:24:46+08:00
tags:
- maven
categories:
- 技术
# 技术文档分类：架构/云原生/Linux/其他
catalog: 其他
---




maven工程中，对多个子module及相应的pom版本进行管理是很头疼的事，利用**flatten-maven-plugin** 插件将pom版本统一管理起来，在变更的时候只需要改

<!-- more -->

```
<revision>1.0.0-SNAPSHOT</revision>
```

# 使用姿势

使用${revision}对maven工程中多个pom里的版本号进行关联

## 父pom

```
<project>
  <modelVersion>4.0.0</modelVersion>
  <parent>
    <groupId>org.apache</groupId>
    <artifactId>apache</artifactId>
    <version>18</version>
  </parent>
  <groupId>org.apache.maven.ci</groupId>
  <artifactId>ci-parent</artifactId>
  <name>First CI Friendly</name>
  <version>${revision}</version>
  ...
  <properties>
    <revision>1.0.0-SNAPSHOT</revision>
  </properties>
</project>
```

注意revision在properties中声明

在build中使用相关插件

```
<build>
  <plugins>
    <plugin>
      <groupId>org.codehaus.mojo</groupId>
      <artifactId>flatten-maven-plugin</artifactId>
      <version>1.1.0</version>
      <configuration>
          <!-- 是否更新pom文件，此处还有更高级的用法 -->
        <updatePomFile>true</updatePomFile>
        <flattenMode>resolveCiFriendliesOnly</flattenMode>
      </configuration>
      <executions>
        <execution>
          <id>flatten</id>
          <phase>process-resources</phase>
          <goals>
            <goal>flatten</goal>
          </goals>
        </execution>
        <execution>
          <id>flatten.clean</id>
          <phase>clean</phase>
          <goals>
            <goal>clean</goal>
          </goals>
        </execution>
      </executions>
    </plugin>
  </plugins>
  </build>
```
## 子pom
在parent的声明version中直接使用${revision}即可

```
<project>
  <modelVersion>4.0.0</modelVersion>
  <parent>
    <groupId>org.apache.maven.ci</groupId>
    <artifactId>ci-parent</artifactId>
    <version>${revision}</version>
  </parent>
  <groupId>org.apache.maven.ci</groupId>
  <artifactId>ci-child</artifactId>
   ...
  <dependencies>
        <dependency>
      <groupId>org.apache.maven.ci</groupId>
      <artifactId>child2</artifactId>
      <version>${project.version}</version>
    </dependency>
  </dependencies>
</project>
```

# 参考

https://www.cnblogs.com/ElEGenT/p/12938773.html