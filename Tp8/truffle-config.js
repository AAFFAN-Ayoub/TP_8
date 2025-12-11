module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",  // Localhost (default: none)
      port: 7545,   // Standard Ethereum port (default: none)
      network_id: "*",  // Any network (default: none)
    },
  },
  contracts_build_directory: "./src/artifacts/", // Important pour Flutter [8]
  compilers: {
    solc: {
      optimizer: {
        enabled: false,
        runs: 200
      },
      version: "0.5.9", // Configurez la version du compilateur Solidity [10]
      evmVersion: "byzantium"
    }
  }
};