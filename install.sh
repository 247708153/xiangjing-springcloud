#!/usr/bin/env bash
echo '===========1.preparing for development Environment==============='
echo '1.1:make sure java8,git and maven are installed and set up environment variables'
echo '1.2:make sure docker and docker-compose are installed and environment variables are set up'

#确认环境信息准备就绪
read -r -p "is the development environment ready? [Y/n] " envConfirm
case $envConfirm in
    [yY][eE][sS]|[yY])
		echo "Yes ,resume"
		;;
    [nN][oO]|[nN])
		echo "No ,terminate execution"
		exit 1
       	;;
    *)
		echo "Invalid input... terminate execution"
		exit 1
		;;
esac
