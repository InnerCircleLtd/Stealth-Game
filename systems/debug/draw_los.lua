local filters = {}
local function filter_not(a)
	if not filters[a.id] then
		filters[a.id] = function(obj)
			return obj ~= a
		end
	end
	
	return filters[a.id]
end
local system = {}
system.name = "draw_los"
system.draw = function()
	for k,v in pairs(system.targets) do
		local fov = v.view_cone.fov*math.pi/180
		local x1 = {x=0,y=v.view_cone.distance}
		local x2 = {x=0,y=v.view_cone.distance}
		x1 = core.rotate_point( 0.5*fov, x1)
		x2 = core.rotate_point(-0.5*fov, x2)
		local x3 = {x=0,y=x1.y*0.7}
		x1 = core.rotate_point(v.position.rotation, x1)
		x2 = core.rotate_point(v.position.rotation, x2)
		x3 = core.rotate_point(v.position.rotation, x3)
		x4 = {}
		x4.x = x1.x
		x4.y = x1.y
		x1.x = x1.x + v.position.x
		x1.y = x1.y + v.position.y
		x2.x = x2.x + v.position.x
		x2.y = x2.y + v.position.y
		x3.x = x3.x + v.position.x
		x3.y = x3.y + v.position.y
		x4.x = x4.x * 0.7
		x4.y = x4.y * 0.7
		for i=1,v.view_cone.fov/2 do

			x4 = core.rotate_point(-2*math.pi/180, x4)
			local r,s = x4.x+v.position.x,x4.y+v.position.y
			local itemInfo, len = game.systems.bump.bump_world:querySegmentWithCoords(x4.x+v.position.x,x4.y+v.position.y,v.position.x,v.position.y, filter_not(v))
			local item = nil
			for _, new in pairs(itemInfo) do
				if not item or item.ti1 < new.ti1 then
					item = new
				end
			end
			if item then
				r = item.x2
				s = item.y2
			end
			if item and item.item.angry_value then
				core.component.add(v, "angry", {true})

				if v.idle then 
					core.component.remove(v, "idle")
				end

			end
			love.graphics.line(r, s, v.position.x,v.position.y)
		end
	end
end
system.requirements = {position=true, view_cone = true}

return system
