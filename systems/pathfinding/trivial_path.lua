local system = {}
system.name = "update_trivial_path"
system.update = function(dt)
	for k,v in pairs(system.targets) do
		if v.routes[v.current_route[1]] then
			-- get relative rotation
			local a_rot = core.get_rotation(v.position, v.routes[v.current_route[1]][v.current_route[2]]) - v.position.rotation
			-- normalize rotation
			while  a_rot < 0 do
	 			a_rot =  a_rot+math.pi*2
			end
			while a_rot > math.pi*2 do
				a_rot = a_rot - math.pi*2
			end
			if math.abs(a_rot) < 0.05 then
				-- move towards target
				local xx = v.routes[v.current_route[1]][v.current_route[2]].x - v.position.x 
				local yy = v.routes[v.current_route[1]][v.current_route[2]].y - v.position.y

				hyp = math.sqrt(xx*xx+yy*yy)

				if hyp > 0 then
					xx = xx / hyp
					yy = yy / hyp
				end
				xx = xx * v.position.speed * dt
				yy = yy * v.position.speed * dt
				v.position.x = v.position.x + xx
				v.position.y = v.position.y + yy
				v.position.updated = true
				-- Check if close enough
				if hyp < 5 then
					v.current_route[2] = v.current_route[2] + 1
					if not v.routes[v.current_route[1]][v.current_route[2]] then 
						v.current_route[2] = 1
					end
				end
			else

				-- rotate
				if a_rot > math.pi then
					v.position.rotation = v.position.rotation  - dt*3
				else
					v.position.rotation = v.position.rotation  + dt*3
				end
			end

		end
	end
end
system.requirements = {position=true, current_route=true, routes=true}

return system
