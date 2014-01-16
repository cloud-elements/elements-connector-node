Cloud Elements Connector (node.js)
==================================

This is the connector library for Cloud Elements in javascript.
You can install it into your application like this:

    npm install cloudelements

And use it in your code like this:

    var ce = require('cloudelements');
    var client = new ce.Client('http://my:/url.to/elements/api-v1');
    var token = 'my1234token'
    client.request('get', 'document', token, 'ping', function(ping) {
      console.log('ping: ', ping);
    });
