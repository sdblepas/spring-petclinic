FROM tomcat

MAINTAINER sdblepasgmail.com

RUN apt-get -qq update

#install maven and git to build project
RUN apt-get install -y wget git-core maven
WORKDIR /tmp
# Pull project
RUN git clone https://github.com/sdblepas/spring-petclinic.git

# Build project
RUN cd spring-petclinic && mvn package

WORKDIR /tmp/spring-petclinic/target
CMD ["java" , "-jar", "/tmp/spring-petclinic/target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]

