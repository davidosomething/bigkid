Parent = require('./parent.coffee')

class Child extends Parent

  run: ->
    super
    console.log('CHILD RUN')
    return @

module.exports = Child
