

local system = {}
system.name = "light_source_directional"
system.e_list = {}
system.update = function(dt)
	for k, entity in pairs(system.targets) do
		for k,v in pairs(entity.dir_light_source.worlds) do
			system.e_list[entity.id][v]:setPosition(entity.position.x,entity.position.y)
			system.e_list[entity.id][v]:setDirection(entity.position.rotation+0.5*math.pi)
	end
end
end

system.register = function(entity)
		system.e_list[entity.id]  = {}
	for k,v in pairs(entity.dir_light_source.worlds) do
	 	system.e_list[entity.id][v] = _G[v]:newLight(entity.position.x,  entity.position.y, entity.dir_light_source[1],  entity.dir_light_source[2], entity.dir_light_source[3], 300)
		system.e_list[entity.id][v]:setAngle(entity.dir_light_source.fov/(180/math.pi))

	end
end

system.unregister = function(entity)
	for k,v in pairs(entity.dir_light_source.worlds) do
		_G[v]:remove(system.e_list[entity.id][v] )
	end
end


system.requirements = {dir_light_source=true, position=true}

return system
