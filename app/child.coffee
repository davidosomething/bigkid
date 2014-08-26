Parent = require('./parent')

module.exports = class Child extends Parent

  walk: ->
    super

  run: ->
    console.log('CHILD RUN')
