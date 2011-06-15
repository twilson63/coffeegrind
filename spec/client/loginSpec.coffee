#jsdom = require 'jsdom'
describe 'login view', ->
  it 'should be cool', ->
    events = []
    global.jQuery = ->
      live: (s, cb) ->
        events.push cb

    global.jQuery.mobile =
        changePage: (a,b) ->
          expect(a).toEqual('#home')
          expect(b).toEqual('slideup')

    require '../../app/client/login.coffee'
    expect(events.length).toEqual(2)
    expect(events[0]()).toBeDefined()
    expect(events[1]()).toEqual(false)

