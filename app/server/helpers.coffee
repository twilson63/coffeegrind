# #coffeemate jQM eco helpers
# These helpers provide short cuts to common html markup
# statements.
#

mate = require 'coffeemate'

mate.context.label = -> @util.tag 'label', arguments

mate.context.textField = ->
  [opts] = (o for o in arguments when typeof o is 'object') or [{}]
  opts.type = 'text'
  @util.tag('input', [opts]).replace(/><\/input>/, ' />')
  
mate.context.passwordField = ->
  [opts] = (o for o in arguments when typeof o is 'object') or [{}]
  opts.type = 'password'
  @util.tag('input', [opts]).replace(/><\/input>/, ' />')
 
mate.context.textArea = -> @util.tag 'textarea', arguments

mate.context.form = -> @util.tag 'form', arguments

mate.context.util =
  h: (txt) ->
    String(txt).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')
  attrs: (options) ->
    ' ' + ("#{n}='#{v}'" for n, v of options).join ' '
  tag: (name, opts) ->
    result = "<#{name}#{@attrs o for o in opts when typeof o is 'object'}>#{@h o for o in opts when typeof o is 'string'}#{o() for o in opts when typeof o is 'function'}</#{name}>"
