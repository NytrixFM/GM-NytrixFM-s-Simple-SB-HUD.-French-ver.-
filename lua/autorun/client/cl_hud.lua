surface.CreateFont("HudFont", {
    font = "Arial",
    size = 30,
    weight = 500,
    shadow = false,
})

local hide = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
}

hook.Add("HUDPaint", "MonHudDeMerde", function()

    local joueur = LocalPlayer()
    
    if not IsValid(joueur) then return end 

    local vie = joueur:Health()
    local bouclier = joueur:Armor()
    local vie_e
    
    if vie <= 0 then
        vie_e = "Mort"
    else
        vie_e = vie
    end
    surface.SetDrawColor( Color(255, 255, 255))
    surface.DrawRect(10, 10, 500, 30)
    
    local texte_a_ecrire = "Joueur : " .. joueur:Nick() .. " | Vie : " .. vie_e .. " | Bouclier : " .. bouclier
    local text_color

    if vie <= 25 then
        text_color = Color(255, 0, 0, 255)
    elseif vie <= 50 then
        text_color = Color(255, 136, 0, 255) 
    elseif vie >= 50 then
        text_color = Color(3, 110, 17, 255)
    else
        text_color = Color(0, 0, 0, 255)
    end

    draw.SimpleText(texte_a_ecrire, "HudFont", 10, 10, text_color, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)    
end)