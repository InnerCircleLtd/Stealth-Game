local minfps = 1000
local ctx = GS.new()

function ctx:enter(dt)
  GS.push(core.states.loading)
  love.mouse.setGrabbed(true)
end

function ctx:update(dt)
  for k,v in core.system.orderedPairs(game.system_categories.update) do
    v.update(dt)
  end
end

function ctx:draw()
  for k,v in pairs(game.canvases) do
    love.graphics.setCanvas(v)
    love.graphics.clear()
  end
  love.graphics.setCanvas(game.canvases.light_tmp)
  love.graphics.setColor(128,128,128)
  love.graphics.rectangle("fill",0,0,2000,1000)
  love.graphics.setColor(255,255,255)
  love.graphics.setCanvas()
  love.graphics.push()
  love.graphics.translate(-camera.position.x, -camera.position.y)

  for k,v in core.system.orderedPairs(game.system_categories.draw) do
    love.graphics.setCanvas(game.canvases.objs)
    v.draw()
  end
  for k,v in core.system.orderedPairs(game.system_categories.draw_canvas) do
    v.draw_canvas()
  end
  for k,v in core.system.orderedPairs(game.system_categories.draw_map) do
    v.draw_map()
  end
  for k,v in core.system.orderedPairs(game.system_categories.draw_ground) do
    v.draw_ground()
  end

  love.graphics.pop()
  love.graphics.setCanvas()
  love.graphics.draw(game.canvases.light_tmp,0,0)
  love.graphics.draw(game.canvases.light_pl,0,0)
  love.graphics.setBlendMode("multiply")
  love.graphics.draw(game.canvases.ground,0,0)

  love.graphics.setBlendMode("alpha")
  love.graphics.setCanvas(game.canvases.light_tmp)
  love.graphics.clear()

  love.graphics.draw(game.canvases.light_pl,0,0)
  love.graphics.setBlendMode("multiply")
  love.graphics.draw(game.canvases.light_objs,0,0)
  love.graphics.setBlendMode("alpha")
  love.graphics.setCanvas()
  love.graphics.draw(game.canvases.light_tmp,0,0)

  love.graphics.setBlendMode("alpha")
  love.graphics.setCanvas(game.canvases.light_tmp)
  love.graphics.clear()
  love.graphics.draw(game.canvases.light_pl,0,0)
  love.graphics.setBlendMode("multiply")
  love.graphics.draw(game.canvases.objs,0,0)
  love.graphics.setBlendMode("alpha")
  love.graphics.setCanvas()
  love.graphics.draw(game.canvases.light_tmp,0,0)

  love.graphics.draw(game.canvases.walls,0,0)

  --love.graphics.draw(game.canvases.walls,0,0)

  for k,v in core.system.orderedPairs(game.system_categories.draw_ui) do
    v.draw_ui()
  end
  local fps = love.timer.getFPS( )
  if fps == 0 then
    fps = 1000
  end
  minfps = math.min(minfps, fps)
  love.graphics.print("Current FPS: "..tostring(fps).. "MIN".. minfps, 10, 10)
end

function ctx:leave()
  love.mouse.setGrabbed(false)
  print('leaving')
end
return ctx
