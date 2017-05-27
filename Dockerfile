FROM anapsix/alpine-java:8_server-jre_unlimited

RUN mkdir -p /output

ADD http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip /fakeSMTP-latest.zip

RUN unzip /fakeSMTP-latest.zip

VOLUME /output

EXPOSE 25

ENTRYPOINT ["java","-jar","/fakeSMTP-2.0.jar","--background", "--output-dir", "/output", "--port", "25", "--start-server"]


##### BUILD & RUN #####
# docker build -t junlapong/fakesmtp .
# docker run --rm -ti junlapong/fakesmtp
