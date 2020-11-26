export PATH=${PWD}/bin:$PATH
export FABRIC_CFG_PATH=${PWD}/artifacts/
configtxgen -profile TwoOrgsOrdererGenesis -channelID system-channel -outputBlock ./orderer-files/genesis.block