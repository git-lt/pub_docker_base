FROM index.docker.io/library/node:8.11.3-slim
MAINTAINER qiudao <hz_liutao@qq.com>

# 创建运行目录
ENV APP_ROOT=/home/workspace/f-server/

# 安装 nginx && 设置 npm 仓库镜像地址并创建目录
RUN apt-get update \
    && apt-get install -y nginx \
    && npm config set registry "https://registry.npm.taobao.org" \
    && mkdir -p ${APP_ROOT}

# 拷贝 package.json 文件 至目录
COPY ./package.json ${APP_ROOT}

# 进入目录
WORKDIR ${APP_ROOT}

# 安装依赖
RUN npm install