const jwt = require('jsonwebtoken')
let privateKey = 'realapp@1'

const sign = (payload) => jwt.sign(payload, privateKey)
const verify = (token) => jwt.verify(token, privateKey)


module.exports = { sign, verify }