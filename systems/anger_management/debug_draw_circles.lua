local system = {}
system.name = "draw_squre"
system.draw = function()
	for k,v in pairs(system.targets) do
		love.graphics.circle("fill",v.position.x-10,v.position.y-10,20)
	end
end
system.requirements = {position=true,circle=true}

return system
