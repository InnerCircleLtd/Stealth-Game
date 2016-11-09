love.conf = function(t)
  t.title = "Stealth Game Prototype"
  t.version = "0.10.1"
  t.window.width = 1366
  t.window.height = 768
  t.window.resizable = false
  t.console = false
  t.window.vsync = false
end

CONTROLS = {}

CONTROLS.UP = "w"
CONTROLS.DOWN = "s"
CONTROLS.RIGHT = "d"
CONTROLS.LEFT = "a"

CONTROLS.ONE = "t"
CONTROLS.TWO = "g"
CONTROLS.THREE = "f"
CONTROLS.FOUR = "r"

CONTROLS.RESET = 'e'
CONTROLS.PAUSE = 'p'

CONTROLS.ALL = {'UP', 'DOWN', 'RIGHT', 'LEFT', 'PAUSE', 'ONE', 'TWO', 'THREE', 'FOUR'}

