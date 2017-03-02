const TheContract = artifacts.require('TheContract.sol')
const TheContractFactory = artifacts.require('TheContractFactory.sol')
const ExampleLib = artifacts.require('ExampleLib.sol')
const Basic = artifacts.require('Basic.sol')

module.exports = (deployer) => {
  deployer.deploy(ExampleLib)
    .then(() => ExampleLib.deployed())
    .then(e => TheContract.link('LibInterface', e.address))
    .then(() => TheContract.new())
    .then(tc => console.log('The contract:', tc.address))
    .then(() => TheContractFactory.new())
    .then(tf => {
      console.log('The factory: ', tf.address)
      fact = tf
      return fact.upload(Basic.binary)
    })
    /*
    .then(() => fact.deploy("Basic"))
    .then(x => {
      basic = x.logs[0].args.x
      console.log(basic)
      Basic.at(basic).Hello().watch(console.log)
    })
    */
}
