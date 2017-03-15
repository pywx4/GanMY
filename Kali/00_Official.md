# What is kali linux ?
the new generation of the industry-leading BackTrack Linux penetration testing and security auditing Linux distribution.
kali linux 是业界领先的新一代用于渗透测试和安全审计的Linux发行版。

a complete re-build of BackTrack from the ground up, adhering completely to Debian development standards.
kali linux是由Backtrack重建而成，基于Debian开发标准。


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
