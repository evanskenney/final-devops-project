#FROM docker.io/library/ubuntu:18.04
#RUN apt-get -y update && apt-get -y upgrade
#RUN apt-get -y install openjdk-8-jdk wget
#RUN mkdir /usr/local/tomcat
#ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz  /tmp/apache-tomcat-9.0.95.tar.gz
#RUN cd /tmp &&  tar xvfz apache-tomcat-9.0.95.tar.gz
#RUN cp -Rv /tmp/apache-tomcat-9.0.95/* /usr/local/tomcat/
#ADD **/*.war /usr/local/tomcat/webapps
#EXPOSE 8080
#CMD /usr/local/tomcat/bin/catalina.sh run


FROM ubuntu:18.04

RUN apt-get -y update 
RUN apt-get -y install openjdk-8-jdk wget

RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.55/bin/apache-tomcat-8.5.55.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN mv /tmp/apache-tomcat-8.5.55 /opt/tomcat

COPY target/ABCtechnologies-1.0.war /opt/tomcat/webapps/

EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
