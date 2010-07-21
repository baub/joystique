Joystique
=========

Joystique captures iPhone 4 sensor data for visualization in the browser via CSS3, HTML5 & WebGL using a minimalistic JS library.
It consists of three parts:

- **iphone_app**: iPhone 4 app for capturing and transmitting various sensor data
- **server**: An intermediate node.js WebSockets server which forwards the iPhone’s data to connected browsers
- **js**: Minimalistic JS library for handling motion events via HTML5 WebSockets

Actually there’s a fourth part.

- **demos**: That’s where the fun is! Demos use the js library to do all kinds of visualizations stuff

Quick Start
-----------

There are three steps involved in getting the app to work:

1. Start the server (see “Running the Server”)
2. Compile and run the iPhone app on an iPhone 4 (see “Compiling the iPhone app”) and connect to your server
3. Open a demo and play with your fancy new Joystique!

Running the server
------------------

The server needs the following to be installed:

- node.js >= 0.1.100
- websocket 1.0.0

Once everything is installed start the server:

    node server.js

Compiling the iPhone app
------------------------

Before you can compile & run the app the ZIMT library needs to be put into iphone_app/Vendor/zimt.
We made it easy. Get it as a git submodule:

    git submodule update --init

Possible features
-----------------

- Submit app to AppStore so not only certified devs can deploy it to their iPhone 4
- Bonjour: Replace address text field with service discovery dropdown
- Sensors
 - Try approximating the local position by tracking userAcceleration rotated by attitude
 - Geographic position & heading via Core Location

Authors
-------

- Sebastian Deutsch (@sippndipp)
- Stephan Seidt (@evilhackerdude)