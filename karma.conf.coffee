'use strict'

module.exports = (config) =>
  config.set
    basePath: '.'
    frameworks: ['mocha', 'sinon-chai']
    files: [
      'public/dist/*'
    ]
    exclude: []
    colors: true
    port: 9876
    logLevel: config.LOG_DISABLE
    reporters: 'spec'
    autoWatch: true
    browsers: ['PhantomJS']
    captureTimeout: 60 * 1000
    singleRun: true
    coverageReporter:
      type: 'html',
      dir: 'test/coverage/'
    preprocessors:
      '**/*.html': 'ng-html2js'
      'test/public/**/*.coffee':  ['coffee']
      'public/**/*.coffee':  ['coffee']
    coffeePreprocessor:
      options:
        bare: false
        sourceMap: true
      transformPath: (path) =>
        return path.replace /\.coffee$/, '.js'
