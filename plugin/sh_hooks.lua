function rcms:PlayerThink(player, curTime, infoTable)
    local additive = 0;
    if (Clockwork.injury:HasInjury(player, "ADRENALINE", "STATUS_EFFECTS")) then
        additive = additive + 20;
    end;
    
    if (Clockwork.injury:HasInjury(player, "FRACTURE", "HITGROUP_LEFTLEG") and Clockwork.injury:HasInjury(player, "FRACTURE", "HITGROUP_RIGHTLEG")) then
        infoTable.walkSpeed = 1;
        infoTable.runSpeed = 1;
    else
        if (!Clockwork.injury:HasInjury(player, "MORPHINE", "STATUS_EFFECTS")) then
            if (Clockwork.injury:HasInjury(player, "SPRAIN", "HITGROUP_LEFTLEG") and Clockwork.injury:HasInjury(player, "SPRAIN", "HITGROUP_RIGHTLEG")) then
                infoTable.walkSpeed = 75;
                infoTable.runSpeed = 100;
            elseif (Clockwork.injury:HasInjury(player, "BREAK", "HITGROUP_LEFTLEG") and Clockwork.injury:HasInjury(player, "BREAK", "HITGROUP_RIGHTLEG")) then
                infoTable.walkSpeed = 33;
                infoTable.runSpeed = 33;
            else
                infoTable.walkSpeed = Clockwork.config:Get("walk_speed"):Get() + additive;
                infoTable.runSpeed = Clockwork.config:Get("run_speed"):Get() + additive;
            end;
        else
            infoTable.walkSpeed = Clockwork.config:Get("walk_speed"):Get() + additive;
            infoTable.runSpeed = Clockwork.config:Get("run_speed"):Get() + additive;
        end;
    end;

    if (!Clockwork.limb:IsAnyDamaged(player)) then -- If a player has 100 health, remove all injuries.
        player:SetHealth(player:GetMaxHealth());
        Clockwork.injury:RemoveAllInjuries(player)
    end;
end;