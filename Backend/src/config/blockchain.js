const { Web3 } = require("web3");
const { abi, bytecode } = require("../../artifacts/TravelSafetyContract.json");

// Assumes the blockchain node URL is in an environment variable.
const web3 = new Web3(process.env.BLOCKCHAIN_NODE_URL);

// Contract address after deployment to the blockchain network.
// This should be set in environment variables.
const contractAddress = process.env.CONTRACT_ADDRESS;
const contract = new web3.eth.Contract(abi, contractAddress);

/**
 * Records a critical event on the blockchain.
 * This function should be called for events that require an immutable,
 * verifiable record, such as a confirmed emergency or a formal report.
 * @param {string} touristId The unique ID of the tourist.
 * @param {string} eventType A string describing the type of event (e.g., "SOS_ALERT", "REPORT_FILED").
 * @param {string} eventData Additional data related to the event (e.g., location, report ID).
 */
exports.recordEvent = async (touristId, eventType, eventData) => {
  // A private key for the account that will be sending the transaction.
  const privateKey = process.env.WALLET_PRIVATE_KEY;
  const account = web3.eth.accounts.privateKeyToAccount(privateKey);
  web3.eth.accounts.wallet.add(account);

  try {
    const tx = await contract.methods
      .recordEvent(touristId, eventType, eventData)
      .send({
        from: account.address,
        gas: 2000000, // Gas limit, adjust as needed.
      });
    console.log("Transaction successful:", tx.transactionHash);
    return tx.transactionHash;
  } catch (error) {
    console.error("Error recording event on blockchain:", error);
    throw error;
  }
};

/**
 * Retrieves an event from the blockchain using its transaction hash.
 * @param {string} transactionHash The hash of the transaction.
 */
exports.getEvent = async (transactionHash) => {
  try {
    const receipt = await web3.eth.getTransactionReceipt(transactionHash);
    if (receipt && receipt.logs.length > 0) {
      // Decode the event data from the transaction log.
      const decodedEvent = web3.eth.abi.decodeLog(
        [
          {
            type: "string",
            name: "touristId",
          },
          {
            type: "string",
            name: "eventType",
          },
          {
            type: "string",
            name: "eventData",
          },
        ],
        receipt.logs[0].data,
        receipt.logs[0].topics.slice(1)
      );
      return decodedEvent;
    }
    return null;
  } catch (error) {
    console.error("Error retrieving event from blockchain:", error);
    throw error;
  }
};
// Note: Ensure that the contract is deployed and the address is correctly set in the environment variables.
