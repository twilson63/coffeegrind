mate = require 'coffeemate'

# Add Helpers
require('./helpers')
require('./config')

# Build Assets
require('./assets')

# Projects controller
require('./projects')

# Get Markup
mate.get '/', -> @eco 'index'

mate.listen 3000
