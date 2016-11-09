core.entity = {}

function core.entity.add(entity)
	entity.id = next_id()
	entity.systems = {}
	for k,v in pairs(entity) do
		if k ~= "id"  and k ~= "systems" then
			core.component.add_existing(entity,k)
		end	
	end
	local  b = { __mode = "v" }
	setmetatable(entity.systems, b) 
	game.entities[entity.id] = entity
	return entity
end


function core.entity.remove(entity)
	if 	game.entities[entity.id] == nil then
		return
	end
	if game.systems.subcomponent_reg and game.systems.subcomponent_reg.components[entity.id] ~= nil then
		for k,v in pairs(game.systems.subcomponent_reg.components[entity.id] ) do
			core.entity.remove(v)
		end
	end
	game.entities[entity.id] = nil
	for k,v in pairs(entity.systems) do
		v.targets[entity.id] = nil
		if v.unregister then
			v.unregister(entity)
		end
	end
end


-- Spawns an entity, and also spawns it's subcomponents, which an object CAN return as a return value.
function core.entity.spawn(w, zone_id,absolute)
	local da = 0
	local ent, subs = w[1](unpack(w))
	ent.remove_zone = zone_id
	if ent.position then
		ent.position.x = ent.position.x + game.systems.scroll.x
		ent.position.y = ent.position.y + game.systems.scroll.y
	end

	if w.add then
		for k,v in ipairs(w.add) do
			ent[v[1]]=v[2]
		end
	end
	
	core.entity.add(ent)
	da = da +1
	if subs then
		for _, sub in pairs(subs) do
			local subb = sub[1](unpack(sub))
			subb.remove_zone=zone_id

			core.entity.add(subb)
			da = da +1
		end
	end
	return da
end