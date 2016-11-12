debug.debug()
local from = love.thread.getChannel("bfs_to")
local to = love.thread.getChannel("bfs_from")
to:supply("HERE")

while true do
	local map = from:demand()
	local coords = from:demand()


	to:supply({a.x+1,a.y})
end