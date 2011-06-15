# #coffeemate jQM eco helpers
# These helpers provide short cuts to common html markup
# statements.
# 
class Helpers
  extends: (context) ->
    # ex <%- @label [for: 'foo'], -> 'bar' %>
    context.label = -> @util.tag 'label', arguments
    context.textField = ->
      [opts] = (o for o in arguments when typeof o is 'object') or [{}]
      opts.type = 'text'
      @util.tag('input', [opts]).replace(/><\/input>/, ' />')
    context.passwordField = ->
      [opts] = (o for o in arguments when typeof o is 'object') or [{}]
      opts.type = 'password'
      @util.tag('input', [opts]).replace(/><\/input>/, ' />')
 
    context.textArea = -> @util.tag 'textarea', arguments
    context.form = -> @util.tag 'form', arguments
    context.util =
      h: (txt) ->
        String(txt).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')
      attrs: (options) ->
        ' ' + ("#{n}='#{v}'" for n, v of options).join ' '
      tag: (name, opts) ->
        result = "<#{name}#{@attrs o for o in opts when typeof o is 'object'}>#{@h o for o in opts when typeof o is 'string'}#{o() for o in opts when typeof o is 'function'}</#{name}>"

module.exports = new Helpers
