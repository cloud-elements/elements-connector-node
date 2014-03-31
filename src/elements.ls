# elements.js Copyright (c) 2013 Cloud Elements.  All rights reserved.
# CLOUD-ELEMENTS PROPRIETARY / CONFIDENTIAL. Use is subject to license
# terms.
# 
# Created on 1/1/7 by Charlie Ozinga.

require! https

# this client doesn't handle multipart/form data yet
exports.Client = class Client
  (@api-endpoint = 'https://console.cloud-elements.com/elements/api-v1') ->
    @headers = {}

  request: (method, provider, token, api, cb, params = {},
            files = null, version = '1', headers = {}) ->
    theurl = "#{@api-endpoint}/#{provider}/#{version}/#{api}" +
      url.format query: params
    options = url.parse(theurl) <<<
      {method, headers: {} <<< @headers <<< Authorization: "Element #token"}

    output = ""
    req = https.request options, (res) ->
      res.on \readable -> output += res.read!
      res.on \end -> cb? JSON.parse output
      res.on \error -> console.warn "response error: #{it.message}"
    req.on \error -> console.warn "request error: #{it.message}"
    
    if (options.method in [\post \put])
      req.write JSON.stringify params

    req.end!

require! url

# this client doesn't handle multipart/form data yet
exports.Client = class Client
  (@api-endpoint = 'https://console.cloud-elements.com/elements/api-v1') ->
    @headers = {}

  request: (method, provider, token, api, cb, params = {},
            files = null, version = '1', headers = {}) ->
    theurl = "#{@api-endpoint}/#{provider}/#{version}/#{api}" +
      url.format query: params
    options = url.parse(theurl) <<<
      {method, headers: {} <<< @headers <<< Authorization: "Element #token"}

    output = ""
    req = https.request options, (res) ->
      res.on \readable -> output += res.read!
      res.on \end -> cb? JSON.parse output
      res.on \error -> console.warn "response error: #{it.message}"
    req.on \error -> console.warn "request error: #{it.message}"
    
    if (options.method in [\post \put])
      req.write JSON.stringify params

    req.end!
