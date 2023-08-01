FROM apache/airflow:slim-2.4.3-python3.7
WORKDIR /app
COPY . .
USER root
RUN apt -y update \ 
    &&  DEBIAN_FRONTEND=noninteractive apt install -y \
        bind9-host=1:9.16.42-1~deb11u1 \
        bind9-libs=1:9.16.42-1~deb11u1 \
        curl=7.74.0-1.3+deb11u7 \
        krb5-user=1.18.3-6+deb11u3 \
        libgnutls30=3.7.1-5+deb11u3 \
        libgssrpc4=1.18.3-6+deb11u3 \
        libk5crypto3=1.18.3-6+deb11u3 \
        libkadm5clnt-mit12=1.18.3-6+deb11u3 \
        libkadm5srv-mit12=1.18.3-6+deb11u3 \
        libkdb5-10=1.18.3-6+deb11u3 \
        libncursesw6=6.2+20201114-2+deb11u1 \
        libssl1.1=1.1.1n-0+deb11u4 \
        libssl1.1=1.1.1n-0+deb11u5 \
        libsystemd0=247.3-7+deb11u2 \
        libtasn1-6=4.16.0-2+deb11u1 \
        libtinfo6=6.2+20201114-2+deb11u1 \
        libudev1=247.3-7+deb11u2 \
        libxml2=2.9.10+dfsg-6.7+deb11u4 \
        libksba8=1.5.0-3+deb11u2 \
        ncurses-base=6.2+20201114-2+deb11u1 \
        ncurses-bin=6.2+20201114-2+deb11u1 \
        openssl=1.1.1n-0+deb11u5 \
        sudo=1.9.5p2-3+deb11u1
USER airflow
RUN pip install -r requirements.txt
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get -y install libsndfile1