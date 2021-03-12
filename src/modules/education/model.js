const { fetch, fetchAll } = require('../../lib/postgres.js')

const select = `
	select * from educationCenters
`
const regionedu = `
	select * from educationCenters where region_id = $1
`

const createeducation = `
	INSERT INTO educationCenters (edu_name, address, region_id) VALUES ($1, $2, $3) RETURNING * 
`

const deleteeducation = `
	DELETE FROM educationCenters WHERE education_id = $1 RETURNING *
`

const allEducations = () => {
	return fetchAll(select)
}

const regionEducation = (region_id) => {
	return fetchAll(regionedu, region_id)
}

const createEducation = (edu_name, address, region_id) => {
	return fetch(createeducation, edu_name, address, region_id)
}

const deleteEducation = (education_id) => {
	return fetch(deleteeducation, education_id)
}


module.exports = {
	allEducations,
	regionEducation,
	createEducation,
	deleteEducation
}