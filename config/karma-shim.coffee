################################################################################
# Register shims into require object
# Maintain parity with config/shim.js and package.json's "browser" object
shims = {
  'jquery': '../bower_components/jquery/dist/jquery.js'
}
for shim, globalObject of shims
  require.register shim, (require, exports, module)->
    module.exports = globalObject

