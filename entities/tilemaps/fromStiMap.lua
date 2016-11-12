local id = 0
return function(map)
 	local agent = {}
 	id =  id + 1
 	agent.name       = "map_loader".. id
	agent.tile_map   = {x=0, y=0, map=map}
	return agent
end