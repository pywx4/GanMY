# Set the Software Repo
## 1. vim /etc/apt/sources.list

## 2. 删除所有内容，并替换成如下源
  1. #中科大kali源

    deb http://mirrors.ustc.edu.cn/kali sana main non-free contrib

    deb http://mirrors.ustc.edu.cn/kali-security/ sana/updates main contrib non-free

    deb-src http://mirrors.ustc.edu.cn/kali-security/ sana/updates main contrib non-free
  * #阿里云kali源

    deb http://mirrors.aliyun.com/kali sana main non-free contrib

    deb http://mirrors.aliyun.com/kali-security/ sana/updates main contrib non-free

    deb-src http://mirrors.aliyun.com/kali-security/ sana/updates main contrib non-free

## 3. 更新
apt-get update & apt-get upgrade

apt-get dist-upgrade

apt-get clean

---

# VMware Tools in a kali Guest
## Installing VMware Tools in kali Linux Rolling
`apt update && apt -y full-upgrade`
# Reboot now in case you have updated to a new kernel.
`apt -y install open-vm-tools-desktop fuse`
`reboot`

```
cat <<EOF > /usr/local/sbin/mount-shared-folders
#!/bin/bash
vmware-hgfsclient | while read folder; do
  vmwpath="/mnt/hgfs/\${folder}"
  echo "[i] Mounting \${folder}   (\${vmwpath})"
  mkdir -p "\${vmwpath}"
  umount -f "\${vmwpath}" 2>/dev/null
  vmhgfs-fuse -o allow_other -o auto_unmount ".host:/\${folder}" "\${vmwpath}"
done
sleep 2s
EOF
chmod +x /usr/local/sbin/mount-shared-folders
ln -sf /usr/local/sbin/mount-shared-folders /root/Desktop/mount-shared-folders.sh
#gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
```
---

# configure the network
## 1. `vim /etc/network/interfaces`
```
auto eth0
iface eth0 inet static
address 192.168.31.64
netmask 255.255.255.0
gateway 192.168.31.1
```

## 2. `mv /etc/NetworkManager/system-connections Documents/backup/`

## 3. `reboot`

---
PermitRootLogin #禁止root登陆
PasswordAuthentication yes # 密码验证登陆
PubkeyAuthentication
AuthorizedKeysFile %h/.ssh/authorized_keys
---

# 一.查看Linux内核版本命令（两种方法）：

## 1.cat /proc/version

```
  [root@localhost ~]# cat /proc/version
  Linux version 2.6.18-194.8.1.el5.centos.plus (mockbuild@builder17.centos.org) (gcc version 4.1.2 20080704 (Red Hat 4.1.2-48)) #1 SMP Wed Jul 7 11:50:45 EDT 2010
```

## 2.uname -a
```
  [root@localhost ~]# uname -a
  Linux localhost.localdomain 2.6.18-194.8.1.el5.centos.plus #1 SMP Wed Jul 7 11:50:45 EDT 2010 i686 i686 i386 GNU/Linux
```

# 二.查看Linux系统版本的命令（3种方法）：

## 1.lsb_release -a，即可列出所有版本信息：
```
  [root@localhost ~]# lsb_release -a
  LSB Version: :core-3.1-ia32:core-3.1-noarch:graphics-3.1-ia32:graphics-3.1-noarch
  Distributor ID: CentOS
  Description: CentOS release 5.5 (Final)
  Release: 5.5
  Codename: Final
```

这个命令适用于所有的Linux发行版，包括Redhat.SuSE.Debian…等发行版。

## 2.cat /etc/redhat-release，这种方法只适合Redhat系的Linux：
```
  [root@localhost ~]# cat /etc/redhat-release
  CentOS release 5.5 (Final)
```

## 3.cat /etc/issue，此命令也适用于所有的Linux发行版。
```
  [root@localhost ~]# cat /etc/issue
  CentOS release 5.5 (Final)
  Kernel \r on an \m
```
