local system = {}
system.name = "draw_tilemap"
system.importance = 2
system.draw = function()

	for k,v in pairs(system.targets) do
		love.graphics.push()
		love.graphics.translate( v.tile_map.x, v.tile_map.y )
		game.data.tile_maps[v.tile_map.map].m:draw()
		love.graphics.pop()
	end

end

system.requirements = {tile_map=true}

return system

