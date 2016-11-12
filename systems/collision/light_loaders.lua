

local system = {}
system.name = "light_loaded"
system.e_list = {}
system.update = function(dt)
end

system.register = function(entity)
	for k,v in pairs(entity.light_shape.worlds) do
		print(v)
		print(_G[v])
	 system.e_list[entity.id] = _G[v]:newRectangle(entity.position.x,  entity.position.y, entity.light_shape.w,  entity.light_shape.h)
	end

	
end

system.unregister = function(entity)
	for k,v in pairs(entity.light_shape.worlds) do
		_G[v]:remove(system.e_list[entity.id] )
	end
end

system.requirements = {light_shape=true, position=true}

return system
