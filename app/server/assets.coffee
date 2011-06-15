stitch = require('stitch')

package = stitch.createPackage 
  paths: [__dirname + '/../client']
  dependencies: [
    __dirname + '/../../vendor/jquery.formparams.min.js'
    __dirname + '/../../vendor/handlebars.1.0.0.beta.3.js'
  ]

class Assets
  extends: (mate) ->
    # Get Javascript
    mate.get '/application.js', -> 
      # Use Stich to return one app.js file
      package.compile (err, source) =>
        @resp.writeHead 200, 'Content-Type': 'text/javascript'
        @resp.end source
module.exports = new Assets

