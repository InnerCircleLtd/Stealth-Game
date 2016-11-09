
local system = {}
system.name = "bump_debug"
system.draw = function()
	for k,v in pairs(system.targets) do
		local x,y,w,h  = game.systems.bump.bump_world:getRect(v)
		love.graphics.rectangle("fill", x , y, w, h)
		
	end
end
system.requirements = {bump_shape=true, position=true}

return system
