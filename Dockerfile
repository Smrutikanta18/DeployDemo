FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests


FROM tomcat:10.1-jdk17-corretto
COPY --from=build /app/target/DeployDemo.war /app/DeployDemo.war
EXPOSE 8089
CMD ["catalina.sh", "run"]
