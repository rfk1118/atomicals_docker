# 使用指定的基础镜像
FROM ubuntu:latest

# 更新系统并安装基本工具
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# 安装 Node.js 20.x
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

RUN apt-get install -y git

# 清理不必要的软件包和缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置工作目录
WORKDIR /app

COPY . .

# 在容器启动时运行的命令
CMD ["/bin/bash"]