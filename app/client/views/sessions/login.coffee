class Login
  constructor: ->
    jQuery('#login').live 'pagebeforeshow', ->
      console.log 'pagebeforeshow called'
      true

    jQuery('#login form').live 'submit', ->
      console.log 'submit called'
      jQuery.mobile.changePage '#home', 'slideup'
      false

module.exports = new Login
