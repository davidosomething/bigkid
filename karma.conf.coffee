module.exports = (config)->
  config.set
    basePath: ''

    frameworks: ['mocha', 'chai']

    files: [
      'bower_components/commonjs-require-definition/require.js'
      'app/**/*.coffee'
      'spec/**/*.coffee'
    ]

    preprocessors:
      'app/**/*.coffee':  ['commonjs', 'coverage']
      'spec/**/*.coffee': ['coffee']

    commonjsPreprocessor:
      options:
        isCoffeeScript: true

    reporters: ['spec', 'coverage']

    coverageReporter:
      type:   'html'
      dir:    'reports'
      subdir: 'coverage'

    port:      9876
    colors:    true
    logLevel:  config.LOG_INFO
    autoWatch: true
    browsers:  ['PhantomJS']
    singleRun: true
