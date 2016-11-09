local system = {}
system.name = "draw_alerted"
system.draw = function()
	for k,v in pairs(system.targets) do
		love.graphics.setColor( 255, 128, 0)
		love.graphics.circle("fill",v.position.x-10,v.position.y-10,20)
		love.graphics.setColor( 255,255,255)
	end
end
system.requirements = {position=true,alerted=true}

return system
