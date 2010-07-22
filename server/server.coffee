sys:  require 'sys'
http: require 'http'
ws:   require 'websocket-server'

httpServer: http.createServer()
server: ws.createServer({ debug: false }, httpServer)

clients: []

server.on 'listening', -> console.log 'Listening for connections'

server.on 'connection', (connection) ->
  console.log "New connection $connection.id"
  clients.push connection
  
  connection.on 'message', (message) ->
    for client in clients
      client.write message

server.on 'close', (connection) -> console.log "Connection closed $connection.id"

server.listen 10000