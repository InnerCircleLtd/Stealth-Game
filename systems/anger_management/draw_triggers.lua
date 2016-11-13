local system = {}
system.name = "draw_triggers"
system.importance = -100000
system.draw = function()
	for k,v in pairs(system.targets) do
		str = ""

		for l,w in ipairs(v.triggers) do
			str = str .. w.name

		end
		love.graphics.print(str,v.position.x,v.position.y)
	end
end
system.requirements = {position=true,triggers=true}

return system
