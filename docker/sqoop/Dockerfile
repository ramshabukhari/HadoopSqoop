FROM hadoop-base:latest
LABEL maintainer="Ramsha"

ENV HADOOP_VERSION=3.1.1
ENV HADOOP_HOME=/opt/hadoop
ENV SQOOP_HOME=/opt/sqoop
ENV PATH=$PATH:$SQOOP_HOME/bin

RUN apt-get update -yqq && \
    apt-get install nano && \
    apt-get upgrade -yqq && \
    apt-get install -yqq --no-install-recommends \
    apt-utils \
    curl \
    wget \
    netcat && \
    apt-get autoremove -yqq --purge

RUN mkdir -p /opt/sqoop

RUN wget -c -O sqoop.tar.gz https://downloads.apache.org/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz 
RUN tar xvf sqoop.tar.gz --directory=/opt/sqoop --strip 1 
RUN rm -rf sqoop.tar.gz 


COPY ./sqoop-env-template.sh .

RUN mv ./sqoop-env-template.sh /opt/sqoop/conf/sqoop-env.sh

RUN wget -c -O connector.tar.gz http://www.mirrorservice.org/sites/ftp.mysql.com/Downloads/Connector-J/mysql-connector-java-8.0.21.tar.gz
RUN tar xvf connector.tar.gz --directory=/opt/sqoop/lib --strip 1 
RUN rm -rf connector.tar.gz 

EXPOSE 12000

COPY ./entrypoint.sh .

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
