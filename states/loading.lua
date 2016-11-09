local loading = {}
loading.loaded = 1
-- Loading screen phases, split up loading code among these phases
loading.loaded_paths = {}
local tile_width = 32
local tile_height = 32
require 'zz_lib.core_maths'
function my_require (str)
    loading.loaded_paths[str] = str
    return require (str)
end


loading.phases = {
    core.reset_game,
    require 'entities.load_all_entity_definitions',
    function()
         for k,v in pairs (loading.loaded_paths) do
            package.loaded[v] = nil        
         end
        collectgarbage("collect")

        
        next_id = next_id_func()
        game.resources = {}
        -- require component types
    end,
    require 'states.loading_functions.load_systems', 
    function()
        core.entity.add(game.entity_definitions.enemies.empty_enemy(466,1, 2, {{x=466,y=0},{x=466,y=946},{x=398,y=946},{x=398,y=0}, {x= 398,y= 946}, {x= 466,y= 946}}))
        core.entity.add(game.entity_definitions.enemies.empty_enemy(721,754, 2, {{x=722,y=754},{x=722,y=686},{x=174,y=686},{x=174,y=754}}))
        core.entity.add(game.entity_definitions.enemies.empty_enemy(722,270, 2, {{x=142,y=270},{x=722,y=270}}))
        core.entity.add(game.entity_definitions.enemies.empty_enemy(722,462, 2, {{x=142,y=462},{x=722,y=462}}))

        local pl = core.entity.add(game.entity_definitions.player.player(400,1100, 20))
        
        camera = core.entity.add(game.entity_definitions.player.camera(400,400, pl.id))
        game.data.tile_maps["maps.level"] = {m = sti.new("maps/level.lua")}
        game.data.tile_maps["maps.level"].e = core.entity.add(game.entity_definitions.tilemaps.fromStiMap("maps.level",0,0))
    end,
    function()
        for k,v in pairs(game.data.tile_maps) do
            local i = 1
            while v.m.layers["collision"..i] do
                local layer = v.m.layers["collision"..i]
                for y = 1, v.m.height do
                     for x = 1, v.m.width do
                        if layer.data[y][x] then
                            print("TILE")
                            core.entity.add(game.entity_definitions.wall.base_wall((x-0.5)*tile_width,(y-0.5)*tile_height))
                        end
                    end
                end
                i = i + 1
            end
        end
    end
}


function loading:enter(from)
    print("STARTING LOADING")
    loading.loaded=1
end


-- Leave loading screen
function loading:leave(from)

    for k,v in pairs(game.systems) do
        print("Running system "..v.name)
    end
    print("FINISHED LOADING")
end


function loading:update()
    if self.loaded <= #self.phases then
        self.phases[self.loaded]()
        self.loaded = self.loaded + 1
        --        love.timer.sleep(0.01)

    else
        GS:pop()
    end

end


-- Draw loading screen
function loading:draw()
    
end 


function loading:keypressed(key)

end
return loading

