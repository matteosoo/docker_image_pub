FROM apache/airflow:slim-2.4.3-python3.7
USER root
RUN apt -y update \ 
    &&  DEBIAN_FRONTEND=noninteractive apt install -y \
        bind9-host=1:9.16.42-1~deb11u1 \
        bind9-libs=1:9.16.42-1~deb11u1 \
        curl=7.74.0-1.3+deb11u7 \
        krb5-user=1.18.3-6+deb11u3
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN apt-get update && \
    apt-get -y install libsndfile1