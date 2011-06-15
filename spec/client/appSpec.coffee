describe 'app', ->
  it 'init', ->
    global.jQuery = require 'jquery'
    jQuery.mobile =
      ajaxEnabled: true

    app = require('../../app/client/app')
    spyOn(app, 'load_views').andReturn(true)
    expect(jQuery.mobile.ajaxEnabled).toEqual(false)
    app.load_views()
    expect(app.load_views).toHaveBeenCalled()


