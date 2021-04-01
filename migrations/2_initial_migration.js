const StockNft = artifacts.require('StockNft');

module.exports = (deployer) => {
  deployer.deploy(StockNft);
};
