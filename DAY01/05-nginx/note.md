
```bash
# 先安装 nginx镜像
docker pull nginx:alpine

# 通过以下命令可以进入 nginx 容器环境中
docker run -it --rm nginx:alpine sh

# 退出容器环境
exit

# 在本地 3001 端口访问 nginx 默认配置页面
# nginx 默认配置文件位于 /etc/nginx/conf.d/default.conf
docker run -it --rm -p 30001:80 nginx:alpine

# nginx 默认配置文件长这样：
server {
    listen        80;
    server_name   localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.html;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
```