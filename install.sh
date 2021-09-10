#!/usr/bin/env bash
echo '===========1.preparing for development Environment==============='
echo '1.1:make sure java8,git and maven are installed and set up environment variables'
echo '1.2:make sure docker and docker-compose are installed and environment variables are set up'

#verify that the environment variables are ready
#read -r -p "is the development environment ready? [Y/n] " envConfirm
#case $envConfirm in
#    [yY][eE][sS]|[yY])
#		echo "Yes ,resume"
#		;;
#    [nN][oO]|[nN])
#		echo "No ,terminate execution"
#		exit 1
#       	;;
#    *)
#		echo "Invalid input... terminate execution"
#		exit 1
#		;;
#esac

echo '==================1.3 optionally clean up containers and images that are currently started by ths script=============='
#optionally clean up containers and images that are currently started by ths script
docker stop sc-rabbitmq sc-redis sc-mysql
docker rm sc-rabbitmq sc-redis sc-mysql

#docker stop sc-monitor-admin sc-authorization-server sc-authentication-server sc-organization sc-gateway-admin sc-gateway-web
#docker rm sc-monitor-admin sc-authorization-server sc-authentication-server sc-organization sc-gateway-admin sc-gateway-web
#docker image rm cike/admin cike/authorization-server:latest cike/authentication-server:latest cike/organization:latest cike/gateway-admin:latest cike/gateway-web:latest


echo '==================4.docker-compose launch of public services==================='
#去docker-compose目录
cd docker-compose
echo '==================4.1display environment variables: docker-compose/.env =========='
#显示环境变量
cat ./.env
echo ''

#按需要开启公共服务
#echo '==================4.2启动 mysql or redis or rabbitmq ========'
docker-compose -f docker-compose.yml up -d mysql
docker-compose -f docker-compose.yml up -d redis
docker-compose -f docker-compose.yml up -d rabbitmq
