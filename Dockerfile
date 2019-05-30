FROM openjdk
ADD target/Micro1.war Micro1.war
ENTRYPOINT ["java", "-jar", "/Micro1.war"]
EXPOSE 2222