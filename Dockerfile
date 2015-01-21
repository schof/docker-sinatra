FROM rlister/ruby:2.1.5

MAINTAINER schof "https://github.com/schof"

# Install packages for ssl
RUN apt-get install -y --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean

RUN gem update --system
RUN gem install bundler

RUN git clone https://github.com/schof/docker-sinatra /root/sinatra
RUN cd /root/sinatra; bundle install

EXPOSE 4567
CMD ["/usr/local/bin/foreman","start","-d","/root/sinatra"]