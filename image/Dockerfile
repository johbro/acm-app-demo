FROM centos/nginx-112-centos7

MAINTAINER "John Browning" "johnb@redhat.com"

COPY --chown=default:0 index.html /opt/app-root/src/index.html
RUN chmod a+r+w /opt/app-root/src/index.html
COPY startnginx.sh /opt/app-root/src/startnginx.sh

RUN echo '----BUILDING HELLO----'

CMD ["/opt/app-root/src/startnginx.sh"]
