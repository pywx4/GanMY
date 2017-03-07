# docker commands

## check the daemon process status

  >\# `systemctl status docker`

---
## 一些常用命令

1. 查看版本信息
>\# `docker version`

* 查看docker信息
>\# `docker info`

* 搜索images \#从Docker Hub上搜索符合条件的镜像
>\# `docker search centos`

* 从公网拉取(下载)image   Pull
>\# `docker pull centos`

* 将下载好的image镜像导入
>\# `docker load -i image_path`

* 查看images列表
>\# `docker images`

---
1. 运行一个container 并加载镜像centos，并在这个container中运行/bin/bash
>\# `docker run -i -t centos /bin/bash`

* 查看所有运行中的容器
>\# `docker ps`      

* 查看所有的容器包含沉睡/退出状态的容器
>\# `docker ps -a`

* 杀死一个容器
>\# `docker kill <container_id>`

* 启动容器实例
>\# `docker start <container_id>`

* 停止容器实例
>\# `docker stop <container_id>`

* 重启容器实例
>\# `docker restart <container_id>`

* 删除指定container
>\# `docker rm <container_id>`

* docker image 制作

  **Way 1:**
  >\# `docker commit` #保存container的当前状态到image，然后生成对应的image

  #### Example 1:

  \# `docker run -ti centos /bin/bash`

  \# `yum -y install nmap-ncat`

  \# `exit`

  \# `docker ps -a`

  \# `docker commit <container_id> <image_name>`

  \# `docker run -ti <image_name> /bin/bash`

  **Way 2:**

  >\# `docker build` #使用Dockerfile自动化制作image

  #### Example 2:

  * 创建工作路径

  \# `mkdir /docker-build`

  \# `cd /docker-build`

  \# `touch Dockerfile`

  * 编辑 Dockerfile
  \# `vim Dockerfile`

  ```
    FROM centos
    MAINTAINER userabc <userabc@gamil.com>
    RUN yum -y install httpd
    ADD start.sh /usr/local/bin/start.sh
    ADD index.html /var/www/html/index.html    
  ```
    #### Dockerfile解析
    ```
      FROM centos
      # 告知docker daemon 创建的image基于哪个镜像

      MAINTAINER userabc <userabc@gamil.com>
      # 镜像创建者

      RUN yum -y install httpd
      # RUN安装httpd软件

      ADD start.sh /usr/local/bin/start.sh
      ADD index.html /var/www/html/index.html  
      # ADD <src> <dest>
      # ADD 将文件<src>拷贝到新产生的镜像文件系统对应路径 <dest>
      # 所有拷贝到新镜像中的文件和文件夹权限为 0755 , uid 和 gid 为0
    ```

  * 创建 start.sh

  \# `echo "/usr/sbin/httpd -DFOREGROUND" > start.sh`

  \# `chmod a+x start.sh`

  \# `echo "docker image build test" > index.html`

  * 使用build命令创建新的image

  \# `docker build -t centos:httpd`

---

## Docker Image 发布

### **Way 1: Save Image to TarBall**

##### Save Image to .tar file

\# `Usage: docker save -o <filename.tar> <local_image_filename>`

### **Way 2: Push Image to Docker Hub**

1. Singup on docker hu & create repo

  [Docker Hub](https://hub.docker.com)

* Login to docker Hub

  \# `docker login -u <username> -p <password> -e <email>`

* Push image to docker hub

  \# `docker push <images_name>`

* Pull image from docker hub

  \# `docker pull <username>/<images_name>`

## Container 端口映射

\# `docker run -d -p 9000:80 centos:httpd /bin/sh -c /usr/local/bin/start.sh`

> 命令解析：
这条命令将虚拟机的80端口映射到物理机的9000端口

## 链接正在运行的container

\# `docker exec -it <container id | name> /bin/bash`

## 容器与物理机通信

物理机通过docker0 网卡与容器通信
容器实例在安装了net-tools工具包后，即可查看ip
然后在安装了sshd服务，并且开放22端口

# docker help
>\#` docker --help`

```
Usage:	docker COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/root/.docker")
  -D, --debug              Enable debug mode
      --help               Print usage
  -H, --host list          Daemon socket(s) to connect to (default [])
  -l, --log-level string   Set the logging level ("debug", "info", "warn", "error", "fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/root/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/root/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/root/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  container   Manage containers
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  volume      Manage volumes

Commands:
  attach      Attach to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.
```
