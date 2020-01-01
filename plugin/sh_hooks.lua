function rcms:PlayerThink(player, curTime, infoTable)
    local wounds = rcms:GetWoundTable(player);
    for k, v in pairs(wounds) do
        if (v == "WOUND_LEGL_SPRAIN") or (v == "WOUND_LEGR_SPRAIN") then
            infoTable.walkSpeed = 75;
            infoTable.runSpeed = 100;
        end;
        if (v == "WOUND_LEGL_BREAK") or (v == "WOUND_LEGR_BREAK") then
            infoTable.walkspeed = 50;
            infoTable.runSpeed = 25;
        end;
        if (v == "WOUND_LEGL_BLACKED") or (v == "WOUND_LEGR_BLACKED") then
            infoTable.walkspeed = 0;
            infoTable.runSpeed = 0;
        end;
    end;

    if (!Clockwork.limb:IsAnyDamaged(player)) then
        player:SetHealth(player:GetMaxHealth());
    end;
end;