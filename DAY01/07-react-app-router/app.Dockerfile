# 选择镜像
FROM node:14-alpine as builder

# 设置工作目录，以下 RUN/CMD 命令都是在工作目录中进行执行
WORKDIR /code

# 先把 package.json 和 yarn.lock 添加到工作目录：安装依赖的时候可以利用缓存节省时间
ADD package.json yarn.lock /code/

# 安装依赖
RUN yarn

# 添加 public 和 src，同样为了利用缓存
ADD public /code/public
ADD src /code/src

# 打包
RUN npm run build

# 选择更小体积的基础镜像 nginx
FROM nginx:alpine
ADD nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder code/build /usr/share/nginx/html