class Config
  extends: (mate) ->
    mate.options.renderDir = 'app/server/views'
    mate.options.renderExt = '.eco'
    mate.context.eco = (tmpl) ->
      @view = tmpl
      @render 'layout'

module.exports = new Config
