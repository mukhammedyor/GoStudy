const { gql } = require('apollo-server-express')

module.exports = gql `

	extend type Query {
		educationCenters: [EducationCenters!]!
		regionEducation(region_id: ID!): [EducationCenters!]!
	}

	type EducationCenters {
		education_id: ID!
		edu_name: String!
		address: String!
		region_id: ID!
	}
	extend type Mutation {
		createEducation(edu_name: String! address: String! region_id: ID!): EducationCenters!
		deleteEducation(education_id: ID!): EducationCenters!
	}
`
