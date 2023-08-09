FROM matteosoo/airflow-2.4.3-python3.7-libsndfile1-cai:37094c6e0c374d43e827700abba5f58d19bf8bd5
USER root
COPY apt-pkgs.txt .

RUN apt-get update \
    && xargs apt-get -y install <apt-pkgs.txt \
    && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/3bf863cc.pub \
    && add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/ /" \
    && add-apt-repository contrib \
    && apt-get update \
    && apt-get -y install cuda \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV CUDA_HOME=/usr/local/cuda-12.2
ENV PATH=$PATH:/usr/local/cuda-12.2/bin
ENV LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64:$PATH

USER airflow