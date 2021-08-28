#! /bin/bash
# WORK_PATH = '/usr/projects/vite-react-node'
cd /usr/projects/vite-ts-react
echo "先清除老代码"
git reset --hard origin/main
git clean -f
echo "拉去新代码"
git pull origin main
echo "编译"
yarn build
echo "开始执行构建"
docker build -t react-front:1.0 .
echo "停止并删除容器"
docker stop react-front-container
docker rm react-front-container
echo "启动新容器"
docker container run -p 8090:8090 --name  react-front-container -d react-front:1.0
