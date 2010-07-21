Joystique
=========

Joystique captures iPhone 4 sensor data for visualization in the browser via CSS3, HTML5 & WebGL using a minimalistic JS library.
It consists of three parts:

- **iphone_app**: iPhone 4 app for capturing and transmitting various sensor data
- **server**: An intermediate node.js WebSockets server which forwards the iPhone’s data to connected browsers
- **js**: Minimalistic JS library for handling motion events via HTML5 WebSockets

Compiling the iPhone app
------------------------

The app expects the ZIMT library to be in iphone_app/vendor/zimt.
Get it as a git submodule:

    git submodule update --init

Running the server
------------------

The server has the following dependencies:

- node.js >= 0.1.100
- websocket 1.0.0

Possible features
-----------------

- Replace address text field with Bonjour-driven dropdown
- Add more sensors

Authors
-------

- Sebastian Deutsch (@sippndipp)
- Stephan Seidt (@evilhackerdude)