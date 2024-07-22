FROM openjdk:8-jdk-alpine
RUN addgroup -S notes && adduser -S notes -G notes
ENV MAVEN_VERSION 3.9.8
ENV MAVEN_HOME /usr/lib/mvn
RUN wget https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz  && \
    tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    mv apache-maven-$MAVEN_VERSION /usr/lib/mvn
RUN apk --update add git
USER notes:notes
WORKDIR /opt/notes
RUN git clone https://github.com/andredw13L/spring-boot-mysql-rest-api-tutorial.git /opt/notes
RUN mvn package -Dmaven.test.skip=true
ARG JAR_FILE=*.jar
RUN cp ./target/easy-notes-1.0.0.jar /opt/notes/easy-notes.jar
ENTRYPOINT [ "java", "-jar", "/opt/notes/easy-notes.jar" ]
