local id = 0
return function(x,y, rot)
 	local agent = {}
 	id =  id + 1
 	agent.name       ="player"
	agent.position   = {x=x, y=y, rotation=rot,speed = 100}
	agent.managed_anger = {suspicion = {time = 5}}
	agent.idle = {idle = 100}
	agent.basic_move = {true}
	agent.speed   = {speed = 100}
	agent.bump_shape = {w = 28, h = 28}
	agent.angry_value = {anger = 1000}
	agent.view_cone = {fov=361, is_pl=true, distance = 600}
	return agent
end