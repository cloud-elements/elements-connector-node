exports.Client = class Client
  (@api-endpoint = 'https://console.cloud-elements.com/elements/api-v1') ->
    @headers = {}

  request: (method, provider, token, api, params = null, files = null,
           version = '1', headers = {}) ->
    url = "#{@api-endpoint}/#{provider}/#{version}/#{api}"
    headers = headers with Authorization: "Element #{token}"
    
    switch method
    | \get => http.get-query @url, @headers, params
    | \post 
      if files?
        http.post-query @url, @headers,
        params with {[f, new File(f)] for f in files}
      else
        http.post-body @url, @headers, params
    | \put => http.put-body @url, @headers, params
    | \delete => http.delete @url, @headers, params

