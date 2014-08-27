module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

################################################################################

    browserify:
      options:
        # use this since we use bower instead of NPM for components
        # alphabetically
        alias: [
          './bower_components/jquery/dist/jquery.js:jquery'
        ]
        transform: [ 'coffeeify' ]
      dist:
        options:
          browserifyOptions:
            extensions: [ '.coffee', '.js' ]
            debug: true
        files:
          'dist/app.js': [ 'app/**/*.coffee' ]

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

