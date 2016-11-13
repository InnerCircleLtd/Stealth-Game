local system = {}
system.name = "get_bfs_from_map"
system._tiles = game.systems.get_collision_tilemap._tiles
system.to = love.thread.getChannel("bfs_to")
system.from = love.thread.getChannel("bfs_from")

	system.thread = love.thread.newThread("systems/pathfinding/bfs_thread.lua"):start()


system.update = function(dt)
	for k,v in pairs(system.targets) do
		if not  v.pathfinding.operating then
			system.to:push(system._tiles)
			system.to:push({v.position, v.pathfinding.to})
			v.pathfinding.operating = true
		end
	end
	
	while system.from:peek() do
	 	local a = system.from:pop()
		print(a)
	end
end

system.register = function(v)
	local a = 0
	for k,v in pairs(system.targets) do
		a = a +1
	end
	if a == 1 then 
	
	system.to:clear()
	
	end

end
system.unregister = function(v)

end

system.requirements = {position=true, pathfinding=true, destination = true}

return system