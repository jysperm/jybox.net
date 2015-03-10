express = require 'express'
crypto = require 'crypto'
path = require 'path'
harp = require 'harp'
_ = require 'underscore'

app = express()

app.set 'views', path.join(__dirname, 'view')
app.set 'view engine', 'jade'

app.use '/bower_components', express.static './bower_components'
app.use harp.mount './static'

md5 = (message) ->
  return crypto.createHash('md5').update(message).digest('hex')

members = _.map require('./members'), (member) ->
  return _.extend member,
    avatar_url: do ->
      if member.avatar?.match /^http/
        return member.avatar
      else if member.avatar?.match /^[a-f0-9]{32}$/
        return "//cdn.v2ex.com/gravatar/#{member.avatar}"
      else if member.avatar
        return "//cdn.v2ex.com/gravatar/#{md5(member.avatar)}"
      else if member.email
        return "//cdn.v2ex.com/gravatar/#{md5(member.email)}"
      else
        return "//cdn.v2ex.com/gravatar"

    age: do ->
      if member.profile?.birthday
        Math.floor (Date.now() - member.profile.birthday.getTime()) / 365 / 24 / 3600 / 1000
      else
        return undefined

    blog_domain: member.blog?.match(/https?:\/\/([^/]+)/)[1]

    other_names: _.filter member.name, (name) ->
      return name != member.name.display

    skill_array: do ->
      return unless member.skill

      skill_array = []

      for k, v of member.skill
        skill_array.push
          name: k
          value: v
          per: (v * 100).toFixed()

      return skill_array.sort (a, b) ->
        return b.value - a.value

app.use (req, res, next) ->
  _.extend res.locals,
    members: members
    package: require './package'

  next()

app.get '/', (req, res) ->
  res.render 'index'

app.get '/members', (req, res) ->
  res.render 'members'

app.get '/history', (req, res) ->
  res.render 'history'

app.get '/qun', (req, res) ->
  res.render 'qun'

app.listen 15624
