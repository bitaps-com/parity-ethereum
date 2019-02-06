FROM ubuntu:16.04
MAINTAINER Nadezhda Karpova <nadyka@bitaps.com>

RUN apt-get -y update && \
        apt-get -y install build-essential cmake libudev-dev\
        curl git make g++ gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf \
        libc6-dev-armhf-cross wget file ca-certificates \
        binutils-arm-linux-gnueabihf

# install rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN git clone https://github.com/paritytech/parity
RUN cd parity;git pull;git checkout "v2.2.9";
RUN cd parity;$HOME/.cargo/bin/cargo build --release && cp target/release/parity /usr/local/bin

EXPOSE 8545 8546 30303/tcp

ENTRYPOINT ["/usr/local/bin/parity"]
