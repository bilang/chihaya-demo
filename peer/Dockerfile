# vim: ft=dockerfile
FROM elventear/transmission
MAINTAINER Jimmy Zelinskie <jimmyzelinskie@gmail.com>

USER root

ADD app.py /
ADD new.torrent /
ADD run.sh /
RUN pip install transmissionrpc requests uuid

VOLUME ["/var/lib/transmission-daemon/downloads", "/var/lib/transmission-daemon/incomplete"]
CMD ["/run.sh"]
