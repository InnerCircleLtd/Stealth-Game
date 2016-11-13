local path = (...):gsub('%.init$', '') .. "."

local states = {}

states.main = require (path..'game')
states.loading = require (path..'loading')
states.unloading = require (path..'unloading')

return states