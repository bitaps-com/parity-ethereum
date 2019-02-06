# parity-ethereum
parity-ethereum docker image

Builds: parity:latest - v2.2.9

How to use:

Create persistent volume for blockchain

    $ docker volume create parity-mainnet

Start container with autostart

    $ sudo docker run --name parity-mainnet \
                      --restart=always \
                      -p 18545:8545 -p 18546:8546 -p 30303:30303 \
                      -v parity-mainnet:/root/.local/share/io.parity.ethereum/chains/ \
                      -it bitaps/parity:latest \ 
                      --jsonrpc-port 8545 --jsonrpc-interface "0.0.0.0" --jsonrpc-apis "all" \
                      --ws-port 8546 --ws-interface "0.0.0.0"
