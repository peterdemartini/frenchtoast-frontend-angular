'use strict'

module.exports = (config) =>
  config.set
    basePath: 'public'
    frameworks: ['mocha', 'sinon-chai']
    files: [
      'lib/angular/angular.js'
      'lib/angular-mocks/angular-mocks.js'
      'lib/angular-route/angular-route.js'
      'lib/angular-bootstrap/ui-bootstrap.js'
      'lib/lodash/lodash.js'
      'test/test_helper.coffee'
      'app/**/*.coffee'
      'test/app/**/*.coffee'
    ]
    exclude: []
    colors: true
    port: 9876
    logLevel: config.LOG_INFO
    reporters: 'spec'
    autoWatch: true
    browsers: ['PhantomJS']
    captureTimeout: 60 * 1000
    singleRun: false
    coverageReporter:
      type: 'html',
      dir: 'test/coverage/'
    preprocessors:
      '**/*.html': 'ng-html2js'
      'test/**/*.coffee':  ['coffee']
      'app/**/*.coffee':  ['coffee']
    coffeePreprocessor:
      options:
        bare: false
        sourceMap: true
      transformPath: (path) =>
        path.replace /\.coffee$/, '.js'
