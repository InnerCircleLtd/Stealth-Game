core.get_rotation = function (from, to)

    local dx, dy  = to.x - from.x, to.y - from.y
    local aim_for = 0
    if dx > 0 then
      aim_for = -math.acos(dy/ math.sqrt(dx*dx+dy*dy))
    else
      aim_for  = math.acos(dy/ math.sqrt(dx*dx+dy*dy))  
    end
    return  aim_for
  
end

core.rotate_point = function(angle,p)
	
   local s = math.sin(angle)
   local c = math.cos(angle)
  
  -- rotate point
  local xnew = p.x * c - p.y * s
  local ynew = p.x * s + p.y * c

  -- translate point back:
  return {x = xnew, y= ynew}
end


next_id_func = function (first)
      local id = 0
    if first then
      id = first
    end
    return function()
        id = id+1
        return id
  end
end