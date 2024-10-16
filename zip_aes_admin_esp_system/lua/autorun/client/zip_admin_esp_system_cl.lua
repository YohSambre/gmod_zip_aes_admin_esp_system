concommand.Add("show_esp", function(ply)
    if ply:IsAdmin() then
        notification.AddLegacy("Players are now visible through walls", NOTIFY_HINT, 4)
        local function DrawESP()
            for _, target in pairs(player.GetAll()) do
                if target ~= ply and target:Alive() then
                    halo.Add({target}, Color(0, 255, 68), 1, 1, 5, true, true)
                    end
                    local namePos = (target:GetPos() + Vector(0, 0, 90)):ToScreen()
                    local distance = LocalPlayer():GetPos():Distance(target:GetPos())
                    local distanceStr = string.format("%.2f", distance / 39.37)
                    local health = target:Health()
                    local rank = target:GetUserGroup()
                    local nameColor = Color(255, 255, 255) -- White
                    local distanceColor = Color(255, 255, 0) -- Yellow
                    local healthColor = Color(255, 192, 203) -- Pink
                    local rankColor = Color(255, 0, 0) -- Red

                    draw.DrawText(target:Name(), "HudSelectionText", namePos.x, namePos.y, nameColor, 1)
                    draw.DrawText("Distance: " .. distanceStr .. " m", "HudSelectionText", namePos.x, namePos.y + 16, distanceColor, 1)
                    draw.DrawText("Health: " .. health, "HudSelectionText", namePos.x, namePos.y + 32, healthColor, 1)
                    draw.DrawText("Rank: " .. rank, "HudSelectionText", namePos.x, namePos.y + 48, rankColor, 1)
                end
            end
        hook.Add("HUDPaint", "AES", DrawESP)
    end
end)

concommand.Add("hide_esp", function(ply)
        if ply:IsSuperAdmin() then
        hook.Remove( "HUDPaint", "AES" )
        notification.AddLegacy( "players are no longer visible through walls", NOTIFY_HINT, 4 )
    end
end)