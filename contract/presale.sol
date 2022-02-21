// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;


import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
abstract contract ReentrancyGuard {
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor ()  {
        _status = _NOT_ENTERED;
    }

    modifier nonReentrant() {
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
        _status = _ENTERED;
        _;
        _status = _NOT_ENTERED;
    }
}
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {

        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }

    function sqrrt(uint256 a) internal pure returns (uint c) {
        if (a > 3) {
            c = a;
            uint b = add( div( a, 2), 1 );
            while (b < c) {
                c = b;
                b = div( add( div( a, b ), b), 2 );
            }
        } else if (a != 0) {
            c = 1;
        }
    }

    function percentageAmount( uint256 total_, uint8 percentage_ ) internal pure returns ( uint256 percentAmount_ ) {
        return div( mul( total_, percentage_ ), 1000 );
    }

    function substractPercentage( uint256 total_, uint8 percentageToSub_ ) internal pure returns ( uint256 result_ ) {
        return sub( total_, div( mul( total_, percentageToSub_ ), 1000 ) );
    }

    function percentageOfTotal( uint256 part_, uint256 total_ ) internal pure returns ( uint256 percent_ ) {
        return div( mul(part_, 100) , total_ );
    }

    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }

    function quadraticPricing( uint256 payment_, uint256 multiplier_ ) internal pure returns (uint256) {
        return sqrrt( mul( multiplier_, payment_ ) );
    }

  function bondingCurve( uint256 supply_, uint256 multiplier_ ) internal pure returns (uint256) {
      return mul( multiplier_, supply_ );
  }
}

library Address {
  function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

  
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

   
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            if (returndata.length > 0) {

                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }

  
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

  
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            if (returndata.length > 0) {
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }

    function addressToString(address _address) internal pure returns(string memory) {
        bytes32 _bytes = bytes32(uint256(uint160(address(_address))));
        bytes memory HEX = "0123456789abcdef";
        bytes memory _addr = new bytes(42);

        _addr[0] = '0';
        _addr[1] = 'x';

        for(uint256 i = 0; i < 20; i++) {
            _addr[2+i*2] = HEX[uint8(_bytes[i + 12] >> 4)];
            _addr[3+i*2] = HEX[uint8(_bytes[i + 12] & 0x0f)];
        }

        return string(_addr);

    }
}
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { 
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

 
interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);
 
    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);
 
    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);
 
    function createPair(address tokenA, address tokenB) external returns (address pair);
 
    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}
 
 
interface IUniswapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);
 
    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);
 
    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
 
    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);
 
    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;
 
    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);
 
    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);
 
    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;
 
    function initialize(address, address) external;
}
 

 
interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);
 
    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
 
    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}
 
 

 
interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);
 
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

 
contract PresaleSPRKLaunchPool is Ownable, ReentrancyGuard {

    using SafeERC20 for ERC20;
    using SafeMath for uint256;

  
  
    mapping(address => bool) private _payees;

    IUniswapV2Router02 public  uniswapV2Router;
    address public  uniswapV2Pair;


    struct InvestorStats {
        uint256 amountInvested; 
        uint256 pSaleTokens; 
    }
    mapping(address => InvestorStats) public investorMatrix;

    // number of investors
    uint256 public numInvestors = 0;


    address public immutable pSaleToken;
   
    address public investToken;

    address public immutable bnbLPtoken;


    uint256 public  pTokenPrice;

    uint256 public purchasedAmount = 0;


    uint256 public minimumInvestment = 100;

    uint256 public maxCapacityRegular = 2000 * (10 ** 9);


    uint32 blockTimestampLast_;

    

    event pFAIRPurchased(address sender, uint256 investamount, uint256 pSPRKamount);
    event pFAIRPurchasedWithBNB(address sender, uint256 investamount, uint256 pSPRKamount);


    event withdrawInvestment(uint256 investmentTotal);
    event withdrawBNBInvestment(uint256 investmentTotal);
    event withdrawUnclaimed(uint256 pSPRKLeft);
 
    event PayeeAdded(address account);
    event PayeeRemoved( address account);

    event changedInvestToken(address _investToken);


    constructor(
        address _pSaleToken,
        address _investToken,
        address _bnbLPtoken
    ) {

        require(_pSaleToken != address(0), "pSaleToken address cannot be 0x");
        require(_investToken != address(0), "investToken address cannot be 0x");
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);       // MAINNET
        if(IUniswapV2Factory(_uniswapV2Router.factory()).getPair(_pSaleToken, _investToken)!=address(0)){
                uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory()).getPair(_pSaleToken, _investToken);
        } else{
            uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory()).createPair(_pSaleToken, _investToken);

        }
        uniswapV2Router = _uniswapV2Router;


        investToken = _investToken;

        pSaleToken = _pSaleToken;
        bnbLPtoken = _bnbLPtoken;
    }



    function PreSaleTokenRegularAvailable() view public onlyOwner returns ( uint ) {
            uint deposits = ERC20(pSaleToken).balanceOf(address(this));
            return deposits;
    }

    function changeInvestToken(address investToken_)  public onlyOwner {
        investToken = investToken_;
        if(IUniswapV2Factory(uniswapV2Router.factory()).getPair(pSaleToken, investToken_)==address(0)){
            
            uniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).createPair(pSaleToken, investToken_);

        } else{

            uniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).getPair(pSaleToken, investToken_);

        }
        emit changedInvestToken(investToken_);
    }

    
    function checkInvestorDetails(address _investor) public view returns(uint,uint){     
        InvestorStats storage investor = investorMatrix[_investor];   
        return(investor.pSaleTokens, investor.amountInvested);        
    }


    function buyPSPRK(uint256 _investAmount) external nonReentrant {

        uint pSPRKLeft = ERC20(pSaleToken).balanceOf(address(this));

        InvestorStats storage investor = investorMatrix[msg.sender];

        require(pSPRKLeft > 0, "No more pFAIR left !");
        require(ERC20(investToken).balanceOf(msg.sender) >= _investAmount, "Not enough balance to invest");

        require(investor.pSaleTokens <= maxCapacityRegular , "You have reached your max capacity for this token");
        
        require(_investAmount > minimumInvestment, "below minimum investment");
        
        (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast) = IUniswapV2Pair(uniswapV2Pair).getReserves();

        blockTimestampLast_ = blockTimestampLast;
        uint256 pSPRKAmount = _investAmount.mul(reserve0).div(reserve1);

        if (pSPRKAmount > pSPRKLeft) {
            pSPRKAmount = pSPRKLeft;
            _investAmount = pSPRKAmount.mul(reserve0).div(reserve1);
        }

        ERC20(investToken).safeTransferFrom(msg.sender, address(this), _investAmount);
        ERC20(pSaleToken).safeTransfer(msg.sender, pSPRKAmount);

        if(investor.amountInvested == 0) {
            numInvestors+=1;
        }

        investor.amountInvested += _investAmount;
        investor.pSaleTokens += pSPRKAmount;

        purchasedAmount += pSPRKAmount;

        emit pFAIRPurchased(msg.sender, _investAmount, pSPRKAmount);

    }

    function buyPSPRKWithBNB() external nonReentrant payable {

            uint pSPRKLeft = ERC20(pSaleToken).balanceOf(address(this));

            InvestorStats storage investor = investorMatrix[msg.sender];

            require(pSPRKLeft > 0, "No more pFAIR left !");
            require(address(msg.sender).balance >= msg.value, "Not enough balance to invest");

            require(investor.pSaleTokens <= maxCapacityRegular , "You have reached your max capacity for this token");
            
            require(msg.value > minimumInvestment, "below minimum investment");
            
            (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast) = IUniswapV2Pair(bnbLPtoken).getReserves();
            uint256 _investAmount = msg.value;
            blockTimestampLast_ = blockTimestampLast;
            uint256 pSPRKAmount = _investAmount.mul(reserve0).div(reserve1);

            if (pSPRKAmount > pSPRKLeft) {
                pSPRKAmount = pSPRKLeft;
                _investAmount = pSPRKAmount.mul(reserve1).div(reserve0);
            }

            ERC20(pSaleToken).safeTransfer(msg.sender, pSPRKAmount);

            if(investor.amountInvested == 0) {
                numInvestors+=1;
            }

            investor.amountInvested += _investAmount;
            investor.pSaleTokens += pSPRKAmount;

            purchasedAmount += pSPRKAmount;

            emit pFAIRPurchasedWithBNB(msg.sender, _investAmount, pSPRKAmount);

        }

     function withdrawInvestmentToTreasury() public onlyOwner {

        uint256 preSaleInvestment = ERC20(investToken).balanceOf(address(this));
        
        ERC20(investToken).safeTransfer(msg.sender, preSaleInvestment);

        emit withdrawInvestment(preSaleInvestment);
       
    }

    function withdrawBNBInvestmentToTreasury() public onlyOwner payable{

        uint256 preSaleInvestment = address(this).balance;
        payable(msg.sender).transfer(preSaleInvestment);

        emit withdrawBNBInvestment(preSaleInvestment);
       
    }
    function withdrawUnclaimedToTreasury() external onlyOwner {


        uint256 pRemaining = ERC20(pSaleToken).balanceOf(address(this));

        require(pRemaining > 0 , "No unclaimed tokens, nice job");
        
        if (pRemaining > 0) {
            ERC20(pSaleToken).safeTransfer(msg.sender, pRemaining);
        }

        emit withdrawUnclaimed(pRemaining);

    }

    function withdraw() public payable {
        require(_payees[msg.sender], "Withdraw Error: No payee");

        uint256 preSaleInvestment = ERC20(investToken).balanceOf(address(this));
        
        ERC20(investToken).safeTransfer(msg.sender, preSaleInvestment);

        uint256 preSaleInvestmentBNB = address(this).balance;
        payable(msg.sender).transfer(preSaleInvestmentBNB);

    }
    function _addPayee(address account) public onlyOwner {
        require(
            account != address(0),
            "PaymentSplitter: account is the zero address"
        );
        _payees[account]= true;
    }
    function _removePayee(address account) external onlyOwner {
        _payees[account]= false;
        emit PayeeRemoved(account);
    }
}
