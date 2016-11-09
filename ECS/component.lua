core.component = {}

function core.component.add_existing(entity, component_name)
		-- Add required systems
	if component_name=="images" then
		if entity.images_loaded then
			core.component.remove(entity,"images_loaded")
		end
		if not entity.images_unloaded then
			core.component.add(entity,"images_unloaded",{1})
		end
	end
	if string.sub(component_name,1,1) == "_" then
		local system_name = string.sub(component_name, 2)
		if game.systems[system_name] then
			game.systems[system_name].system_entities[entity.id]  = entity
		end
	end
	if core.requirements_to_systems[component_name] then
		for _,system in pairs(core.requirements_to_systems[component_name]) do
			local has_all = true
			for k,v in pairs(system.requirements) do
				if entity[k] == nil then
					has_all = false
				end
			end
			if has_all and not system.targets[entity.id] then
				system.targets[entity.id] = entity
				entity.systems[system.name] = system
				if system.register then
					system.register(entity)
				end
			end
		end
	end
end


function core.component.add(entity,component_name,component)
	entity[component_name] = component
	core.component.add_existing(entity,component_name)
end


function core.component.remove(entity, component_name)
		for _,system in pairs(core.requirements_to_systems[component_name]) do
				if component_name[1] == "_" then
					local system_name = string.sub(component_name, 2)
					if game.systems[system_name] then
						game.systems[system_name].system_entities[entity.id]  = entity
					end
				end
			entity.systems[system.name] = nil
			system.targets[entity.id] = nil
			if system.unregister then
				system.unregister(entity)
			end
		end
		entity[component_name] = nil
end