console.log('a')

Child = require('./child.coffee')

console.log('b')
window.app ||= {}

console.log(app)
console.log('c')
app.c = new Child()
app.c.run()
