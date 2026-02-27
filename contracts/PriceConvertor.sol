// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
library PriceConvertor{
    function getprice() internal view returns (uint256) {
        // Sepolia ETH/USD price feed
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // Convert 8 decimals → 18 decimals
        return uint256(price) * 1e10;
    }
    function conversionrate(uint256 ethAmount)internal view returns (uint256){
        uint256 ethPrice = getprice();
        uint256 ethInUsd = (ethPrice * ethAmount) / 1e18;
        return ethInUsd;
    }
    function getVersion() internal view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}