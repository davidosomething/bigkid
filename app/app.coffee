$ = require('jquery') # see shims in test/shim.coffee and karma shim section
Child = require('./child')

window.app ||= {}
app.c = new Child()
app.c.run()
