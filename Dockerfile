# bgp-injector
#

FROM ubuntu:18.04
MAINTAINER Jonas Krogell (jonas@krogell.se)

RUN apt-get update
RUN apt-get install -y bgpdump curl perl cpanminus make iproute2
RUN cpanm Net::BGP

# Only take routes from GTT
RUN curl http://data.ris.ripe.net/rrc00/latest-bview.gz | bgpdump -m - | egrep "^.+\|3257\|" > myroutes.txt


ADD https://github.com/xdel/bgpsimple/raw/master/bgp_simple.pl /

# expose the BGP service port - disabled for now
EXPOSE 179

# install startup script
COPY start.sh /

# run the application
CMD bash start.sh
