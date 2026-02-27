// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {AggregatorV3Interface} 
from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

/**
 * Example contract to get ETH/USD price on Sepolia
 */
contract EthPriceConsumer {
    AggregatorV3Interface internal dataFeed;

    /**
     * Network: Sepolia
     * Aggregator: ETH/USD
     * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     */
    constructor() {
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

    /**
     * Returns latest ETH price in USD
     */
    function getLatestPrice() public view returns (int256) {
        (
            ,
            int256 price,
            ,
            ,
            
        ) = dataFeed.latestRoundData();
        return price;
    }
}