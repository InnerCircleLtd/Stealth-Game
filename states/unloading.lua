local loading = {}
loading.loaded = 1
-- Loading screen phases, split up loading code among these phases
loading.loaded_paths = {}
local tile_width = 32
local tile_height = 32
require 'zz_lib.core_maths'






function loading:enter(from)
    print("STARTING LOADING")

    loading.count = 0
    for k,v in pairs(game.systems) do
        if v.unload_enter then
            loading.count = loading.count + 1
            v.unload_enter()
        end
    end
end


-- Leave loading screen
function loading:leave(from)
    

    print("FINISHED RESET")
end


function loading:update()
    for k,v in pairs(game.systems) do
        if v.unload_update then
            if v.unload_update() then
                loading.count = loading.count - 1
                v.unload_update = nil
            end
        end
    end
    if loading.count == 0 then
        GS.switch(core.states.loading)
    end
end


-- Draw loading screen
function loading:draw()
    
end 


function loading:keypressed(key)

end
return loading

