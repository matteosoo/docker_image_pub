FROM apache/airflow:slim-2.4.3-python3.7
USER root
# 安裝必要的套件以及 nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04 相關的套件
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get -y install libsndfile1