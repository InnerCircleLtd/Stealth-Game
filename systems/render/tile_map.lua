local system = {}
system.name = "draw_tilemap"
system.importance = 2
system.draw = function()
    love.graphics.setCanvas(game.canvases.ghost)

	for k,v in pairs(system.targets) do

		game.data.tile_maps[v.tile_map.map].m:draw()
	end
    love.graphics.setCanvas()



end
system.draw_map = function()
    love.graphics.setCanvas(game.canvases.walls)

	for k,v in pairs(system.targets) do
	    love.graphics.setColor(128,128,128)

		local self = game.data.tile_maps[v.tile_map.map].m
	for _, layer in ipairs(self.layers) do
		if layer.name ~="ground" and layer.visible and layer.opacity > 0 then
			self:drawLayer(layer)
		end
	end	end
    love.graphics.setCanvas()

end
system.draw_ground = function()
    love.graphics.setCanvas(game.canvases.ground)
	for k,v in pairs(system.targets) do
		local self = game.data.tile_maps[v.tile_map.map].m

	for name, layer in ipairs(self.layers) do
		if layer.name =="ground" and layer.visible and layer.opacity > 0 then
			
			self:drawLayer(layer)
		end
	end	end
    love.graphics.setCanvas()


end
system.requirements = {tile_map=true}

return system

