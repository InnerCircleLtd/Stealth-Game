sti = require 'zz_lib.sti'

return function()
    core.system.add( my_require 'systems.render.tile_map',  {"draw","draw_map","draw_ground"})
    core.system.add( my_require 'systems.anger_management.triggers',  {"update"})
    core.system.add( my_require 'systems.anger_management.react',  {"update"})

    core.system.add( my_require 'systems.anger_management.draw_triggers',  {"draw"})

    core.system.add( my_require 'systems.anger_management.debug_draw_circles',  {"draw"})
    core.system.add( my_require 'systems.anger_management.debug_draw_systems.draw_idle',  {"draw"})
    core.system.add( my_require 'systems.anger_management.debug_draw_systems.draw_angry',  {"draw"})
    core.system.add( my_require 'systems.anger_management.debug_draw_systems.draw_suspicious',  {"draw"})
    core.system.add( my_require 'systems.anger_management.debug_draw_systems.draw_alerted',  {"draw"})
    core.system.add( my_require 'systems.pathfinding.trivial_path',  {"update"})
    core.system.add( my_require 'systems.pathfinding.get_possible_tiles',  {"update"})
    core.system.add( my_require 'systems.pathfinding.get_bfs_from_map',  {"update"})
    core.system.add( my_require 'systems.requirement_dummy',  {"update"})

    --core.system.add( my_require 'systems.debug.draw_route',  {"draw"})
    core.system.add( my_require 'systems.debug.draw_los',  {"draw_canvas"})
    --core.system.add( my_require 'systems.collision.light_loaders',  {"update"})
    --core.system.add( my_require 'systems.collision.light_source_loader',  {"update"})
    --core.system.add( my_require 'systems.collision.light_source_directional',  {"update"})


    
    core.system.add( my_require 'systems.player_control.basic_movement',  {"update"})
    core.system.add( my_require 'systems.render.camera',  {"update"})
    --core.system.add( my_require 'systems.debug.draw_bump',  {"draw"})
    core.system.add( my_require 'systems.collision.bump',  {"update"})
end