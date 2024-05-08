local Frame = Hyperspace.Resources:CreateImagePrimitiveString(
                "statusUI/speed_UI_frame.png",
                404,
                75,
                0,
                Graphics.GL_Color(1, 1, 1, 1),
                1.0,
                false) 
local CompactFrame = Hyperspace.Resources:CreateImagePrimitiveString(
                "statusUI/speed_UI_frame_compact.png",
                1212,
                603,
                0,
                Graphics.GL_Color(1, 1, 1, 1),
                1.0,
                false)

script.on_render_event(Defines.RenderEvents.LAYER_PLAYER,
function() end, 
function()
  local speed = string.format("%i", Hyperspace.FPS.speedLevel)
  Graphics.CSurface.GL_PushMatrix()
  Graphics.CSurface.GL_LoadIdentity()

  if Hyperspace.ships.player:HasEquipment("speed_ui") == 0 then 
    Graphics.CSurface.GL_RenderPrimitive(Frame)
    Graphics.freetype.easy_printCenter(0, 444, 100, speed)
  elseif Hyperspace.ships.player:HasEquipment("speed_ui") == 1 then
    Graphics.CSurface.GL_RenderPrimitive(CompactFrame)
    Graphics.freetype.easy_printCenter(0, 1231, 624, speed)
  end

  Graphics.CSurface.GL_PopMatrix()
end)


script.on_game_event("SPEED_UI_FAST_1",false,
function()
  Hyperspace.FPS.speedLevel = math.min(Hyperspace.FPS.speedLevel + 1, 50)
end
)
script.on_game_event("SPEED_UI_FAST_2",false,
function()
  Hyperspace.FPS.speedLevel = math.min(Hyperspace.FPS.speedLevel + 3, 50)
end
)
script.on_game_event("SPEED_UI_SLOW_1",false,
function()
  Hyperspace.FPS.speedLevel = math.max(Hyperspace.FPS.speedLevel - 1, -3)
end
)
script.on_game_event("SPEED_UI_SLOW_2",false,
function()
  Hyperspace.FPS.speedLevel = math.max(Hyperspace.FPS.speedLevel - 3, -3)
end
)
script.on_game_event("SPEED_UI_RESET",false,
function()
  Hyperspace.FPS.speedLevel = 0
end
)
