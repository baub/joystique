http = require 'http'
io   = require 'socket.io'

server = http.createServer()
  
server.on 'clientMessage', (client, message) ->
  this.broadcast message, client

io.listen server
server.listen 10000
