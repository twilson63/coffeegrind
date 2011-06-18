class Sessions
  constructor: (db) ->
    db.bind 'users'
    @users = db.users
  extends: (mate) ->
    # Setup Authentication middleware
    mate.use (req, resp, next) ->
      app_url = req.url.match /projects|users/
      if app_url? and not req.session.authenticated?
        resp.writeHead 401, 'Content-Type': 'text'
        resp.end '401 - Not Authorized'
      else
        next()

    # Manage Authentication Request
    mate
      # sessions
      .post '/sessions', ->
        # bcrypt password
        @users.findOne username: @req.body.user, password: bcrypt.hash, (err, user) ->
          if err?
            @resp.writeHead 401, 'Content-Type': 'text'
            @resp.end '401 Authorization Denied'
          else
            @req.session.authenticated = true
            @send_text 'ok'

module.exports = Sessions

