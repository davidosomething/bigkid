Parent = require('./parent')

class Child extends Parent

  run: ->
    super
    console.log('CHILD RUN')
    return @

module.exports = Child
