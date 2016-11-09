local system = {}
system.name = "draw_angry"
system.draw = function()
	for k,v in pairs(system.targets) do
		love.graphics.setColor( 255,0,0)
		love.graphics.circle("fill",v.position.x,v.position.y,20)
		love.graphics.setColor( 255,255,255)
	end
end
system.requirements = {position=true,angry=true}

return system
