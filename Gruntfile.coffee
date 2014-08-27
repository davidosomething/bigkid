module.exports = ->

  @loadTasks 'config/grunt'

  @registerTask 'test', [
    'coffeelint'
    'karma'
  ]

  @registerTask 'build', [
    'shell:prebuild'
    'browserify:lib'
    'browserify:app'
  ]

  @registerTask 'default', [
    'test'
    'build'
  ]

