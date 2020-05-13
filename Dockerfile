FROM python:3.7-slim

# install Oracle driver
RUN apt-get update
RUN apt-get -y install unzip \
    && apt-get -y install libaio-dev \
    && mkdir -p /opt/data/api \
    && apt install -y gcc g++ unixodbc-dev
ADD ./oracle-instantclient/ /opt/data
ADD ./oracle-instantclient/install-instantclient.sh /opt/data
WORKDIR /opt/data
ENV ORACLE_HOME=/opt/oracle/instantclient
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME
ENV OCI_HOME=/opt/oracle/instantclient
ENV OCI_LIB_DIR=/opt/oracle/instantclient
ENV OCI_INCLUDE_DIR=/opt/oracle/instantclient/sdk/include
RUN chmod +x ./install-instantclient.sh
RUN ./install-instantclient.sh

RUN pip install -Iv pandas===1.0.1 &&\
    pip install -Iv pyodbc===4.0.30 &&\
    pip install -Iv cx_Oracle===7.3.0

# configure container
WORKDIR /script
ENTRYPOINT ["python", "-u"]