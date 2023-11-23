# 使用官方的Ubuntu 20.04基础镜像
FROM ubuntu:latest

# 在容器中创建一个工作目录
WORKDIR /app

# 复制当前目录下的文件到容器中
COPY proxy_tool /app/proxy_tool

# 修改Ubuntu软件源为阿里云
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# 更新Ubuntu软件包列表并安装依赖项
RUN apt-get update && apt-get install -y \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libatspi2.0-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libcairo2 \
    libnss3-dev \
    libgconf-2-4 \
    libxss1 \
    libasound2

# 安装Redis服务器
RUN apt-get install -y redis-server

# 安装Python 3和pip3
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

# 创建pip配置文件，设置镜像源
# RUN echo "[global]\nindex-url = https://mirrors.aliyun.com/pypi/simple/" > /etc/pip.conf

# 安装 playwright 依赖
RUN apt-get install -y libnss3-dev libgconf-2-4 libxss1 libasound2

# 复制当前目录下的requirements.txt文件到容器中
COPY requirements.txt /app/

# 使用pip安装依赖项
RUN pip3 install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 执行 playwright 安装命令
RUN python3 -m playwright install

# 暴露端口8888
EXPOSE 8888

# 启动Redis服务器并执行Python文件
CMD ["sh", "-c", "redis-server & python3 /app/proxy_tool/main.py"]
