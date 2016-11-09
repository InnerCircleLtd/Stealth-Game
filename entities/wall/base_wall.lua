local id = 0
return function(x,y)
 	local agent = {}
 	id =  id + 1
 	agent.name       ="agent".. id
	agent.position   = {x=x, y=y, rotation=rot,speed = 100}
	agent.bump_shape = {w = 32, h = 32}
	agent.light_shape = {w=32, h=32}
	return agent
end