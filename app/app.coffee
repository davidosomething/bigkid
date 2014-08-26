Child = require('./child')
window.app ||= {}
app.c = new Child()
app.c.run()
