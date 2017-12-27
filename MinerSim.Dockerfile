FROM ubuntu:16.04

RUN apt update && apt install -y sudo curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
RUN source /home/ubuntu/.bashrc
RUN nvm install v0.10.25
RUN mkdir /opt/litecoin
ADD src/litecoind /opt/litecoin
ADD src/litecoin-cli /opt/litecoin
ADD docker/litecoin.conf /home/ubuntu/.litecoin/litecoin.conf
ADD docker/stratum-server /opt/stratum-server
