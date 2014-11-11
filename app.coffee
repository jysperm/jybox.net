express = require 'express'
path = require 'path'
harp = require 'harp'

app = express()

app.set 'views', path.join(__dirname, 'view')
app.set 'view engine', 'jade'

app.use harp.mount './static'

app.get '/', (req, res) ->
  res.render 'index'

app.listen 15624
