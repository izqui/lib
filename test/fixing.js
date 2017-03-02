const BrokenContract = artifacts.require("./fixing/BrokenContract.sol")
const Fixer = artifacts.require("./fixing/Fixer.sol")

contract('BrokenContract', () => {
  describe('test', () => {
    it('fixes', () => {
      return BrokenContract.new()
        .then(c => {
          contract = c
          return contract.broken()
        })
        .then(broken => {
          assert.equal(broken, true)
          return Fixer.new()
        })
        .then(fixer => contract.execute(fixer.address))
        .then(() => contract.broken())
        .then(broken => assert.equal(broken, false))
    })
  })
})
