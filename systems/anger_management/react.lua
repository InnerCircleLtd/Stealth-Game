local system = {}
system.name = "react"
local function add_behavior(v, trigger)

	if v.behavior.obj ~= nil then
		for l,w in pairs(v.behavior.obj) do

			core.component.remove(v, w)
		end
	end
	local behavior = {}
	behavior.id = trigger.id
	behavior.obj = {}
	for k,w in pairs (v.reactions[trigger.name].components) do
		behavior.obj[#behavior.obj] = k
		v.x = trigger.x
		v.y = trigger.y
		core.component.add(v,k, w)		
	end
	behavior.threat = v.reactions[trigger.name].threat
	v.behavior = behavior

	
	
end
system.update = function()
	for k,v in pairs(system.targets) do
		local b2a = nil
		for l,w in ipairs(v.triggers ) do
			if w.id ~= v.behavior.id then
				if v.reactions[w.name] and (not v.behavior.importance or v.reactions[w.name].importance > v.behavior.importance ) then
					if (not b2a or b2a.importance < v.reactions[w.name].importance ) then
						b2a = w
					end
				end
			end
		end
		if b2a then
			add_behavior(v, b2a)
		elseif v.behavior.empty then
			if v.angry then
				add_behavior(v,{name="angry",id=-1, threat = -1})
			else
				add_behavior(v,{name="idle",id=-1, threat = -1})
			end
		end

	end
end
system.requirements = {reactions=true, behavior=true, triggers=true}

return system
