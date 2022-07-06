# 选择镜像
FROM node:14-alpine

# 设置工作目录，以下 RUN/CMD 命令都是在工作目录中进行执行
WORKDIR /code

# 把宿主机的代码添加到镜像中，注意 . 后面有一个空格
# 添加内容到镜像：ADD <src> <dest>
# 自我理解：这里的 . 应该是指当前目录下的所有文件，跟 git add . 和 svn add . 类似，shell 中一个 dot 代表当前目录，两个 dot 代表上层目录
ADD . /code

# 暴露端口
EXPOSE 3000

# 启动 Node Server
# 也可以 npm init 初始化一个 package.json，再通过 npm scripts 里的命令来运行
CMD node server.js

# 然后还需要【构建镜像】和【运行容器】
# 在当前目录命令窗口输入：
# 1. 根据 node.Dockerfile 构建一个名为 simple-node-app 的镜像
# 注意最后的 . 不能少，. 用来指定 Docker 镜像构建过程中的上下文环境的目录
# docker build -f node.Dockerfile -t simple-node-app .

# 2. 根据该镜像运行容器，左边为宿主机端口，--rm 当容器停止运行时，自动删除容器
# docker run --rm -p 3001:3000 simple-node-app

# 以上两步也可以直接通过 docker-compose.yaml 文件来配置，跟 webpack.config.js \ vue.config.js 这种配置文件类似
# 然后直接：（--build 每次启动容器前构建镜像）
# docker-compose up --build