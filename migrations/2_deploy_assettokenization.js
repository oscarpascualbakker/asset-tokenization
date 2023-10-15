const AssetTokenization = artifacts.require("AssetTokenization");

module.exports = function (deployer) {
  // Deploy the contract with an initial supply of 1000 tokens.
  deployer.deploy(AssetTokenization, 1000);
};
