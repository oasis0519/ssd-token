"use strict";

/**
 * Example JavaScript code that interacts with the page and Web3 wallets
 */

 // Unpkg imports
const Web3Modal = window.Web3Modal.default;
const WalletConnectProvider = window.WalletConnectProvider.default;
const EvmChains = window.EvmChains;
const Fortmatic = window.Fortmatic;
const ssd_token_contract_address = "0x4969F0B71f565C0e6151B47febD00EcA6866C343";
const presale_contract_address = "0xA102469CABDcE3EDdB49C3C299Cd211c7b76d7E2";
// Web3modal instance
let web3Modal;
let ssdContract;
let preSaleContract;
// Chosen wallet provider given by the dialog window
let provider;


// Address of the selected account
let selectedAccount;


/**
 * Setup the orchestra
 */
function init() {

  console.log("Initializing example");
  console.log("WalletConnectProvider is", WalletConnectProvider);
  console.log("Fortmatic is", Fortmatic);

  // Tell Web3modal what providers we have available.
  // Built-in web browser provider (only one can exist as a time)
  // like MetaMask, Brave or Opera is added automatically by Web3modal
  const providerOptions = {
    walletconnect: {
      package: WalletConnectProvider,
      options: {
        // Mikko's test key - don't copy as your mileage may vary
        infuraId: "8043bb2cf99347b1bfadfb233c5325c0",
      }
    },

    fortmatic: {
      package: Fortmatic,
      options: {
        // Mikko's TESTNET api key
        key: "pk_test_391E26A3B43A3350"
      }
    }
  };

  web3Modal = new Web3Modal({
    cacheProvider: false, // optional
    providerOptions, // required
  });

}


/**
 * Kick in the UI action after Web3modal dialog has chosen a provider
 */
async function fetchAccountData() {

  // Get a Web3 instance for the wallet
  const web3 = new Web3(provider);

  console.log("Web3 instance is", web3);

  // Get connected chain id from Ethereum node
  const chainId = await web3.eth.getChainId();
  const accounts = await web3.eth.getAccounts();
  console.log("Got accounts", accounts);
  selectedAccount = accounts[0];
  document.querySelector("#wallet").textContent = selectedAccount;
  window.document.querySelector("#account").style.display = 'block';

 

  // // Get a handl

  // const accountContainer = document.querySelector("#accounts");

  // // Purge UI elements any previously loaded accounts
  // accountContainer.innerHTML = '';

  // // Go through all accounts and get their ETH balance
  // const rowResolvers = accounts.map(async (address) => {
  //   const balance = await web3.eth.getBalance(address);
  //   // ethBalance is a BigNumber instance
  //   // https://github.com/indutny/bn.js/
  //   const ethBalance = web3.utils.fromWei(balance, "ether");
  //   const humanFriendlyBalance = parseFloat(ethBalance).toFixed(4);
  //   // Fill in the templated row and put in the document
  //   const clone = template.content.cloneNode(true);
  //   clone.querySelector(".address").textContent = address;
  //   clone.querySelector(".balance").textContent = humanFriendlyBalance;
  //   accountContainer.appendChild(clone);
  // });

  // // Because rendering account does its own RPC commucation
  // // with Ethereum node, we do not want to display any results
  // // until data for all accounts is loaded
  // await Promise.all(rowResolvers);

  // // Display fully loaded UI for wallet data
  // document.querySelector("#prepare").style.display = "none";
  // document.querySelector("#connected").style.display = "block";
}


async function onConnect() {

  console.log("Opening a dialog", web3Modal);
  try {
    provider = await web3Modal.connect();
  } catch(e) {
    console.log("Could not get a wallet connection", e);
    return;
  }

  // Subscribe to accounts change
  provider.on("accountsChanged", (accounts) => {
    fetchAccountData();
  });

  // Subscribe to chainId change
  provider.on("chainChanged", (chainId) => {
    fetchAccountData();
  });

  console.log("provider--->>",provider);

  await fetchAccountData();

  window.document.querySelector("#btn-connect").style.display = "none";
  window.document.querySelector("#btn-disconnect").style.display = "block";
  window.document.querySelector("#buy-form").style.display = "block";
}

/**
 * Disconnect wallet button pressed.
 */
async function onDisconnect() {

  console.log("Killing the wallet connection", provider);
  alert("disconnect!")
  // TODO: Which providers have close method?
  if(provider.close) {
    await provider.close();

    // If the cached provider is not cleared,
    // WalletConnect will default to the existing session
    // and does not allow to re-scan the QR code with a new wallet.
    // Depending on your use case you may want or want not his behavir.
    await web3Modal.clearCachedProvider();
    provider = null;
  }

  selectedAccount = null;
  window.document.querySelector("#btn-connect").style.display = "block";
  window.document.querySelector("#btn-disconnect").style.display = "none";
  document.querySelector('#account').style.display = 'none';
  window.document.querySelector("#buy-form").style.display = "none";
}

async function onBuy() {
  const web3 = new Web3(provider);
  const chainId = await web3.eth.getChainId();
  console.log("chainId-->>", chainId, typeof(chainId))
  if(chainId==56){
    preSaleContract = new web3.eth.Contract(presale_abi, presale_contract_address);
    ssdContract = new web3.eth.Contract(ssd_abi, ssd_token_contract_address);
    const investAmount = document.getElementById("amount").value;
    const msgValue = ethers.utils.parseEther(investAmount);
    console.log("msgValue-->>", msgValue, selectedAccount);
    preSaleContract.methods.buyPSPRKWithBNB().send({from:selectedAccount,value:msgValue})
    .on('transactionHash', function(hash){
        console.log(hash);
     })
    .on('confirmation', function(confirmationNumber, receipt){
        console.log(confirmationNumber);
     })
    .on('receipt', function(receipt){
        console.log(receipt);
        alert("Transaction success!")
     })
    .on('error', function(error, receipt) { // If the transaction was rejected by the network with a receipt, the second parameter will be the receipt.
        console.log(error);
     });
  }else{
    alert("Wrong Network, Please switch to BSC network!");
  }
  


}

/**
 * Main entry point.
 */
window.addEventListener('load', async () => {
  init();
  if(provider){
    window.document.querySelector("#btn-connect").style.display = "none";
    window.document.querySelector("#btn-disconnect").style.display = "block";
    window.document.querySelector("#buy-form").style.display = "block";
    fetchAccountData();
  }else{
    window.document.querySelector("#btn-connect").style.display = "block";
    window.document.querySelector("#btn-disconnect").style.display = "none";
    window.document.querySelector("#buy-form").style.display = "none";

  }
  document.querySelector("#btn-connect").addEventListener("click", onConnect);
  document.querySelector("#btn-disconnect").addEventListener("click", onDisconnect);
  document.querySelector("#btn-buy").addEventListener("click", onBuy)
});
