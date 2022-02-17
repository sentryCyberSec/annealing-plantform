---
layout: anhui-telecom-ecdepartment
category: anhui-telecom-ecdepartment
wrench: 2022-01-19
Researchname: FRP Based On Golang
author: Bin4xin
permalink: /FRP/
windows-link: ["frp_0.39.1_windows_386.zip", "frp_0.39.1_windows_amd64.zip"]
others-link: ["frp_0.39.1_freebsd_386.tar.gz", "frp_0.39.1_freebsd_amd64.tar.gz", "frp_0.39.1_linux_386.tar.gz", "frp_0.39.1_linux_amd64.tar.gz", "frp_0.39.1_linux_arm.tar.gz", "frp_0.39.1_linux_arm64.tar.gz", "frp_0.39.1_linux_mips.tar.gz", "frp_0.39.1_linux_mips64.tar.gz", "frp_0.39.1_linux_mips64le.tar.gz", "frp_0.39.1_linux_mipsle.tar.gz", "frp_0.39.1_darwin_amd64.tar.gz", "frp_0.39.1_darwin_arm64.tar.gz"]
toc: true
download: true
---

# FRP Based On Golang
<!-- 用一段话简单描述一下功能、用途 -->

> frp 是一个专注于内网穿透的高性能的反向代理应用，支持 TCP、UDP、HTTP、HTTPS等多种协议。可以将内网服务以安全、便捷的方式通过具有公网 IP 节点的中转暴露到公网。

通过在具有公网 IP 的节点上部署 frp 服务端，可以轻松地将内网服务穿透到公网，同时提供诸多专业的功能特性，这包括：

- 客户端服务端通信支持 TCP、KCP 以及 Websocket 等多种协议。
- 采用 TCP 连接流式复用，在单个连接间承载更多请求，节省连接建立时间。
- 代理组间的负载均衡。
- 端口复用，多个服务通过同一个服务端端口暴露。
- 多个原生支持的客户端插件（静态文件查看，HTTP、SOCK5 代理等），便于独立使用 frp 客户端完成某些工作。
- 高度扩展性的服务端插件系统，方便结合自身需求进行功能扩展。
- 服务端和客户端 UI 页面。


### Q & A

- [怎么远程关闭FRPC端？ #2391](https://github.com/fatedier/frp/issues/2391)
	- 可以通过将 frpc 的 admin 界面通过 frps 代理出来，然后通过这个代理的界面来操作 frpc。这样这个需求就变成 frpc 的管理界面提供一个关闭自身的方法

~~> 后续会推出更多兼容版本，因为暂时还没有想好Github二进制文件同步策略；也欢迎仓库共享代码:)~~

### 仓库

<h4><a href="{{site.githubAccess}}/{{site.githubCodeRepos}}" target="_blank"> <em><li class="fa fa-github"></li> Contribute Pull Request</em></a></h4>
