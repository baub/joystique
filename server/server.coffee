sys:  require 'sys'
http: require 'http'
ws:   require 'websocket-server'

httpServer: http.createServer()
server: ws.createServer({ debug: false }, httpServer)

server.on 'listening', -> log 'Listening for connections'

server.on 'connection', (connection) ->
  connection.on 'message', (message) ->
    motion: JSON.parse(message)
    sys.print "\r$motion.rotation.pitch\t$motion.rotation.yaw\t$motion.rotation.roll"

server.listen 10000