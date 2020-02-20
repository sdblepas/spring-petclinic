FROM tomcat

MAINTAINER sdblepasgmail.com

WORKDIR /tmp
RUN apt-get -qq update && \
    apt-get install -y wget git-core maven && \
    git clone https://github.com/sdblepas/spring-petclinic.git && \
    cd spring-petclinic && mvn package

WORKDIR /tmp/spring-petclinic/target
CMD ["java" , "-jar", "/tmp/spring-petclinic/target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]

