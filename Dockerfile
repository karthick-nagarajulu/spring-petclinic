FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY target/spring-petclinic-2.4.2.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
