jsdom = require 'jsdom'
fermata = require 'fermata'
api = fermata.api url: 'http://localhost:3000'

jquery = 'http://code.jquery.com/jquery-1.6.1.min.js'
# start app on port 3000
require '../../app/server/app'

describe 'app', ->
  it 'GET /application.js', ->
    api['application.js'].get (err, results) ->
      console.log results
      asyncSpecDone()
    asyncSpecWait()


#   it 'GET /', ->
#     api.get (err, result) ->
#       jsdom.env result, [ jquery ], (err, window) ->
#         expect(window.$('h1').text()).toEqual('Hello World')
#         asyncSpecDone()

#     asyncSpecWait()
