const { fetch, fetchAll } = require('../../lib/postgres.js')

const select = `
	select * from courses
`

const createcourse = `
	INSERT INTO courses (course_name, education_id) VALUES ($1, $2) RETURNING *
`
const educourses = `
	select * from courses where education_id = $1
`

const deletecourse = `
	DELETE FROM courses WHERE course_id = $1 RETURNING *
`
const allCourses = () => {
	return fetchAll(select)
}

const createCourse = (course_name, education_id) => {
	return fetch(createcourse, course_name, education_id)
}

const eduCourses = (education_id) => {
	return fetchAll(educourses, education_id)
}

const deleteCourse = (course_id) => {
	return fetch(deletecourse, course_id)
}

module.exports = {
	allCourses,
	createCourse,
	eduCourses,
	deleteCourse

}