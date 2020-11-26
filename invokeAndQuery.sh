export FABRIC_CFG_PATH=${PWD}/config

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0-org1/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=peer0-org1:7051


peer chaincode invoke -o orderer0:7050 --ordererTLSHostnameOverride orderer0 --tls --tls --cafile ${PWD}/organizations/ordererOrganizations/ordererOrg.example.com/orderers/orderer0/msp/tlscacerts/tlsca.ordererOrg.example.com-cert.pem --channelID mychannel --name basic --peerAddresses peer0-org1:7051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0-org1/tls/ca.crt --peerAddresses peer0-org2:9051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0-org2/tls/ca.crt -c '{"function":"InitLedger","Args":[]}'


export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0-org2/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
export CORE_PEER_ADDRESS=peer0-org2:9051

peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'
