FROM rlister/ruby:2.1.5

MAINTAINER schof "https://github.com/schof"

RUN apt-get update
RUN apt-get install -y make
RUN apt-get install -y gcc
RUN apt-get install -y libxslt-dev libxml2-dev
RUN apt-get install -y wget git-core

RUN gem update --system
RUN gem install bundler

RUN git clone https://github.com/schof/docker-sinatra /root/sinatra
RUN cd /root/sinatra; bundle install

EXPOSE 4567
CMD ["/usr/local/bin/foreman","start","-d","/root/sinatra"]