const EducationCenters = require('./model')

module.exports = {
	Query: {
		educationCenters: async () => {
			return await EducationCenters.allEducations()
		},
		regionEducation: async (_, {region_id}) => {
			return EducationCenters.regionEducation(region_id)
		}
	},
	Mutation: {
		
		createEducation: async (_, {edu_name, address, region_id}) => {
			return await EducationCenters.createEducation(edu_name, address, region_id)
		},
		deleteEducation: async (_, {education_id}) => {
			return await EducationCenters.deleteEducation(education_id)
		}
	}
}