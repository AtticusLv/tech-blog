---
title: "Istio熔断和限流工作原理"
date: 2023-03-02T14:11:06+08:00
tags:
- istio
- 限流熔断
categories:
- 技术
# 技术文档分类：架构/云原生/Linux/其他
catalog: 云原生
---

# 熔断限流对比

|          | Hystrix | Sentinel     | Istio      |
| -------- | ------- | ------------ | ---------- |
| 熔断     | ✅       | ✅            | ✅          |
| 限流     | ✅       | ✅            | ✅          |
| 接入方式 | SDK     | SDK/Agent    | 配置化     |
| 应用感知 | 感知    | 感知         | 无感透明   |
| 依赖编码 | 依赖    | 依赖（Java） | **不依赖** |
|          |         |              |            |
|          |         |              |            |
|          |         |              |            |
|          |         |              |            |



istio熔断和限流主要依赖envoy提供的能力，具体内容可以查看 https://www.envoyproxy.io/docs/envoy/latest/intro/arch_overview/upstream/circuit_breaking



# Istio方式

## istio 熔断

通过编写VirtualService和DestinationRule可以管理接口级别的熔断能力





## istio 限流

https://istio.io/latest/docs/tasks/policy-enforcement/rate-limit/





# 参考

https://www.kubernetes.org.cn/5556.html

https://istio.io/latest/docs/reference/config/networking/destination-rule/#TrafficPolicy