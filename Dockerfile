#FROM alpine:3.5
#RUN apk add --no-cache ca-certificates && update-ca-certificates && apk add --no-cache openssl curl
FROM ubuntu:16.04
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && update-ca-certificates && apt-get install -y --no-install-recommends openssl curl
RUN mkdir openj9 && cd openj9 && curl -L https://github.com/AdoptOpenJDK/openjdk9-openj9-releases/releases/download/jdk-9%2B181/OpenJDK9-OPENJ9_x64_Linux_jdk-9.181.tar.gz | tar xz
#RUN mkdir openj9 && cd openj9
#RUN wget https://github.com/AdoptOpenJDK/openjdk9-openj9-releases/releases/download/jdk-9%2B181/OpenJDK9-OPENJ9_x64_Linux_jdk-9.181.tar.gz
#RUN tar -xvf OpenJDK9-OPENJ9_x64_Linux_jdk-9.181.tar.gz
RUN apt-get remove -y curl openssl && apt autoremove -y && rm -rf /var/lib/apt/lists/*
ENV PATH="/openj9/jdk-9+181/bin:${PATH}"
