class Users
  constructor: (db) ->
    db.bind 'users'
    @users = db.users
  extends: (mate) ->
    mate
      .post '/users', ->
        if @req.session.isAdmin?
          enc = bcrypt @req.body.password
          user = 
            username: @req.body.username
            email: @req.body.email
            password_hash: enc.hash
            password_xxx: enc.xx
          @users.insert @req.body, (err, user) ->
            @send_json user
 
      .put '/users/:id', ->
        if @req.session.isAdmin? or @req.session._id is @req.params.id
          @users.findById @req.params._id, (err, user) ->
            [user.email, user.username] = [@req.body.email, @req.body.username]
            @users.updateById @req.params_id, user, (err, user) ->
              @send_json user

module.exports = Users

