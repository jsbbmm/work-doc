#!/usr/bin/env sh
 
# 确保脚本抛出遇到的错误
set -e
 
# 生成静态文件 , yarn docs:build
npm run docs:build
rm -rf ../my-blog/dist/*

# 将build生成的dist目录拷贝至上一层目录中
cp -rf dist ../my-blog/

# 进入生成的文件夹
cd ../my-blog/dist

# git 初始化
git init
git add -A
git commit -m 'deploy'
git branch -M main

# git@github.com:jsbbmm/jsbbmm.github.io.git
git push -f git@github.com:jsbbmm/jsbbmm.github.io.git main