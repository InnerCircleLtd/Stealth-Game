local i = 0
local get_id = function()
	i=i+1
	return i
end
function add_trigger(entity, trigger)
	entity.triggers[#entity.triggers+1] = trigger
	trigger.id = get_id()
end

local system = {}
system.name = "triggers"
system.update = function(dt)
	for k,v in pairs(system.targets) do
		for l,w in ipairs(v.triggers) do
			w.threat = w.threat - dt
			if w.threat <= 0 then
				v.triggers[l] = v.triggers[#v.triggers]
				v.triggers[#v.triggers] = nil
			end
		end
	end
end
system.requirements = {triggers=true}

return system
