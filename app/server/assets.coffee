stitch = require('stitch')

package = stitch.createPackage 
  paths: [__dirname + '/../client']

class Assets
  extends: (mate) ->
    # Get Javascript
    mate.get '/application.js', -> 
      # Use Stich to return one app.js file
      package.compile (err, source) =>
        @resp.end source
module.exports = new Assets

