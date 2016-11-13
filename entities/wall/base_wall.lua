local id = 0
return function(x, y , xx, yy)
  local agent = {}
  id = id + 1
  agent.name = "agent" .. id
  agent.position = {x = x, y = y}
  agent.bump_shape = {w = 32, h = 32}
  agent.light_shape = {w = 32, h = 32, worlds = {"lightWorld"}}
  agent.is_wall = {x = xx, y = yy}
  agent.is_obstructing = {true}
  return agent
end
