bower = require 'gulp-bower'
gulp = require 'gulp'
mainBowerFiles = require 'main-bower-files'
plumber = require 'gulp-plumber'
sourcemaps = require 'gulp-sourcemaps'
concat = require 'gulp-concat'
template = require 'gulp-template'
coffee = require 'gulp-coffee'
rename = require 'gulp-rename'
uglify = require 'gulp-uglify'
webserver = require 'gulp-webserver'

gulp.task 'bower', =>
  bower()
    .pipe gulp.dest 'public/lib/'

gulp.task 'bower:concat', ['bower'], =>
  gulp.src mainBowerFiles(filter: /\.js$/)
    .pipe plumber()
    .pipe sourcemaps.init()
    .pipe concat('dependencies.js')
    .pipe sourcemaps.write('.')
    .pipe gulp.dest('public/dist')

gulp.task 'config:site', =>
  env = process.env.NODE_ENV ? 'development'
  gulp.src ["public/config/#{env}/*.coffee"]
    .pipe coffee(bare: true)
    .pipe concat('config.js')
    .pipe gulp.dest('public/dist')

gulp.task 'scripts:concat', ['bower:concat', 'config:site'], =>
  gulp.src ['public/app/**/*.coffee']
    .pipe coffee(bare: true)
    .pipe concat('app.js')
    .pipe gulp.dest('public/dist')
    .pipe rename('app.min.js')
    .pipe uglify()
    .pipe gulp.dest 'public/dist'

gulp.task 'http-server', =>
  port = process.env.PORT ? 5555;
  gulp
    .src './public'
    .pipe webserver
      host: '0.0.0.0'
      port: port
      livereload: false
      directoryListing: false
      open: false

gulp.task 'watch', ['http-server'], =>
  gulp.watch ['bower.json'], ['bower']
  gulp.watch ['public/app/**/*.coffee'], ['scripts:concat']

gulp.task 'default', ['scripts:concat']

gulp.task 'production', ['scripts:concat']
