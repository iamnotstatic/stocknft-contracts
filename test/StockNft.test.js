const StockNft = artifacts.require('StockNft');

contract("Stock NFT", async (accounts) => {

    beforeEach(async () => {
        this.contract = await StockNft.new();
    });

    describe("constructor test", async () => {
        it("name should be set in constructor", async () => {
            let name = await this.contract.name.call();
            assert.notEqual(name, '');
        });

        it("symbol should be set in constructor", async () => {
            let symbol = await this.contract.symbol.call();
            assert.notEqual(symbol, '');
        });
    });
}); 