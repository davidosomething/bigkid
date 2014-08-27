module.exports = (grunt) ->

################################################################################
# Browserify shimming

  _ = require('lodash')

  libs = require('./config/browserify-shim.coffee')

  getBrowserifyAlias = (name)->
    return libs[name].path + ':' + name

  getBrowserifyLibs = (libs)->
    return _.keys(libs)

  getBrowserifyAliases = (libs)->
    aliases = _.reduce(libs, (aliasesArray, path, name)->
      aliasesArray.push getBrowserifyAlias(name)
      return aliasesArray
    , [])

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

################################################################################
# CoffeeScript through browserify
#
# The "extensions" browserifyOption has to exist for each task
# doesn't inherit from parent options


    browserify:
      options:
        transform: [ 'coffeeify' ]
      lib:
        options:
          # use this since we use bower instead of NPM for components
          # alphabetically
          alias: getBrowserifyAliases(libs)
          browserifyOptions:
            debug: false
            extensions: [ '.coffee', '.js', '.json' ]
            # these don't depend on other modules so don't look, faster
            noparse: [ 'jquery' ]
          external: null
        files:
          'dist/app/lib.js': [ '.' ]
      app:
        options:
          browserifyOptions:
            debug: true
            extensions: [ '.coffee', '.js', '.json' ]
          # use things in lib
          external: getBrowserifyLibs(libs)
        files:
          'dist/app/app.js': [ 'app/**/*.coffee' ]


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

    shell:
      prebuild:
        command: [
          'npm prune'
        ].join('&&')

################################################################################

  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-coveralls'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-shell'

################################################################################

  grunt.registerTask 'test', [
    'coffeelint'
    'karma'
  ]

  grunt.registerTask 'build', [
    'shell:prebuild'
    'browserify:lib'
    'browserify:app'
  ]

  grunt.registerTask 'default', [
    'test'
    'build'
  ]

