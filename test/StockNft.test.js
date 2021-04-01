const StockNft = artifacts.require('StockNft');

const { expectThrow, expectEvent } = require('./helpers/utils');

contract('Stock NFT', async (accounts) => {
  const name = 'StockNft';
  const symbol = 'STC';

  beforeEach(async () => {
    this.contract = await StockNft.new(name, symbol);
  });

  describe('constructor test', async () => {
    it('name should be set in constructor', async () => {
      let name = await this.contract.name.call();
      assert.notEqual(name, '');
    });

    it('symbol should be set in constructor', async () => {
      let symbol = await this.contract.symbol.call();
      assert.notEqual(symbol, '');
    });
  });

  describe('mint test', async () => {
    it('should mint', async () => {
      const mint = this.contract.mint(accounts[0], { from: accounts[0] });
      await expectEvent(mint, "Transfer");
    });
  });
});
