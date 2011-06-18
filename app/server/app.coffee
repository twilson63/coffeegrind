mate = require 'coffeemate'

# Add Helpers
require('./helpers').extends(mate.context)
require('./config').extends(mate)

# Get Markup
mate.get '/', -> @eco 'index'

# Build Assets
require('./assets').extends(mate)

# DB Connection
mongo = require 'mongoskin'
db = mongo.db(process.env.MONGODB_URL || 'localhost:27017/coffeegrind')

## Router
# This sections is the router section
# that routes all requests to the
# appropriate models.

Projects = require('./controllers/projects')
(new Projects db).extends(mate)

Users = require('./controllers/users')
(new Users db).extends(mate)

Sessions = require('./controllers/sessions')
(new Sessions db).extends(mate)


mate.listen 3000

