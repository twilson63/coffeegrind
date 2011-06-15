class Projects
  extends: (mate) ->
    # Projects Service
    mate.get '/projects', ->
      @resp.end 'Under Construction'
    mate.post '/projects', ->
      @resp.end 'Under Construction'

module.exports = new Projects

