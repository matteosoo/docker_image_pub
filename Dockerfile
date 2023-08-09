FROM apache/airflow:slim-2.4.3-python3.7
USER root
WORKDIR /app
COPY apt-pkgs.txt .

 

RUN apt-get update \
&& xargs apt-get -y install <apt-pkgs.txt \
&& apt-get autoremove -yqq --purge \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

 

COPY requirements.txt .
RUN chown airflow:0 -R .
USER airflow
RUN pip install -r requirements.txt
WORKDIR $AIRFLOW_HOME
USER root
RUN cd / && rm -rf /app
USER airflow