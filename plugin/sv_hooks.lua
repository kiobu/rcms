-- Disable automatic health regeneration.
function rcms:PlayerShouldHealthRegenerate(player)
	return false;
end;

-- Calculate wounds for fall damage
function rcms:GetFallDamage(player, vel)
    if (player:Alive()) then

        local normal = rcms:Normalize(vel, 0, 1500);
        local rand = math.random(0,100)
        local wounds = rcms:GetWoundTable(player)

        if ((normal >= 0.33) and (normal < 0.45)) then
            if (rand <= 20) then
                if (rcms:HasWound(player, "WOUND_SPRAIN")) then
                    Clockwork.player:Notify(player, "Your sprain has developed into a break. Your movement speed has severely decreased.")
                    rcms:ApplyWound(player, "WOUND_BROKEN_LEG")
                    rcms:RemoveWound(player, "WOUND_SPRAIN")
                else
                    Clockwork.player:Notify(player, "You have sprained your ankle. Your movement speed has decreased.")
                    rcms:ApplyWound(player, "WOUND_SPRAIN")
                end;
            end;
        elseif ((normal >= 0.45) and (normal < 0.55)) then
            if (rand <= 40) then
                if (rcms:HasWound(player, "WOUND_SPRAIN")) then
                    Clockwork.player:Notify(player, "Your sprain has developed into a break. Your movement speed has severely decreased.")
                    rcms:ApplyWound(player, "WOUND_BROKEN_LEG")
                    rcms:RemoveWound(player, "WOUND_SPRAIN")
                else
                    Clockwork.player:Notify(player, "You have sprained your ankle. Your movement speed has decreased.")
                    rcms:ApplyWound(player, "WOUND_SPRAIN")
                end;
            end;
        elseif (normal >= 0.55) then
            if (rand <= 50) then
                if (rcms:HasWound(player, "WOUND_SPRAIN")) then
                    rcms:RemoveWound(player, "WOUND_SPRAIN")
                    rcms:ApplyWound(player, "WOUND_BROKEN_LEG")
                else
                    Clockwork.player:Notify(player, "You have broken your leg. Your movement speed has severely decreased.")
                    rcms:ApplyWound(player, "WOUND_BROKEN_LEG")
                end;
            end;
        end;
    end;
end;