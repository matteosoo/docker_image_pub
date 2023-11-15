FROM nvidia/cuda:11.4.3-cudnn8-runtime-ubuntu18.04
USER root
WORKDIR /app

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y

COPY apt-pkgs.txt .
RUN xargs apt-get -y install <apt-pkgs.txt \
&& apt-get autoremove -yqq --purge \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# python3.8 env
RUN yes '' | add-apt-repository ppa:deadsnakes/ppa
RUN apt install -y python3.8-dev python3-pip
RUN rm /usr/bin/python3 && ln -s /usr/bin/python3.8 /usr/bin/python3
RUN pip3 install pip==23.3

COPY requirements.txt .
RUN pip install -r requirements.txt
USER root