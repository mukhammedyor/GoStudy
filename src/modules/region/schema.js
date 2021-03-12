const { gql } = require('apollo-server-express')

module.exports = gql `

	extend type Query {
		regions: [Regions!]!
		stateRegions(state_id: ID!): [Regions!]!
	}

	type Regions {
		region_id: ID!
		region_name: String!
		state_id: ID!
	}
	extend type Mutation {
		createRegion(region_name: String! state_id: ID!): [Regions!]!
		deleteRegion(region_id: ID!): [Regions!]!
	}
`