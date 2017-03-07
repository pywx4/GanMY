# Docker 概述
----- 开源的应用容器引擎

docker是dotCloud公司开源的一个基于LXC的高级容器引擎
项目托管在Github上--->基于go语言并遵从Apache2.0协议
1. 将应用和依赖包打包到一个可移植的容器中，并发布到任何流行的Linux机器上
* 软件发布与操作系统相关 windows的应用还有各个版本的Linux的软件包一般不能通用

#### 扩展
LXC为Linux Container的简写。可以提供轻量级的虚拟化，以便隔离进程和资源，而且不需要提供指令解释机制以及全虚拟化的其他复杂性。相当于C++中的NameSpace。容器有效地将由单个操作系统管理的资源划分到孤立的组中，以更好地在孤立的组之间平衡有冲突的资源使用需求。与传统虚拟化技术相比，它的优势在于：
（1）与宿主机使用同一个内核，性能损耗小；
（2）不需要指令级模拟；
（3）不需要即时(Just-in-time)编译；
（4）容器可以在CPU核心的本地运行指令，不需要任何专门的解释机制；
（5）避免了准虚拟化和系统调用替换中的复杂性；
（6）轻量级隔离，在隔离的同时还提供共享机制，以实现容器与宿主机的资源共享。
总结：Linux Container是一种轻量级的虚拟化的手段。
Linux Container提供了在单一可控主机节点上支持多个相互隔离的server container同时执行的机制。Linux Container有点像chroot，提供了一个拥有自己进程和网络空间的虚拟环境，但又有别于虚拟机，因为lxc是一种操作系统层次上的资源的虚拟化。

#### [官方网站](https://www.docker.com/)  ---> [https://www.docker.com](https://www.docker.com/)

#### [源码](https://github.com/docker/docker) --->[https://github.com/docker/docker](https://github.com/docker/docker)

# 相对于VMware来说
docker减少了客户机操作系统的资源消耗！

# 工作流程

![alt](.\docker_engine.jpg)
服务器A上运行Docker Engine 服务，在docker Engine 上启动很多container。
docker Engine启动container时，若本地没有对应镜像，会从外网Docker Hub上下载image，并放到container中运行。

远程管理客户端对docker容器虚拟化平台进行控制


# Docker 核心技术
1. Namespace ---> 实现Container的进程、网络、消息、文件系统和主机名的隔离
* Cgroup ---> 实现对资源的配额和度量

# 特性
1. 文件系统隔离
  每个进程容器运行在一个完全独立的根文件系统里
* 资源隔离
  系统资源，如：CPU和内存等都可以分配到不同的容器中，---> cgroup命令
* 网络隔离
  每个进程容器运行在自己的网络空间，虚拟接口和IP地址
* 日志记录
  Docker将会收集和记录每个进程容器的标准刘（stdout/stderr/stdin)
* 变更管理
  容器文件系统的变更可以提交到新的景象中，并可重复使用以创建更多容器。无需使用模板或手动配置
* 交互式shell
