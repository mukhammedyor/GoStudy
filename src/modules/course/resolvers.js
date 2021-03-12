const Courses = require('./model')

module.exports = {
	Query: {
		courses: async () => {
			return await Courses.allCourses()
		},
		eduCourses: async (_, {education_id}) =>{
			return await Courses.eduCourses(education_id)
		}
	},
	Mutation: {
		
		
		createCourse: async (_, {course_name, education_id}) => {
			try {
				if (course_name && education_id) {
					return await Courses.createCourse(course_name, education_id)
				} else throw new Error('Invalid Input')
			}catch (error) {
				console.log(error)
				throw error
			}
		},
		deleteCourse: async (_, {course_id}) => {
			return await Courses.deleteCourse(course_id)
		}
	}
}