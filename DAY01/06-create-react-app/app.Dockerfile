# 版本一：直接打包运行
# FROM node:14-alpine as builder
# WORKDIR /code
# ADD . /code
# RUN yarn && npm run build
# CMD npx serve -s build
# EXPOSE 3000


# 版本二：构建时间优化：利用构建缓存
# FROM node:14-alpine as builder
# WORKDIR /code
# ADD package.json yarn.lock /code/
# RUN yarn
# ADD . /code
# RUN npm run build
# CMD npx serve -s build
# EXPOSE 3000


# 版本三：构建体积优化：多阶段构建
# 选择镜像
FROM node:14-alpine as builder

# 设置工作目录，以下 RUN/CMD 命令都是在工作目录中进行执行
WORKDIR /code

# 先把 package.json 和 yarn.lock 添加到工作目录：安装依赖的时候可以利用缓存节省时间
ADD package.json yarn.lock /code/

# 安装依赖
RUN yarn

# 将其他文件也添加到工作目录
ADD . /code

# 打包
RUN npm run build

# 选择更小体积的基础镜像 nginx
FROM nginx:alpine
COPY --from=builder code/build /usr/share/nginx/html