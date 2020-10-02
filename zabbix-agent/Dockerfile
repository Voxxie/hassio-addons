ARG BUILD_FROM=hassioaddons/base:8.0.1
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy scripts for add-on
COPY run.sh /

RUN apk add -U jq zabbix-agent, fping sudo && \
  chmod a+x /run.sh
RUN chmod u+s /bin/ping
RUN chmod u+s /bin/fping

CMD [ "/run.sh" ]
