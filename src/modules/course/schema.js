const { gql } = require('apollo-server-express')

module.exports = gql `

	extend type Query {
		courses: [Courses!]!
		eduCourses(education_id: ID!): [Courses!]!
		
	}

	type Courses {
		course_id: ID!
		course_name: String!
		education_id: ID!
	}
	extend type Mutation {
		createCourse(course_name: String! education_id: ID!): Courses!
		deleteCourse(course_id: ID!): Courses!
	}
`