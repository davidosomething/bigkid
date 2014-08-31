module.exports = ->

  @loadNpmTasks 'grunt-coffeelint'

  ############################################################################

  @config 'coffeelint',
    tools:  ['Gruntfile.coffee', 'karma.conf.coffee']
    app:    ['app/**/*.coffee']
    spec:   ['spec/**/*.coffee']

