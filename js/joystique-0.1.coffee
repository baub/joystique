window['Joystique']: class Joystique
  
  constructor: (address) ->
    this.connect(address)
  
  connect: (address) ->
    @websocket: new WebSocket(address)
    this.bind()
    return
  
  bind: ->
    @handlers: { motion: [] }
    
    @websocket.onmessage: (message) =>
      motion: JSON.parse message.data
      for handler in @handlers.motion
        handler motion
    
    return
  
  on: (eventName, handler) ->
    @handlers[eventName].push handler