sti = require 'zz_lib.sti'

return function()
    core.system.add( my_require 'systems.render.tile_map',  {"draw"})

    core.system.add( my_require 'systems.anger_management.debug_draw_circles',  {"draw"})
    core.system.add( my_require 'systems.anger_management.debug_draw_systems.draw_idle',  {"draw"})
    core.system.add( my_require 'systems.anger_management.debug_draw_systems.draw_angry',  {"draw"})
    core.system.add( my_require 'systems.anger_management.debug_draw_systems.draw_suspicious',  {"draw"})
    core.system.add( my_require 'systems.anger_management.debug_draw_systems.draw_alerted',  {"draw"})
    core.system.add( my_require 'systems.pathfinding.trivial_path',  {"update"})
    core.system.add( my_require 'systems.debug.draw_route',  {"draw"})
    core.system.add( my_require 'systems.debug.draw_los',  {"draw"})
    core.system.add( my_require 'systems.collision.light_loaders',  {"update"})
    core.system.add( my_require 'systems.collision.light_source_loader',  {"update"})

    --core.system.add( my_require 'systems.debug.draw_bump',  {"draw"}
    
    core.system.add( my_require 'systems.player_control.basic_movement',  {"update"})
    core.system.add( my_require 'systems.render.camera',  {"update"})

    core.system.add( my_require 'systems.collision.bump',  {"update"})
end