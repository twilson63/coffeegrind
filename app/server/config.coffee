class Config
  extends: (mate) ->
    mate.options.renderDir = 'app/server/views'
    mate.options.renderExt = '.eco'
    mate.context.eco = (tmpl) ->
      @view = tmpl
      @render 'layout'
    
    mate.static __dirname + '/public'


module.exports = new Config
