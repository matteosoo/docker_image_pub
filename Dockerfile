FROM apache/airflow:2.4.3-python3.7-slim:v1
USER root
# 安裝必要的套件以及 nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04 相關的套件
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 安裝 NVIDIA GPU 驅動和 CUDA 工具
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
RUN mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN wget https://developer.download.nvidia.com/compute/cuda/10.1/secure/Prod/local_installers/cuda-repo-ubuntu1804-10-1-local-10.1.243-418.87.00_1.0-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1804-10-1-local-10.1.243-418.87.00_1.0-1_amd64.deb
RUN apt-key add /var/cuda-repo-10-1-local-10.1.243-418.87.00/7fa2af80.pub
RUN apt-get update && apt-get -y install cuda

# 確保 CUDA 環境變數正確設定
ENV PATH=/usr/local/cuda-10.1/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:${LD_LIBRARY_PATH}