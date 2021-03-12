const stateModules = require('./state/index.js')
const regionModules = require('./region/index.js')
const subjectModules = require('./course/index.js')
const educationModules = require('./education/index.js')

module.exports = [
	stateModules,
	regionModules,
	subjectModules,
	educationModules
]