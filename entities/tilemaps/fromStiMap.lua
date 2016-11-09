local id = 0
return function(map, x,y)
 	local agent = {}
 	id =  id + 1
 	agent.name       = "map_loader".. id
	agent.tile_map   = {x=x, y=y, map=map}
	return agent
end