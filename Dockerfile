FROM debian:buster
MAINTAINER mathgl <mathgl67@gmail.com>
RUN apt-get update && apt-get upgrade -qy

RUN apt-get install -qy mpd pulseaudio
RUN usermod -a -G pulse-access mpd 
RUN mkdir -p /etc/mpd && mv /etc/mpd.conf /etc/mpd/mpd.conf
RUN mkdir -p /run/mpd && chown mpd /run/mpd

VOLUME ["/etc/mpd", "/var/lib/mpd/music"]

EXPOSE 6600

USER mpd

CMD ["/usr/bin/mpd", "--no-daemon", "/etc/mpd/mpd.conf"]

