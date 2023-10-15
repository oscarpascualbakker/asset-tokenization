const AssetTokenization = artifacts.require('AssetTokenization');

contract('AssetTokenization', (accounts) => {
    let assetTokenization;

    const initialSupply = 1000;
    const owner = accounts[0];
    const recipient = accounts[1];
    const spender = accounts[2];

    const assetId = 1;


    before(async () => {
        assetTokenization = await AssetTokenization.new(initialSupply);
    });


    it('should deploy the contract properly', async () => {
        assert(assetTokenization.address !== '');
    });


    it('should set the initial supply properly', async () => {
        const totalSupply = await assetTokenization.totalSupply();
        assert.equal(totalSupply, initialSupply * Math.pow(10, 6));
    });


    it('should assign the total supply to the owner', async () => {
        const balance = await assetTokenization.balanceOf(owner);
        assert.equal(balance, initialSupply * Math.pow(10, 6));
    });


    it('should transfer tokens between accounts', async () => {
        const amount = 100 * Math.pow(10, 6);
        await assetTokenization.transfer(recipient, amount, { from: owner });
        const balance = await assetTokenization.balanceOf(recipient);
        assert.equal(balance, amount);
    });


    it('should approve tokens for delegated transfer', async () => {
        const amount = 50 * Math.pow(10, 6);
        await assetTokenization.approve(spender, amount, { from: recipient });
        const allowance = await assetTokenization.allowance(recipient, spender);
        assert.equal(allowance, amount);
    });


    it('should perform delegated transfer', async () => {
        const amount = 50 * Math.pow(10, 6);
        await assetTokenization.transferFrom(recipient, owner, amount, { from: spender });
        const balance = await assetTokenization.balanceOf(recipient);
        assert.equal(balance, 50 * Math.pow(10, 6));
    });


    it('should register asset ownership', async () => {
        await assetTokenization.registerAsset(assetId, { from: owner });
        const assetOwner = await assetTokenization.assetOwners(assetId);
        assert.equal(assetOwner, owner);
    });


    it('should transfer asset ownership', async () => {
        await assetTokenization.transferAsset(assetId, recipient, { from: owner });
        const newAssetOwner = await assetTokenization.assetOwners(assetId);
        assert.equal(newAssetOwner, recipient);
    });


    it('should mint new tokens', async () => {
        const amount = 200 * Math.pow(10, 6);
        await assetTokenization.mint(200, { from: owner });
        const totalSupply = await assetTokenization.totalSupply();
        assert.equal(totalSupply, (initialSupply + 200) * Math.pow(10, 6));
    });

});
