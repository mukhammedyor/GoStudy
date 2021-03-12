const http = require('http')
const { ApolloServer } = require('apollo-server-express')
const express = require('express')
const app = express()
const PORT = process.env.PORT || 4000 

// import modules
const modules = require('./modules')
const server = new ApolloServer({ modules, })

// create server
const httpServer = http.createServer(app)
server.applyMiddleware({ app, path: '/graphql'})

httpServer.listen({ port: PORT }, () => {
	console.log(`server ready at: ${PORT}` + server.graphqlPath)
})
