
local system = {}
system.name = "draw_route"
system.draw = function()
	for k,v in pairs(system.targets) do
		points = {}
		for l,w in ipairs(v.routes[v.current_route[1]]) do 
			points[#points+1] = w.x
			points[#points+1] = w.y
		end
		local w =  v.routes[v.current_route[1]][1]
		points[#points+1] = w.x
		points[#points+1] = w.y
		love.graphics.line(unpack(points))
	end
end
system.requirements = {current_route=true,routes=true}

return system
