module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    browserify:
      dist:
        files:
          'build/app.js': [ 'app/app.coffee' ]
      options:
        transform: ['coffeeify']

    coffee:
      options:
        bare: true
      compile:
        expand: true
        cwd: 'app'
        src: [ '*.coffee' ]
        dest: 'test/app/'
        ext: '.js'

    karma:
      test:
        configFile: 'karma.conf.coffee'

  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-karma'

  grunt.registerTask 'test', [
    'karma'
  ]

  grunt.registerTask 'build', [
    'browserify'
  ]
