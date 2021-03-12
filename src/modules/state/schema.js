const { gql } = require('apollo-server-express')

module.exports = gql `
	extend type Query {
		states: [States!]!
	}

	type States {
		state_id: ID!
		state_name: String!
	}

	extend type Mutation {
		createState(state_name: String!): States!
		deleteState(state_id: ID!): States!
	}

`