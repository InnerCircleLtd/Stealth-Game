local filters = {}
local function filter_not(a)
	if not filters[a.id] then
		filters[a.id] = function(obj)
			if a.name ~= "player"then
				return a ~= obj
			else
				return a ~= obj and obj.is_obstructing
			end
		end
	end
	
	return filters[a.id]
end

local system = {}
system.importance = 1000
system.name = "draw_los"
system.draw_canvas = function()
	local canvas = love.graphics.getCanvas()
	for k,v in pairs(system.targets) do
		if v.view_cone.is_pl then
			love.graphics.setCanvas(game.canvases.light_pl)
		else
			love.graphics.setCanvas(game.canvases.light_objs)
		end
		local prev = nil

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

			x4 = core.rotate_point(-math.pi/180*2, x4)
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
			if v.name ~= "player" then
			love.graphics.setColor(255,0,0,60)
			end
			if prev then

				love.graphics.polygon("fill",r, s, v.position.x,v.position.y, prev.x, prev.y)
			else
				if v.name ~= "player" then

			love.graphics.setColor(255,0,0,128)
				love.graphics.line(r,s,v.position.x,v.position.y)
				end
			end
			love.graphics.setColor(255,255,255,255)
			prev = {x=r, y=s}
		end
			if v.name ~= "player" then
			love.graphics.setColor(255,60,60,80)

			love.graphics.line(prev.x,prev.y,v.position.x,v.position.y)
			love.graphics.setColor(255,255,255,255)
		end

	end
	love.graphics.setCanvas(canvas)
end
system.requirements = {position=true, view_cone = true}

return system
