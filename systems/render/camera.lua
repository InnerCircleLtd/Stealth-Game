local system = {}
system.name = "camera"
system.importance = 2
system.update = function(dt)

	for k,v in pairs(system.targets) do
		local t = game.entities[v.follows.entity].position
	    local ww = love.graphics.getWidth()
		local wh = love.graphics.getHeight()
		if v.position.x+ (1-v.camera.w/2)*ww <  t.x then
			v.position.x = t.x - (1-v.camera.w/2)*ww
		end
		if v.position.y+ (1-v.camera.w/2)*wh <  t.y then
			v.position.y = t.y - (1-v.camera.w/2)*wh
		end

		if v.position.x + (v.camera.w/2)*ww >  t.x then
			v.position.x = t.x - (v.camera.w/2)*ww
		end
		if v.position.y + (v.camera.w/2)*wh >  t.y then
			v.position.y = t.y - (v.camera.w/2)*wh
		end
	end

end

system.requirements = {camera = true, follows = true, position = true}

return system

