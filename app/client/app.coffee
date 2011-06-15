class App
  load_views: ->
    #load views
    require('./login')

  constructor: ->
    # init application
    #$ = jQuery
    jQuery.mobile.ajaxEnabled = false


module.exports = new App

