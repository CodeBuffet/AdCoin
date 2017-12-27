FROM ubuntu:16.04

RUN apt-get update && apt-get install -y sudo curl git python build-essential libssl-dev libboost-all-dev software-properties-common libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils psmisc nano
RUN sudo add-apt-repository ppa:bitcoin/bitcoin -y && apt-get update && apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
ENV NVM_DIR /root/.nvm
RUN . /root/.nvm/nvm.sh && nvm install v0.10.25

ADD start-simulation /usr/bin/start-simulation
ADD stratum-server /opt/stratum-server
RUN cd /opt/stratum-server && . /root/.nvm/nvm.sh && npm install
ADD litecoin.conf /root/.adcoin/adcoin.conf
RUN mkdir /opt/litecoin
ADD bin/litecoind /opt/litecoin
ADD bin/litecoin-cli /opt/litecoin
CMD /usr/bin/start-simulation
