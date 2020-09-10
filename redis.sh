#!/bin/bash
url="http://download.redis.io/releases/redis-6.0.7.tar.gz"
redisName="redis-6.0.7.tar.gz"
filePath="redis-6.0.7"
function installRedis(){
	yum -y install gcc gcc-c++ kernel-devel
	echo "开始下载redis......"
	wget $url
	echo "下载完成，开始安装....."
	mv $redisName /usr/local
	cd /usr/local
	tar -xzvf $redisName
	cd $filePath
	make
	make PREFIX=/usr/local/redis install
	echo "安装完成，开始配置环境....."
	if [ ! -d "/etc/redis" ]; then
	  mkdir /etc/redis
	fi
	# 直接下载已经修改好的配置文件
	wget -P /etc/redis ""
	echo "设置开机自启...."
	# 下载已经修改好的配置文件到服务中
	wget -P /usr/lib/systemd/system/ ""
	systemctl enable redis.service 
	systemctl start redis.service
	echo "设置完毕，redis已启动"
	echo "安装目录：/usr/local/redis"
	echo "配置文件：//etc/redis/redis.config"
	echo "redis操作："
	echo "		启动：systemctl start redis.service"
	echo "		关闭：systemctl stop redis.service"
	echo "		重启：systemctl restart redis.service"
}

echo "-----欢迎使用------"
echo "1.安装redis"
echo "2.安装java"
echo "输入其他则结束"
read -p "请输入[1-2]：" temp
case "$temp" in
	1)
		installRedis
	;;
	*)
	;;
esac
	
