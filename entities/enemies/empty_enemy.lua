local id = 0
return function(x,y, rot, route)
 	local agent = {}
 	id =  id + 1
 	agent.name       ="agent".. id
	agent.position   = {x=x, y=y, rotation=rot,speed = 100}
	agent.managed_anger = {suspicion={time=5}}
	agent.idle = {idle=100}
	agent.bump_shape = {w = 28, h = 28}

	agent.routes = {idle=route}
	agent.view_cone = {fov=100, distance = 400}
	agent.behavior = {}
	agent.reactions = {	idle 	= {components = {current_route 	= {"idle", 1}}, 	importance = 0},	
						angry	= {components = {current_route	= {"angry", 1}}, 	importance = 0},
						spotted = {components = {towards		= {"asdf"}}, 		importance = 4},
					}
	agent.behavior = {empty=true}

	agent.triggers  = {}
	

	return agent
end