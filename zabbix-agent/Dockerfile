ARG BUILD_FROM=hassioaddons/base:8.0.1
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy scripts for add-on
COPY run.sh /

RUN apk add -U jq zabbix-agent sudo && \
  chmod a+x /run.sh
RUN apk add fping
RUN chmod u+s /bin/ping

CMD [ "/run.sh" ]
