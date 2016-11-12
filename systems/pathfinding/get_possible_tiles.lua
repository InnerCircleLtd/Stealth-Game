local system = {}
system.name = "get_collision_tilemap"
system._tiles = {}
system.update = function(dt)
	
end
system.register = function(v)
	local xx, yy = v.position.x / 32, v.position.y / 32
	local x, y = math.floor(xx), math.floor(yy)
	if xx == x and yy == y then
		system._tiles[x..":"..y] = 1
	end

end
system.unregister = function(v)
	local xx, yy = v.position.x / 32, v.position.y / 32

	system._tiles[xx..":"..yy] = 1
end
system.requirements = {position=true, isWall=true}

return system
