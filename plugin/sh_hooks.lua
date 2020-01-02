function rcms:PlayerThink(player, curTime, infoTable)
    local wounds = rcms:GetWoundTable(player);
    for k, v in pairs(wounds) do
        if (v == "WOUND_LEGL_BLACKED") or (v == "WOUND_LEGR_BLACKED") then
            infoTable.walkSpeed = 1;
            infoTable.runSpeed = 1;
            break;
        else
            if (v != "SE_PAINKILLER") then
                if (v == "WOUND_LEGL_SPRAIN") or (v == "WOUND_LEGR_SPRAIN") then
                    infoTable.walkSpeed = 75;
                    infoTable.runSpeed = 100;
                end;
                if (v == "WOUND_LEGL_BREAK") or (v == "WOUND_LEGR_BREAK") then
                    infoTable.walkSpeed = 50;
                    infoTable.runSpeed = 25;
                end;
            else
                infoTable.walkSpeed = Clockwork.config:Get("walk_speed"):Get();
                infoTable.runSpeed = Clockwork.config:Get("run_speed"):Get();
            end;
        end;
    end;

    if (!Clockwork.limb:IsAnyDamaged(player)) then
        player:SetHealth(player:GetMaxHealth());
    end;
end;