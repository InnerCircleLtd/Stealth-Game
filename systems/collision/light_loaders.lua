

local system = {}
system.name = "light_loaded"
system.e_list = {}
system.update = function(dt)

end

system.register = function(entity)
	 system.e_list[entity.id] = lightWorld:newRectangle(entity.position.x,  entity.position.y, entity.light_shape.w,  entity.light_shape.h)

	
end

system.unregister = function(entity)
	lightWorld:remove(system.e_list[entity.id] )
end

system.requirements = {light_shape=true, position=true}

return system
