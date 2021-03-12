const { fetch, fetchAll } = require('../../lib/postgres.js')

const select = `
	select * from states
`
const anystate = `
	select * from states where state_id = $1
`
const create = `
	INSERT INTO states (state_name) VALUES ($1) RETURNING *
`
const delstate = `
	DELETE FROM states WHERE state_id = $1 RETURNING *
`
const selectStates = () => {
	return fetchAll(select)
}

const oneState = (state_id) => {
	return fetch(anystate, state_id)
}


const createState = (state_name) => {
	return fetch(create, state_name)
}
const removeState = (state_id) => {
	return fetch(delstate, state_id)
}


module.exports = {
	selectStates,
	oneState,
	createState,
	removeState
}