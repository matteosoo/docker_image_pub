FROM nvcr.io/nvidia/cuda:11.4.3-cudnn8-runtime-ubuntu20.04
USER root
WORKDIR /app

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y

COPY apt-pkgs.txt .
RUN xargs apt-get -y install <apt-pkgs.txt \
&& apt-get autoremove -yqq --purge \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# python3.9 env
RUN apt-get update
RUN apt install python3.9-distutils -y
RUN apt install -y python3.9-dev python3-pip
RUN rm /usr/bin/python3 && ln -s /usr/bin/python3.9 /usr/bin/python3
RUN pip install --upgrade pip

COPY requirements.txt .
RUN pip install -r requirements.txt
USER root