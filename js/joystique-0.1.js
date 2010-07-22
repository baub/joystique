(function(){
  var Joystique;
  window['Joystique'] = (function() {
    Joystique = function(address) {
      this.connect(address);
      return this;
    };
    Joystique.prototype.connect = function(address) {
      this.websocket = new WebSocket(address);
      this.bind();
      return null;
    };
    Joystique.prototype.bind = function() {
      this.handlers = {
        motion: []
      };
      this.websocket.onmessage = (function(__this) {
        var __func = function(message) {
          var _a, _b, _c, _d, handler, motion;
          motion = JSON.parse(message.data);
          _a = []; _c = this.handlers.motion;
          for (_b = 0, _d = _c.length; _b < _d; _b++) {
            handler = _c[_b];
            _a.push(handler(motion));
          }
          return _a;
        };
        return (function() {
          return __func.apply(__this, arguments);
        });
      })(this);
      return null;
    };
    Joystique.prototype.on = function(eventName, handler) {
      return this.handlers[eventName].push(handler);
    };
    return Joystique;
  })();
})();
