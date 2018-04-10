#!/bin/bash
yum -y install git # install git if it's not already installed; we'll use it
yum -y install openldap-servers
whereis ssh
which ssh
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown ldap . /var/lib/ldap/DB_CONFIG # chown for user and group
systemctl enable slapd && systemctl start slapd
yum -y install httpd epel-release phpldapadmin
setbool -P httpd_can_connect_ldap on # selinux
systemctl enable httpd && systemctl start httpd
git clone https://github.com/nic-instruction/hello-nti-310.git # get config.php
sdiff ~/hello-nti-310/config/config.php /etc/php | more # compare side by side
cd /etc/phpldapadmin/
ls -l
cp config.php config.php.bak
