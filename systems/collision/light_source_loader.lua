

local system = {}
system.name = "light_source_loader"
system.e_list = {}
system.update = function(dt)
	for k, entity in pairs(system.targets) do
		system.e_list[entity.id]:setPosition(entity.position.x,entity.position.y)
	end
end

system.register = function(entity)
	 system.e_list[entity.id] = lightWorld:newLight(entity.position.x,  entity.position.y, entity.light_source[1],  entity.light_source[2], entity.light_source[3], 300)
end

system.unregister = function(entity)
	lightWorld:remove(system.e_list[entity.id] )
end

system.requirements = {light_source=true, position=true}

return system
