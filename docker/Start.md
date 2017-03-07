# Docker

### Purpose
1. install Docker software for your platform
* run a software image in a container
* browse for an image on Docker Hub
* create your own image and run it in a container
* create a Docker Hub account and an image repository
* create an image of your own
* push your image to Docker Hub for others to use

### 1. install Docker software for your platform
安装Docker
#### Step 1: Get Docker
添加Docker的yum源
>`vim /etc/yum.repos.d/docker.repo`

*\#输入如下信息*
```
[dockerrepo]
name=Docker Repository
baseurl=http://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=0
```

检查添加的文件是否生效
>```yum list | grep dockerrepo```

*\#输出信息如下*
```
docker-engine.x86_64                       17.03.0.ce-1.el7.centos    dockerrepo
docker-engine-debuginfo.x86_64             17.03.0.ce-1.el7.centos    dockerrepo
docker-engine-selinux.noarch               17.03.0.ce-1.el7.centos    dockerrepo
```

#### Step 2: Install Docker
>`yum install docker-engine -y`

#### Step 3: Verify your installation
运行docker服务
>`systemctl start docker`

设置docker服务开机自启动
>`systemctl enable docker`

查看安装的docker信息
>`docker info` *\#须在docker服务运行时，才能使用*

*\#输出信息如下:*
```
Containers: 0
 Running: 0
 Paused: 0
 Stopped: 0
Images: 0
Server Version: 17.03.0-ce
Storage Driver: overlay
 Backing Filesystem: xfs
 Supports d_type: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host macvlan null overlay
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 977c511eda0925a723debdc94d09459af49d082a
runc version: a01dafd48bc1c7cc12bdb01206f9fea7dd6feb70
init version: 949e6fa
Security Options:
 seccomp
  Profile: default
Kernel Version: 3.10.0-514.el7.x86_64
Operating System: CentOS Linux 7 (Core)
OSType: linux
Architecture: x86_64
CPUs: 1
Total Memory: 488.7 MiB
Name: CentOS-7.cn
ID: S4IP:MAAS:GUOW:6EII:D3MC:RKO6:NV5T:4OM6:KYOV:VMDU:25OI:H6SO
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/
WARNING: bridge-nf-call-iptables is disabled
WARNING: bridge-nf-call-ip6tables is disabled
Experimental: false
Insecure Registries:
 127.0.0.0/8
Live Restore Enabled: false
```

查看是否安装成功
>`docker run helloworld` *\# 需在start后，才能docker run*

*\#输出信息如下:*
```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
78445dd45222: Pull complete
Digest: sha256:c5515758d4c5e1e838e9cd307f6c6a0d620b5e07e6f927b07d05f6d12a1ac8d7
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 Docker 客户端向Docker守护进程发出请求

 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 Docker守护进程从Docker Hub下载Hello-world的最新镜像到本地

 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
Docker守护进程使用下载的镜像(就是这个输出这些信息的镜像)创建一个新的容器

 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.
Docker守护进程将输出的信息重定向到你的终端

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
```

#### Some Commands Useful
`docker ps` *\#查看当前运行的docker*
`docker ps -a` *\#查看所有docker(包括已结束的)*
`docker version` *\#查看docker版本*

### 2. run a software image in a container
在容器中运行一个镜像

An image is a filesystem and parameters to use at runtime.
一个镜像就是一个文件系统，是用来运行docker实例(容器)的一个参数

It doesn't have state and never changes.

A container is a running instance of an image.
一个容器就是一个运行状态的镜像实例

#### Process `docker run hello world`
  1. checked to se if you had the hello-world software image
  * downloaded the image from the Docker Hub(more about the hub later)
  * loaded the image into the container and 'ran' it
#### Find and run the whalesay image
Step 1: Locate the whalesay image
URL:https://hub.docker.com/r/docker/whalesay/
Step 2: Run the whalesay image
`docker run docker/whalesay cowsay boo`

### 3. browse for an image on Docker Hub
在Docker Hub上浏览镜像

### 4. create your own image and run it in a container
自己创建镜像，并在容器中运行

### 5. create a Docker Hub account and an image repository
创建一个Docker Hub账号，和一个image仓库
https://docs.docker.com/engine/getstarted/step_five/
### 6. create an image of your own
创建一个自己的镜像

### 7. push your image to Docker Hub for others to use
将镜像上传到Docker Hub共享
