FROM matteosoo/airflow-2.4.3-python3.7-libsndfile1-cai:37094c6e0c374d43e827700abba5f58d19bf8bd5
USER root
COPY apt-pkgs.txt .

RUN apt-get update \
    && xargs apt-get -y install <apt-pkgs.txt \
    && wget https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda-repo-debian10-11-2-local_11.2.0-460.27.04-1_amd64.deb \
    && dpkg -i cuda-repo-debian10-11-2-local_11.2.0-460.27.04-1_amd64.deb \
    && apt-key add /var/cuda-repo-debian10-11-2-local/7fa2af80.pub \
    && add-apt-repository contrib \
    && apt-get update \
    && apt-get -y install cuda \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV CUDA_HOME=/usr/local/cuda-11.2
ENV PATH=$PATH:/usr/local/cuda-11.2/bin
ENV LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64:$PATH

USER airflow