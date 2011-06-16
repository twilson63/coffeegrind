Users = require('../../app/server/controllers/users')
db = {}
mate = {}
users = new Users(db)
users.extends(mate)

describe 'Users Controller', ->
  it 'should list users'
  it 'should create user'
  it 'should show user'
  it 'should edit user'
  it 'should add user'
 
