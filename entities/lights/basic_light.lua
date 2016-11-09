local id = 0
return function(x,y, rot, route)
 	local agent = {}
 	id =  id + 1
 	agent.name       ="agent".. id
	agent.position   = {x=x, y=y, rotation=rot,speed = 100}
	agent.debug_circle = {radius=2}
	agent.light_source= {255,255,255}
	return agent
end