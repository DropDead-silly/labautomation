#!/bin/bash

option=$1
if [ -z "$option" ]; then 

echo -n -e "
1) Apache Web Server
2) Apache Tomcat
3) MariaDB
4) Application Stack (WEB + APP + DB)
5) Gitlab
6) Maven
7) Jenkins
8) Ansible Tower
9) Docker
10) Kuburnetes Master 
11) Kuburnetes Node
${R}E) Exit ${N}

Select an Option > "
read option
fi
#option=11
C=$(echo $option | cut -c 1)
[ "$C" -eq 1 ] &>/dev/null
STAT=$?
if [ $STAT -eq 2 ]; then 
	if [ "$option" = E ]; then 
		exit
	else
		error "Invalid Option. Try Again " 
		exit 1
	fi
else
	if [ $option -lt 1 -o $option -gt 11 ]; then 
	  error "Invalid Option. Try Again " 
	  exit 1
	fi
fi

cd /tmp
#git clone https://github.com/linuxautomations/labautomation.git
cd labautomation
ansible-playbook playbooks/${option}.yml
## One more line

if [ ! -f "playbooks/${option}.yml" ]; then  
	info "This tool automation is still pending. Sorry "
	exit 
fi
