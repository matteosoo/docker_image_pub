FROM python:3.8.17-slim
USER root
WORKDIR /app

COPY apt-pkgs.txt .
RUN apt-get update \
&& xargs apt-get -y install <apt-pkgs.txt \
&& apt-get autoremove -yqq --purge \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt
USER root