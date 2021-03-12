const States = require('./model')

module.exports = {
	Query: {
		states: async () => {
			return await States.selectStates()
		}
	},

	Mutation: {
		oneState: async (_, { state_id }) => {
			return await States.oneState(state_id)
		},
		createState: async (_, {state_name}) => {
			return await States.createState(state_name)
		},
		deleteState: async (_, {state_id}) => {
			return await States.removeState(state_id)
		}
	}
}

