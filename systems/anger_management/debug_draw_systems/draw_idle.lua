local system = {}
system.name = "draw_idle"
system.draw = function()
	for k,v in pairs(system.targets) do
		love.graphics.circle("fill",v.position.x,v.position.y,20)
	end
end
system.requirements = {position=true,idle=true}

return system
