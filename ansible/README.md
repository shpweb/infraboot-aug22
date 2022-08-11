
```s
$ ansible myhost -m ping -i inventory.txt
```
```s
$ ansible-playbook myplaybook.yaml
```

## install sshpass in mac
$ brew install hudochenkov/sshpass/sshpass
Ref: https://stackoverflow.com/questions/32255660/how-to-install-sshpass-on-mac

## change /etc/ssh/sshd_config in centos for 
PasswordAuthentication yes

## enable root user with password in CentOs
passwd

## CentOS yum install/ update issue: 
Ref: https://stackoverflow.com/questions/70963985/error-failed-to-download-metadata-for-repo-appstream-cannot-prepare-internal 
```s
$ sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
$ sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
$ dnf distro-sync
```
or Ref: https://techglimpse.com/failed-metadata-repo-appstream-centos-8/


### Service Module in ansible
https://www.ansiblepilot.com/articles/restart-services-on-remote-hosts-ansible-module-service/

