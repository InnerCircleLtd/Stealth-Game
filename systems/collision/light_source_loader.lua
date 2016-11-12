

local system = {}
system.name = "light_source_loader"
system.e_list = {}
system.update = function(dt)
	for k, entity in pairs(system.targets) do
		for k,v in pairs(entity.light_source.worlds) do
			system.e_list[entity.id][v]:setPosition(entity.position.x,entity.position.y)
	end
end
end

system.register = function(entity)
		system.e_list[entity.id]  = {}
	for k,v in pairs(entity.light_source.worlds) do
	 	system.e_list[entity.id][v] = _G[v]:newLight(entity.position.x,  entity.position.y, entity.light_source[1],  entity.light_source[2], entity.light_source[3], 300)
	end
end

system.unregister = function(entity)
	for k,v in pairs(entity.light_source.worlds) do
		_G[v]:remove(system.e_list[entity.id][v] )
	end
end


system.requirements = {light_source=true, position=true}

return system
