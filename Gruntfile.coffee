module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

################################################################################

    browserify:
      dist:
        options:
          browserifyOptions:
            extensions: [ '.coffee' ]
        files:
          'dist/app.js': [ 'app/**/*.coffee' ]
      options:
        transform: ['coffeeify']

################################################################################

    coffeelint:
      tools:  ['Gruntfile.coffe', 'karma.conf.coffee']
      app:    ['app/**/*.coffee']
      spec:   ['spec/**/*.coffee']

################################################################################

    coveralls:
      karma:
        options:
          force: true
        src: 'reports/coverage/PhantomJS 1.9.7 (Linux)/lcov.info',

################################################################################

    karma:
      test:
        configFile: 'karma.conf.coffee'

################################################################################

  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-coveralls'
  grunt.loadNpmTasks 'grunt-karma'

################################################################################

  grunt.registerTask 'test', [
    'coffeelint'
    'karma'
  ]

  grunt.registerTask 'build', [
    'browserify'
  ]

  grunt.registerTask 'default', [
    'test'
    'build'
  ]

