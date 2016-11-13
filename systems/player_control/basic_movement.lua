local system = {}

system.name = "basic_move"

system.update = function(dt)
	for k,v in pairs(system.targets) do
		
		local dx = 0
		local dy = 0
		if love.keyboard.isDown( "w") then
			dy = -1
		end
		if love.keyboard.isDown( "a") then
			dx = -1
		end
		if love.keyboard.isDown( "s") then
			dy = 1
		end
		if love.keyboard.isDown( "d") then
			dx = 1
		end


		hyp = math.sqrt(dx*dx+dy*dy)

		if hyp > 0 then
			dx = dx / hyp
			dy = dy / hyp
			v.position.updated = true
		end
		v.position.x = v.position.x  +  dx*v.speed.speed * dt
		v.position.y = v.position.y  +   dy*v.speed.speed * dt

	end
end

system.requirements = {position=true,basic_move=true,speed=true}

return system