# # Config Web Application
# In this configuration class we are 
# setting the view folder and enabling
# middleware for the web application.
#
# We also create two extension:
#
# eco -> to render a consistent layout
#
# send_json -> that will send json back
# to the requesting client.

class Config
  extends: (mate) ->
    mate.options.renderDir = 'app/server/views'
    mate.options.renderExt = '.eco'

    mate.static __dirname + '/public'
    mate.cookieParser()
    mate.session secret: 'wilburwonderdog'
    mate.logger()
    mate.static __dirname + '/public'
    mate.bodyParser()

    mate.context.eco = (tmpl) ->
      @view = tmpl
      @render 'layout'

    mate.context.send_json = (data) ->
      @resp.writeHead 200, 'Content-Type': 'application/json'
      @resp.end JSON.stringify data

    mate.context.send_text = (data) ->
      @resp.writeHead 200, 'Content-Type': 'text/plain'
      @resp.end data




module.exports = new Config
