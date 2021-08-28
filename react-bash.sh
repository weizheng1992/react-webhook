#!/bin/bash
WORK_PATH = '/usr/projects/vite-react-node'
cd $WORK_PATH
echo "先清除老代码"
git reset --hard origin/main
git clean -f
echo "拉去新代码"
git pull origin main
echo "开始执行构建"
docker build -t react-node .
echo "停止并删除容器"
docker stop react-back-container
docker rm react-back-container
docker container run -p 8099:8099 --name  react-back-container -d react-back
