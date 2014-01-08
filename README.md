Cloud Elements Connector (Node.js)
==================================

This is the connector library for Cloud Elements in javascript
You can install it like this:

    npm install cloud-elements

And use it in your code like this:

    var client = new (require 'cloud-elements').Client;
    var ping = client.request('get', 'document', token, 'ping');

    console.log(JSON.stringify(ping));

See the `examples` directory for more examples.
