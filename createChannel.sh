CHANNEL_NAME="$1"
export PATH=${PWD}/bin:$PATH
export FABRIC_CFG_PATH=${PWD}/config

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0-org1/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051
echo $PWD
peer channel create -o localhost:7050 --ordererTLSHostnameOverride orderer0 -c ${CHANNEL_NAME} -f ./channel-artifacts/${CHANNEL_NAME}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME}.block --tls --cafile ${PWD}/organizations/ordererOrganizations/ordererOrg.example.com/orderers/orderer0/msp/tlscacerts/tlsca.ordererOrg.example.com-cert.pem