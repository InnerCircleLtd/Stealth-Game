local from = love.thread.getChannel("bfs_to")
local to = love.thread.getChannel("bfs_from")
local q = {}
local r = 1
local visited = {}

local to_tile = function(xx )
	if not xx then
		return nil
	end
	local x = math.floor(xx.x/16+8)
	local y = math.floor(xx.y/16+8)	
	return {x=x,y=y}
end
local function recursive_path(p)
	print(p.x..":"..p.y)
	if visited[p.x..":"..p.y] == p then
		return {}
	end
	if  visited[p.x..":"..p.y] == "FIRST" then
		return {}
	end


	if visited[p.x..":"..p.y]  then 
		local path =  recursive_path(visited[p.x..":"..p.y])
		path[#path+1] = visited[p.x..":"..p.y]
		return path
	end
	return {}
end
local function get_neighbours(xx)

	local neighbours = {}
	neighbours[1] = {x=xx.x+1, y=xx.y, prev=xx}
	neighbours[2] = {x=xx.x-1, y=xx.y, prev=xx}
	neighbours[3] = {x=xx.x, y=xx.y+1, prev=xx}
	neighbours[4] = {x=xx.x, y=xx.y-1, prev=xx}
	return neighbours
end
while true do
	while true do
		local map = from:demand()
		q = {}
		r = 1
		visited = {}

		if map == "END" then
			to:push("ENDED")
			break
		end
			
		local coords = from:demand()
		if coords == "END" then
			to:push("ENDED")
			break
		end

		local fp = to_tile(coords[1])
		visited = {}
		local tp = to_tile(coords[2])

		if fp and tp then
			q[#q+1] = fp
			fp.route = {}
			visited[fp.x..":"..fp.y] = "FIRST"
			while #q >= r and r < 5000 do
				for k,v in pairs(get_neighbours(q[r])) do
					if not map[v.x..":"..v.y] and not visited[v.x..":"..v.y] then
						q[#q+1] = v
						if v == tp then
							r = #q+10
						end
						visited[v.x..":"..v.y] = q[r]
					end
				end
				r = r + 1
			end
			if visited[tp.x..":"..tp.y] then
				for k,v in pairs(recursive_path(tp)) do
					print(k,v)
				end
				to:supply(recursive_path(tp))
			else
				to:supply("FAIL")
			end

		end
		
	end
end
