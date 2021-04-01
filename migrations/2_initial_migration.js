const StockNft = artifacts.require('StockNft');

module.exports = (deployer) => {

  const name = "StockNft";
  const symbol = "STC";

  deployer.deploy(StockNft, name, symbol);
};
