# FROM eclipse-temurin:17-jre-alpine
# ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
# EXPOSE 8082
# ENTRYPOINT ["java", "-jar", "/app.jar"]

FROM eclipse-temurin:17-jdk-alpine as builder
WORKDIR /opt/app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY ./src ./src
# RUN ./mvnw clean install

FROM eclipse-temurin:17-jre-alpine
WORKDIR /opt/app
# COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "/opt/app/*.jar"]