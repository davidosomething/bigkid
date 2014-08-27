module.exports = ->

  @loadNpmTasks 'grunt-browserify'

  ############################################################################
  # CoffeeScript through browserify

  #
  # Browserify shimming
  #
  _ = require('lodash')
  libs = require('../browserify-shim.coffee')

  getBrowserifyAlias = (name)->
    return libs[name].path + ':' + name

  getBrowserifyLibs = (libs)->
    return _.keys(libs)

  getBrowserifyAliases = (libs)->
    aliases = _.reduce(libs, (aliasesArray, path, name)->
      aliasesArray.push getBrowserifyAlias(name)
      return aliasesArray
    , [])

  #
  # Config
  #
  # The "extensions" browserifyOption has to exist for each task
  # doesn't inherit from parent options
  @config 'browserify',
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

