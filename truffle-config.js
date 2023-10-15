const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config();

module.exports = {
  networks: {
    development: {
      host: "ganache",
      port: 8545,
      network_id: "*",
      gas: 6700000,
      gasPrice: 20000000000,
      blockGasLimit: 10000000
    },
    mumbai_testnet: {
      provider: () => new HDWalletProvider(process.env.PRIVATE_KEY, process.env.API_URL),
      network_id: 80001,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    },
    polygon_mainnet: {
      provider: () => new HDWalletProvider(process.env.PRIVATE_KEY_POLYGON, process.env.API_URL_POLYGON),
      network_id: 137,
      confirmations: 4,
      timeoutBlocks: 300,
      skipDryRun: true,
      gasPrice: 140000000000,
      gas: 6721975
    }
  },
  compilers: {
    solc: {
      version: "0.8.18",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    },
  },
  plugins: [
    'truffle-plugin-verify'
  ],
  api_keys: {
    polygonscan: process.env.POLYGONSCAN_API_KEY
  },
  contracts_build_directory: './build/contracts',
};
