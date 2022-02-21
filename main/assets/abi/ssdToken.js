const ssd_abi=[
    {
      "inputs":[
        
      ],
      "stateMutability":"nonpayable",
      "type":"constructor"
    },
    {
      "anonymous":false,
      "inputs":[
        {
          "indexed":true,
          "internalType":"address",
          "name":"owner",
          "type":"address"
        },
        {
          "indexed":true,
          "internalType":"address",
          "name":"spender",
          "type":"address"
        },
        {
          "indexed":false,
          "internalType":"uint256",
          "name":"value",
          "type":"uint256"
        }
      ],
      "name":"Approval",
      "type":"event"
    },
    {
      "anonymous":false,
      "inputs":[
        {
          "indexed":true,
          "internalType":"address",
          "name":"previousOwner",
          "type":"address"
        },
        {
          "indexed":true,
          "internalType":"address",
          "name":"newOwner",
          "type":"address"
        }
      ],
      "name":"OwnershipTransferred",
      "type":"event"
    },
    {
      "anonymous":false,
      "inputs":[
        {
          "indexed":true,
          "internalType":"address",
          "name":"from",
          "type":"address"
        },
        {
          "indexed":true,
          "internalType":"address",
          "name":"to",
          "type":"address"
        },
        {
          "indexed":false,
          "internalType":"uint256",
          "name":"value",
          "type":"uint256"
        }
      ],
      "name":"Transfer",
      "type":"event"
    },
    {
      "inputs":[
        {
          "internalType":"address",
          "name":"owner",
          "type":"address"
        },
        {
          "internalType":"address",
          "name":"spender",
          "type":"address"
        }
      ],
      "name":"allowance",
      "outputs":[
        {
          "internalType":"uint256",
          "name":"",
          "type":"uint256"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        {
          "internalType":"address",
          "name":"spender",
          "type":"address"
        },
        {
          "internalType":"uint256",
          "name":"amount",
          "type":"uint256"
        }
      ],
      "name":"approve",
      "outputs":[
        {
          "internalType":"bool",
          "name":"",
          "type":"bool"
        }
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    },
    {
      "inputs":[
        {
          "internalType":"address",
          "name":"account",
          "type":"address"
        }
      ],
      "name":"balanceOf",
      "outputs":[
        {
          "internalType":"uint256",
          "name":"",
          "type":"uint256"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        {
          "internalType":"address",
          "name":"newUniswapRouter_",
          "type":"address"
        }
      ],
      "name":"changeUniswapRouter",
      "outputs":[
        
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"decimals",
      "outputs":[
        {
          "internalType":"uint8",
          "name":"",
          "type":"uint8"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        {
          "internalType":"address",
          "name":"spender",
          "type":"address"
        },
        {
          "internalType":"uint256",
          "name":"subtractedValue",
          "type":"uint256"
        }
      ],
      "name":"decreaseAllowance",
      "outputs":[
        {
          "internalType":"bool",
          "name":"",
          "type":"bool"
        }
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"geUnlockTime",
      "outputs":[
        {
          "internalType":"uint256",
          "name":"",
          "type":"uint256"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        {
          "internalType":"address",
          "name":"spender",
          "type":"address"
        },
        {
          "internalType":"uint256",
          "name":"addedValue",
          "type":"uint256"
        }
      ],
      "name":"increaseAllowance",
      "outputs":[
        {
          "internalType":"bool",
          "name":"",
          "type":"bool"
        }
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    },
    {
      "inputs":[
        {
          "internalType":"uint256",
          "name":"time",
          "type":"uint256"
        }
      ],
      "name":"lock",
      "outputs":[
        
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"name",
      "outputs":[
        {
          "internalType":"string",
          "name":"",
          "type":"string"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"owner",
      "outputs":[
        {
          "internalType":"address",
          "name":"",
          "type":"address"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"renounceOwnership",
      "outputs":[
        
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"symbol",
      "outputs":[
        {
          "internalType":"string",
          "name":"",
          "type":"string"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"totalSupply",
      "outputs":[
        {
          "internalType":"uint256",
          "name":"",
          "type":"uint256"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        {
          "internalType":"address",
          "name":"recipient",
          "type":"address"
        },
        {
          "internalType":"uint256",
          "name":"amount",
          "type":"uint256"
        }
      ],
      "name":"transfer",
      "outputs":[
        {
          "internalType":"bool",
          "name":"",
          "type":"bool"
        }
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    },
    {
      "inputs":[
        {
          "internalType":"address",
          "name":"sender",
          "type":"address"
        },
        {
          "internalType":"address",
          "name":"recipient",
          "type":"address"
        },
        {
          "internalType":"uint256",
          "name":"amount",
          "type":"uint256"
        }
      ],
      "name":"transferFrom",
      "outputs":[
        {
          "internalType":"bool",
          "name":"",
          "type":"bool"
        }
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    },
    {
      "inputs":[
        {
          "internalType":"address",
          "name":"newOwner",
          "type":"address"
        }
      ],
      "name":"transferOwnership",
      "outputs":[
        
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"uniswapV2Pair",
      "outputs":[
        {
          "internalType":"address",
          "name":"",
          "type":"address"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"uniswapV2Router",
      "outputs":[
        {
          "internalType":"contract IUniswapV2Router02",
          "name":"",
          "type":"address"
        }
      ],
      "stateMutability":"view",
      "type":"function"
    },
    {
      "inputs":[
        
      ],
      "name":"unlock",
      "outputs":[
        
      ],
      "stateMutability":"nonpayable",
      "type":"function"
    }
  ]
const presale_abi =  [
        {
          "inputs":[
            {
              "internalType":"address",
              "name":"_pSaleToken",
              "type":"address"
            },
            {
              "internalType":"address",
              "name":"_investToken",
              "type":"address"
            },
            {
              "internalType":"address",
              "name":"_bnbLPtoken",
              "type":"address"
            }
          ],
          "stateMutability":"nonpayable",
          "type":"constructor"
        },
        {
          "anonymous":false,
          "inputs":[
            {
              "indexed":true,
              "internalType":"address",
              "name":"previousOwner",
              "type":"address"
            },
            {
              "indexed":true,
              "internalType":"address",
              "name":"newOwner",
              "type":"address"
            }
          ],
          "name":"OwnershipTransferred",
          "type":"event"
        },
        {
          "anonymous":false,
          "inputs":[
            {
              "indexed":false,
              "internalType":"address",
              "name":"account",
              "type":"address"
            }
          ],
          "name":"PayeeAdded",
          "type":"event"
        },
        {
          "anonymous":false,
          "inputs":[
            {
              "indexed":false,
              "internalType":"address",
              "name":"account",
              "type":"address"
            }
          ],
          "name":"PayeeRemoved",
          "type":"event"
        },
        {
          "anonymous":false,
          "inputs":[
            {
              "indexed":false,
              "internalType":"address",
              "name":"_investToken",
              "type":"address"
            }
          ],
          "name":"changedInvestToken",
          "type":"event"
        },
        {
          "anonymous":false,
          "inputs":[
            {
              "indexed":false,
              "internalType":"address",
              "name":"sender",
              "type":"address"
            },
            {
              "indexed":false,
              "internalType":"uint256",
              "name":"investamount",
              "type":"uint256"
            },
            {
              "indexed":false,
              "internalType":"uint256",
              "name":"pSPRKamount",
              "type":"uint256"
            }
          ],
          "name":"pFAIRPurchased",
          "type":"event"
        },
        {
          "anonymous":false,
          "inputs":[
            {
              "indexed":false,
              "internalType":"address",
              "name":"sender",
              "type":"address"
            },
            {
              "indexed":false,
              "internalType":"uint256",
              "name":"investamount",
              "type":"uint256"
            },
            {
              "indexed":false,
              "internalType":"uint256",
              "name":"pSPRKamount",
              "type":"uint256"
            }
          ],
          "name":"pFAIRPurchasedWithBNB",
          "type":"event"
        },
        {
          "anonymous":false,
          "inputs":[
            {
              "indexed":false,
              "internalType":"uint256",
              "name":"investmentTotal",
              "type":"uint256"
            }
          ],
          "name":"withdrawBNBInvestment",
          "type":"event"
        },
        {
          "anonymous":false,
          "inputs":[
            {
              "indexed":false,
              "internalType":"uint256",
              "name":"investmentTotal",
              "type":"uint256"
            }
          ],
          "name":"withdrawInvestment",
          "type":"event"
        },
        {
          "anonymous":false,
          "inputs":[
            {
              "indexed":false,
              "internalType":"uint256",
              "name":"pSPRKLeft",
              "type":"uint256"
            }
          ],
          "name":"withdrawUnclaimed",
          "type":"event"
        },
        {
          "inputs":[
            
          ],
          "name":"PreSaleTokenRegularAvailable",
          "outputs":[
            {
              "internalType":"uint256",
              "name":"",
              "type":"uint256"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            {
              "internalType":"address",
              "name":"account",
              "type":"address"
            }
          ],
          "name":"_addPayee",
          "outputs":[
            
          ],
          "stateMutability":"nonpayable",
          "type":"function"
        },
        {
          "inputs":[
            {
              "internalType":"address",
              "name":"account",
              "type":"address"
            }
          ],
          "name":"_removePayee",
          "outputs":[
            
          ],
          "stateMutability":"nonpayable",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"bnbLPtoken",
          "outputs":[
            {
              "internalType":"address",
              "name":"",
              "type":"address"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            {
              "internalType":"uint256",
              "name":"_investAmount",
              "type":"uint256"
            }
          ],
          "name":"buyPSPRK",
          "outputs":[
            
          ],
          "stateMutability":"nonpayable",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"buyPSPRKWithBNB",
          "outputs":[
            
          ],
          "stateMutability":"payable",
          "type":"function"
        },
        {
          "inputs":[
            {
              "internalType":"address",
              "name":"investToken_",
              "type":"address"
            }
          ],
          "name":"changeInvestToken",
          "outputs":[
            
          ],
          "stateMutability":"nonpayable",
          "type":"function"
        },
        {
          "inputs":[
            {
              "internalType":"address",
              "name":"_investor",
              "type":"address"
            }
          ],
          "name":"checkInvestorDetails",
          "outputs":[
            {
              "internalType":"uint256",
              "name":"",
              "type":"uint256"
            },
            {
              "internalType":"uint256",
              "name":"",
              "type":"uint256"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"investToken",
          "outputs":[
            {
              "internalType":"address",
              "name":"",
              "type":"address"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            {
              "internalType":"address",
              "name":"",
              "type":"address"
            }
          ],
          "name":"investorMatrix",
          "outputs":[
            {
              "internalType":"uint256",
              "name":"amountInvested",
              "type":"uint256"
            },
            {
              "internalType":"uint256",
              "name":"pSaleTokens",
              "type":"uint256"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"maxCapacityRegular",
          "outputs":[
            {
              "internalType":"uint256",
              "name":"",
              "type":"uint256"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"minimumInvestment",
          "outputs":[
            {
              "internalType":"uint256",
              "name":"",
              "type":"uint256"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"numInvestors",
          "outputs":[
            {
              "internalType":"uint256",
              "name":"",
              "type":"uint256"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"owner",
          "outputs":[
            {
              "internalType":"address",
              "name":"",
              "type":"address"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"pSaleToken",
          "outputs":[
            {
              "internalType":"address",
              "name":"",
              "type":"address"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"pTokenPrice",
          "outputs":[
            {
              "internalType":"uint256",
              "name":"",
              "type":"uint256"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"purchasedAmount",
          "outputs":[
            {
              "internalType":"uint256",
              "name":"",
              "type":"uint256"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"renounceOwnership",
          "outputs":[
            
          ],
          "stateMutability":"nonpayable",
          "type":"function"
        },
        {
          "inputs":[
            {
              "internalType":"address",
              "name":"newOwner",
              "type":"address"
            }
          ],
          "name":"transferOwnership",
          "outputs":[
            
          ],
          "stateMutability":"nonpayable",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"uniswapV2Pair",
          "outputs":[
            {
              "internalType":"address",
              "name":"",
              "type":"address"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"uniswapV2Router",
          "outputs":[
            {
              "internalType":"contract IUniswapV2Router02",
              "name":"",
              "type":"address"
            }
          ],
          "stateMutability":"view",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"withdraw",
          "outputs":[
            
          ],
          "stateMutability":"payable",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"withdrawBNBInvestmentToTreasury",
          "outputs":[
            
          ],
          "stateMutability":"payable",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"withdrawInvestmentToTreasury",
          "outputs":[
            
          ],
          "stateMutability":"nonpayable",
          "type":"function"
        },
        {
          "inputs":[
            
          ],
          "name":"withdrawUnclaimedToTreasury",
          "outputs":[
            
          ],
          "stateMutability":"nonpayable",
          "type":"function"
        }
      ]
