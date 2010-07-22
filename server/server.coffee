sys:  require 'sys'
http: require 'http'
ws:   require 'websocket-server'

httpServer: http.createServer()
server: ws.createServer({ debug: false }, httpServer)

clients: []

server.on 'listening', -> log 'Listening for connections'

server.on 'connection', (connection) ->

  sys.puts "New connection $connection.id"
  clients.push connection
  
  connection.on 'message', (message) ->
    for client in clients
      client.write message

server.on 'close', (connection) ->
  sys.puts "Connection closed $connection.id"

server.listen 10000