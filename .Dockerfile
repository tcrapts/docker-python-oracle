FROM python:3.6

# install Oracle driver
# source: https://github.com/jhgoodwin/docker-python-oracle/blob/master/Dockerfile
RUN apt-get update
RUN apt-get -y install unzip \
    && apt-get -y install libaio-dev \
    && mkdir -p /opt/data/api \
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
RUN apt install -y gcc g++ unixodbc-dev


# pipenv
RUN pip install pandas &&\
    pip install pyodbc &&\
    pip install -Iv cx_Oracle===7.3.0

# configure credentials
ARG DB_HOST
ENV DB_HOST=${DB_HOST}
ARG DB_SERVICE_NAME
ENV DB_SERVICE_NAME=${DB_SERVICE_NAME}
ARG DB_PORT
ENV DB_PORT=${DB_PORT}
ARG DB_USERNAME
ENV DB_USERNAME=${DB_USERNAME}
ARG DB_PASSWORD
ENV DB_PASSWORD=${DB_PASSWORD}

# configure container
COPY . /
WORKDIR /