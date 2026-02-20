surface.CreateFont("FiligrameFont", {
    font = "Arial",
    size = 30,
    weight = 500,
    shadow = false,
})

local filigrame_var = 255
local direction = 1.
local status = 1

hook.Add("HUDPaint", "Filigrame", function()
    local ft = "" --If you want, you can put your name here if you have edited the addon
    local filigrame_text = "first version made By Nytrix FM" .."| Edited by " .. ft

    if status >= 1 then
        filigrame_var = filigrame_var + direction
    else
        filigrame_var = 0
    end

    if filigrame_var >= 255 then
        direction = -1
    elseif filigrame_var <= 0 then
        direction = 1
        status = 0
    end

    draw.SimpleText(
        filigrame_text,
        "FiligrameFont",
        10,
        50,
        Color(0, 0, 0, filigrame_var),
        TEXT_ALIGN_LEFT,
        TEXT_ALIGN_TOP
    )
end)
