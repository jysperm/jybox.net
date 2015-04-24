fs = require 'fs'
del = require 'del'
ssh = require 'gulp-ssh'
gulp = require 'gulp'
util = require 'gulp-util'
less = require 'gulp-less'
debug = require 'gulp-debug'
order = require 'gulp-order'
rsync = require 'gulp-rsync'
coffee = require 'gulp-coffee'
filter = require 'gulp-filter'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
minifyCss = require 'gulp-minify-css'
bowerFiles = require 'main-bower-files'

gulp.task 'clean', ->
  del 'public/*'

gulp.task 'vendor:styles', ['clean'], ->
  gulp.src bowerFiles()
  .pipe filter '*.css'
  .pipe concat 'vendor.css'
  .pipe minifyCss()
  .pipe gulp.dest 'public/vendor'

gulp.task 'vendor:scripts', ['clean'], ->
  gulp.src bowerFiles()
  .pipe filter '*.js'
  .pipe order ['jquery.js', '*']
  .pipe concat 'vendor.js'
  .pipe uglify()
  .pipe gulp.dest 'public/vendor'

gulp.task 'vendor:fonts', ['clean'], ->
  gulp.src bowerFiles()
  .pipe filter ['*.eot', '*.svg', '*.ttf', '*.woff']
  .pipe gulp.dest 'public/fonts'

gulp.task 'build:vendor', ['vendor:styles', 'vendor:scripts', 'vendor:fonts']

gulp.task 'build:styles', ->
  gulp.src 'static/**/*.less'
  .pipe less()
  .pipe concat 'styles.css'
  .pipe minifyCss()
  .pipe gulp.dest 'public'

gulp.task 'build:scripts', ->
  gulp.src 'static/**/*.coffee'
  .pipe coffee()
  .pipe concat 'scripts.js'
  .pipe uglify()
  .pipe gulp.dest 'public'

gulp.task 'build', ['build:vendor', 'build:styles', 'build:scripts']

gulp.task 'deploy:upload', ['build'], ->
  gulp.src ['**', '!node_modules/**', '!bower_components/**']
  .pipe rsync
    username: 'jybox'
    hostname: 'spawn.rpvhost.net'
    destination: '/home/jybox/jybox.net'

gulp.task 'deploy:install', ['deploy:upload'], ->
  ssh
    sshConfig:
      host: 'spawn.rpvhost.net'
      username: 'jybox'
      privateKey: fs.readFileSync process.env['HOME'] + '/.ssh/id_rsa'
  .shell [
    'cd ~/jybox.net'
    'npm install --production'
    'fuser -k -n tcp 15624'
  ]

gulp.task 'deploy', ['deploy:install']
