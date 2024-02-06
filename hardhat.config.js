require('dontenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: '0.8.20',
    defaultNetwork: 'sepolia',
    networks: {
      hardhat: {},
      sepolia: {
        url: '',
        accounts: [`0x${process.env.PRIVATE_KEY}`]
      }
    },

    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      }
    }
  },
};
