module.exports = ->

  @loadNpmTasks 'grunt-coffeelint'
  @loadNpmTasks 'grunt-coveralls'
  @loadNpmTasks 'grunt-karma'
  @loadNpmTasks 'grunt-shell'

  ############################################################################

  @config 'coffeelint',
    tools:  ['Gruntfile.coffee', 'karma.conf.coffee']
    app:    ['app/**/*.coffee']
    spec:   ['spec/**/*.coffee']

  ############################################################################

  @config 'coveralls',
    karma:
      options:
        force: true
      src: 'reports/coverage/PhantomJS 1.9.7 (Linux)/lcov.info',

  ############################################################################

  @config 'karma',
    test:
      configFile: 'karma.conf.coffee'

  ############################################################################

  @config 'shell',
    prebuild:
      command: [
        'npm prune'
      ].join('&&')

