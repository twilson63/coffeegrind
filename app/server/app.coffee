mate = require 'coffeemate'

# Add Helpers
require('./helpers').extends(mate.context)
require('./config').extends(mate)

# Get Markup
mate.get '/', -> @eco 'index'

# Build Assets
require('./assets').extends(mate)

# projects controller
require('./projects').extends(mate)


mate.listen 3000

