local bump = require 'zz_lib.bump'

local system = {}
system.name = "bump"
system.bump_world = bump.newWorld(64)
system.update = function(dt)
	for k,v in pairs(system.targets) do
		if v.position.updated then
			v.position.x = v.position.x - v.bump_shape.w/2
			v.position.y = v.position.y - v.bump_shape.h/2
			v.position.x, v.position.y = system.bump_world:move(v, v.position.x, v.position.y)
			v.position.x = v.position.x + v.bump_shape.w/2
			v.position.y = v.position.y + v.bump_shape.h/2
			v.position.updated = nil
		end
	end
end

system.register = function(entity)
	system.bump_world:add(entity, entity.position.x- entity.bump_shape.w/2,  entity.position.y- entity.bump_shape.h/2, entity.bump_shape.w,  entity.bump_shape.h)
end

system.unregister = function(entity)
	system.bump_world:remove(entity)
end

system.requirements = {bump_shape=true, position=true}

return system
