class App
  load_views: ->
    #load views
    require './views/sessions/login'
    require './views/projects/home'
    require './views/projects/edit'
    require './views/projects/new'
    require './views/statuses/new'
    require './views/users/new'


  constructor: ->
    # init application
    #$ = jQuery
    jQuery.mobile.ajaxEnabled = false


module.exports = new App

