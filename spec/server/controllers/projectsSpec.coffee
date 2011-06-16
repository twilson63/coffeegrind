Projects = require('../../app/server/controllers/projects')
db = {}
mate = {}
projects = new Projects(db)
projects.extends(mate)

describe 'Projects Controller', ->
  it 'should list projects'
  it 'should create project'
  it 'should show project'
  it 'should edit project'
  it 'should add project status'
  
