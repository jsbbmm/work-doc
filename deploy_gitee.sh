#!/usr/bin/env sh
 
# 确保脚本抛出遇到的错误
set -e
 
# 删除jsbbmm下面的所有代码
rm -rf ../my-blog/jsbbmm/*

# 将build生成的dist目录拷贝至上一层目录中
cp -rf docs ../my-blog/jsbbmm
cp deploy_gitee.sh deploy.sh package.json package-lock.json README.md ../my-blog/jsbbmm

# 切换工作空间
cd ../my-blog/jsbbmm

# 安装依赖包
npm install
# 编译生成制品
npm run docs:build


# git 提交命令
git add -A
git commit -m 'deploy'
git push -u origin "master"