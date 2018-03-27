# bgp-injector
#


FROM ubuntu:16.04
MAINTAINER Jonas Krogell (jonas@krogell.se)

# install various dependevies
RUN apt-get update && apt-get install -y \
  autoconf \
  libz-dev \
  libbz2-dev \
  build-essential \
  unzip \
  cpanminus \
  curl

RUN cpanm Net::BGP
RUN curl -O https://bitbucket.org/ripencc/bgpdump/get/1.5.0.zip
RUN unzip 1.5.0.zip && cd ripencc-bgpdump-a8ca3180d6d4/ && sh ./bootstrap.sh && make
RUN rm 1.5.0.zip

# Only take routes from GTT
RUN curl http://data.ris.ripe.net/rrc00/latest-bview.gz | /ripencc-bgpdump-a8ca3180d6d4/bgpdump -m - | egrep "^.+\|3257\|" > myroutes.txt
RUN rm -rvf /ripencc-bgpdump-a8ca3180d6d4/

ADD https://github.com/xdel/bgpsimple/raw/master/bgp_simple.pl /

# expose the BGP service port - disabled for now
# EXPOSE 179

# run the application
CMD perl bgp_simple.pl -myas $ASN -myip 127.0.0.1 -nolisten -peeras $ASN -peerip $PEERIP -p myroutes.txt -holdtime 300
