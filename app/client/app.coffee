console.log 'hello x'
$(document).bind 'mobileinit', ->
  $.mobile.ajaxEnabled = false
  console.log 'hello world'
