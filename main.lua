game = {}
GS = require "zz_lib.gamestate"
global = {}
global.g = 2
require 'ECS'
core.states = require 'states'
models = {}






function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    GS.registerEvents()
    GS.switch(core.states.main)
end


-- This one will only be used for debugging purposes, love.keyDown is used in most other cases
function love.keypressed(key)
    core.gamepad = nil
    if GS.current() ~= core.states.menu  and key == CONTROLS.PAUSE then
    	if  GS.current() ~= core.states.pause then
        	GS.push(core.states.pause)
        else
        	GS.pop()
        end
    end
    if key == CONTROLS.FOUR  then
        GS.push(core.states.loading)
    end
end

function love.threaderror(t, e)
    return error(e)
end