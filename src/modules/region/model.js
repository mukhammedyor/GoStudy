const { fetch, fetchAll } = require('../../lib/postgres.js')

const select = `
	select * from regions 
`
const stateregion = `
	select * from regions where state_id = $1
`
const createregion = `
	INSERT INTO regions (region_name, state_id) VALUES ($1, $2) RETURNING *
`
const deleteregion = `
	DELETE FROM regions WHERE region_id = $1 RETURNING *
`
const selectall = () =>{
	return fetchAll(select)
}

const stateRegions = (state_id) => {
	return fetchAll(stateregion, state_id)
}

const createRegion = (region_name, state_id) => {
	return fetchAll(createregion, region_name, state_id)
}

const deleteRegion = (region_id) => {
	return fetchAll(deleteregion, region_id)
}

module.exports = {
	selectall,
	stateRegions,
	createRegion,
	deleteRegion
}