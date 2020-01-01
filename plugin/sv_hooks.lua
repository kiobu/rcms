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
                if (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
                    Clockwork.player:Notify(player, "Your left ankle sprain has developed into a break. Your movement speed has severely decreased.")
                    rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
                    rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
                elseif (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
                    Clockwork.player:Notify(player, "Your right ankle sprain has developed into a break. Your movement speed has severely decreased.")
                    rcms:ApplyWound(player, "WOUND_LEGR_BREAK")
                    rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")  
                else
                    if (rand <= 10) then
                        Clockwork.player:Notify(player, "You have sprained your left ankle. Your movement speed has decreased.")
                        rcms:ApplyWound(player, "WOUND_LEGL_SPRAIN")
                    else
                        Clockwork.player:Notify(player, "You have sprained your right ankle. Your movement speed has decreased.")
                        rcms:ApplyWound(player, "WOUND_LEGR_SPRAIN")    
                    end;
                end;
            end;
        elseif ((normal >= 0.45) and (normal < 0.55)) then
            if (rand <= 40) then
                if (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
                    Clockwork.player:Notify(player, "Your left ankle sprain has developed into a break. Your movement speed has severely decreased.")
                    rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
                    rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
                elseif (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
                    Clockwork.player:Notify(player, "Your right ankle sprain has developed into a break. Your movement speed has severely decreased.")
                    rcms:ApplyWound(player, "WOUND_LEGR_BREAK")
                    rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")  
                else
                    if (rand <= 20) then
                        Clockwork.player:Notify(player, "You have sprained your left ankle. Your movement speed has decreased.")
                        rcms:ApplyWound(player, "WOUND_LEGL_SPRAIN")
                    else
                        Clockwork.player:Notify(player, "You have sprained your right ankle. Your movement speed has decreased.")
                        rcms:ApplyWound(player, "WOUND_LEGR_SPRAIN")   
                    end; 
                end;
            end;
        elseif (normal >= 0.55) then
            if (rand <= 50) then
                if (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
                    Clockwork.player:Notify(player, "Your left ankle sprain has developed into a break. Your movement speed has severely decreased.")
                    rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
                    rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
                elseif (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
                    Clockwork.player:Notify(player, "Your right ankle sprain has developed into a break. Your movement speed has severely decreased.")
                    rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
                    rcms:ApplyWound(player, "WOUND_LEGR_BREAK")
                else
                    if (rand <= 25) then
                        Clockwork.player:Notify(player, "You have broken your left leg. Your movement speed has severely decreased.")
                        rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
                    else
                        Clockwork.player:Notify(player, "You have broken your right leg. Your movement speed has severely decreased.")
                        rcms:ApplyWound(player, "WOUND_LEGR_BREAK") 
                    end;
                end;
            end;
        end;
    end;
end;