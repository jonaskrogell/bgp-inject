# bgp-injector
#
# VERSION               0.0.1
#
# start with:
# docker run -d --name bgp-injector --restart unless-stopped bgp-inject


FROM ubuntu

RUN whoami

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

RUN curl -O http://data.ris.ripe.net/rrc00/latest-bview.gz

# Only take routes from GTT
RUN cat latest-bview.gz | /ripencc-bgpdump-a8ca3180d6d4/bgpdump -m - | egrep "^.+\|3257\|" > myroutes.txt

ADD https://github.com/xdel/bgpsimple/raw/master/bgp_simple.pl /


# expose the BGP service port
EXPOSE 179

# run the application
CMD perl bgp_simple.pl -myas 64512 -myip $(hostname -i) -peeras 64512 -peerip 192.168.200.230 -p myroutes.txt -holdtime 1200
