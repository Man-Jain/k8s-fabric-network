CHANNEL_NAME="$1"
export PATH=${PWD}/bin:$PATH
export FABRIC_CFG_PATH=${PWD}/artifacts
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/${CHANNEL_NAME}.tx -channelID $CHANNEL_NAME

for orgmsp in Org1MSP Org2MSP; do

	infoln "Generating anchor peer update transaction for ${orgmsp}"
	set -x
	configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/${orgmsp}anchors.tx -channelID $CHANNEL_NAME -asOrg ${orgmsp}
	res=$?
	{ set +x; } 2>/dev/null
	if [ $res -ne 0 ]; then
		fatalln "Failed to generate anchor peer update transaction for ${orgmsp}..."
	fi
	done
