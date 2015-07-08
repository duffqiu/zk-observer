FROM duffqiu/zookeeper:latest
MAINTAINER duffqiu@gmail.com

WORKDIR /

RUN wget https://github.com/apache/zookeeper/archive/release-3.5.1-rc3.tar.gz
RUN tar xzf release-3.5.1-rc3.tar.gz

RUN mv zookeeper-release-3.5.1-rc3 zookeeper-3.5.1

ADD conf/zoo.cfg.tmp /zookeeper-3.5.1/conf/zoo.cfg.tmp

ADD startzk /usr/bin/startzk

RUN chmod +x /usr/bin/startzk

EXPOSE 21810 28880 38880

ENV JAVA_HOME=/usr/java/jdk1.7.0_75 JRE_HOME=/usr/java/jdk1.7.0_75/jre PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin CLASSPATH=:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib

#ENV JVMFLAGS=-Dsun.net.inetaddr.ttl=0

WORKDIR /zookeeper-3.5.1

ENTRYPOINT [ "/usr/bin/startzk" ]
