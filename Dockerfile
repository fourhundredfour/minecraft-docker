FROM openjdk:8-alpine as build

WORKDIR /usr/src/app

RUN apk update && apk add \
    curl \
    git

RUN curl "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -o BuildTools.jar

RUN java -jar BuildTools.jar


FROM openjdk:8-alpine

EXPOSE 25565

WORKDIR /usr/src/app
COPY --from=build /usr/src/app/spigot-*.jar /usr/src/app/spigot.jar

RUN touch eula.txt
RUN echo "eula=true" > eula.txt

ENTRYPOINT ["java", "-jar", "spigot.jar"]