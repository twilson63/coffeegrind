# # Projects Controller
# This controller manages traffic between the datastore
# and the client and views.
#
# It is a pure json restful interface.
#
class Projects
  init_helpers: ->
    # helper methods to simplify the code in the web application.
    @projects.update_attributes = (id, data, callback) ->
      # Would like to convert to find and modify to support
      # atomic operations.
      @findById id, (err, project) =>
        [project.name, project.description, project.owner] = [data.name, data.description, data.owner]
        @updateById project._id, project, (err) ->
          callback project

    @projects.add_status = (id, status, callback) ->
      # Would like to support atomic operations
      @findById id, (err, project) =>
        project.statuses ?= []
        status.id = project.statuses.length + 1
        project.statuses.unshift status
        @updateById project._id, project, (err) ->
          callback project


  # Pass db Connection and bind to projects datastore
  constructor: (db) -> 
    db.bind 'projects'
    @projects = db.projects

  extends: (mate) ->
    mate
      # Get the projects in json
      .get '/projects', ->
        @projects.find(active: true).toArray (err, projects) =>
          @send_json projects

      # Create a new project via json
       .post '/projects', ->
        project = @req.body
        project.name = project.name.split(' ').join('-').toLowerCase()
        project.active = true
        @projects.insert project, (err) =>
          @send_json project

      .put '/projects/:id', ->
        @projects.update_attributes @req.params.id, @req.body, (project) =>
          @send_json project

      .post '/projects/:id/statuses', ->
        @projects.findById @req.params.id, (err, project) =>
          @projects.add_status @req.params.id, @req.body, (project) =>
            @send_json project


module.exports = Projects

