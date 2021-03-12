const Regions = require('./model')

module.exports = {
	Query: {
		regions: async () => {
			return await Regions.selectall()
		},
		stateRegions: async (_,{state_id}) => {
			return await Regions.stateRegions(state_id)
		}
	},
	Mutation: {
		createRegion: async(_,{region_name, state_id}) => {
			try{
				if(region_name && state_id){
					return  await Regions.createRegion(region_name, state_id)
				}else throw new Error('Invalid Input')
			}catch (error){
				console.log(error)
				throw error
			}
		},
		deleteRegion: async(_, {region_id}) => {
			return await Regions.deleteRegion(region_id)
		},
	}
}
					