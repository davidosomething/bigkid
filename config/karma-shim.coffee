# You probably don't need to edit this file.
# Edit config/browserify-shim.coffee to add external libs
browserifyShims = require('config/browserify-shim')
for shim, data of browserifyShims
  window.require.register shim, (require, exports, module)->
    module.exports = data.exports
