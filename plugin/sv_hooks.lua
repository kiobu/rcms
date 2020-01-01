-- Disable automatic health regeneration.
function rcms:PlayerShouldHealthRegenerate(player)
	return false;
end;

-- Calculate wounds for fall damage.
function rcms:PlayerTakeDamage(player, inflictor, attacker, hitGroup, damageInfo)
    if (player:Alive()) then
    if (damageInfo:IsFallDamage()) then

        local rand = math.random(0,100)
        local wounds = rcms:GetWoundTable(player)

        local LEFTLEG = Clockwork.limb:GetHealth(player, rcms.HITGROUP_LEFTLEG, false)
        local RIGHTLEG = Clockwork.limb:GetHealth(player, rcms.HITGROUP_RIGHTLEG, false)

        print("DamageL: "..LEFTLEG)
        print("DamageR: "..RIGHTLEG)
        PrintTable(player:GetCharacterData("LimbData"));

        if (LEFTLEG <= 70 and LEFTLEG >= 50) then
            if (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
                Clockwork.player:Notify(player, {"ActionLegSprainToBreak", "left"})
                rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
            else 
                Clockwork.player:Notify(player, {"ActionLegSprained", "left"})
                rcms:ApplyWound(player, "WOUND_LEGL_SPRAIN")
            end;
        end;
        if (RIGHTLEG <= 70 and RIGHTLEG >= 50) then
            if (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
                Clockwork.player:Notify(player, {"ActionLegSprainToBreak", "right"})
                rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGR_BREAK")
            else 
                Clockwork.player:Notify(player, {"ActionLegSprained", "right"})
                rcms:ApplyWound(player, "WOUND_LEGR_SPRAIN")
            end;
        end;
        if (LEFTLEG < 50) then
            if (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
                Clockwork.player:Notify(player, {"ActionLegSprainToBreak", "left"})
                rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
            else 
                Clockwork.player:Notify(player, {"ActionLegBroken", "left"})
                rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
            end;
        end;
        if (RIGHTLEG < 50) then
            if (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
                Clockwork.player:Notify(player, {"ActionLegSprainToBreak", "right"})
                rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGR_BREAK")
            else 
                Clockwork.player:Notify(player, {"ActionLegBroken", "right"})
                rcms:ApplyWound(player, "WOUND_LEGR_BREAK")
            end;
        end;
    end;
    end;
end;

        --[[
        --local normal = rcms:Normalize(vel, 0, 1500);
        if ((normal >= 0.33) and (normal < 0.45)) then
            if (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
                Clockwork.player:Notify(player, "Your left ankle sprain has developed into a break. Your movement speed has severely decreased.")
                rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
            elseif (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
                Clockwork.player:Notify(player, "Your right ankle sprain has developed into a break. Your movement speed has severely decreased.")
                rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGR_BREAK")        
            else
                if (rand <= 20) then
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
            if (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
                Clockwork.player:Notify(player, "Your left ankle sprain has developed into a break. Your movement speed has severely decreased.")
                rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
            elseif (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
                Clockwork.player:Notify(player, "Your right ankle sprain has developed into a break. Your movement speed has severely decreased.")
                rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGR_BREAK")  
            else
                if (rand <= 40) then
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
            if (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
                Clockwork.player:Notify(player, "Your left ankle sprain has developed into a break. Your movement speed has severely decreased.")
                rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
            elseif (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
                Clockwork.player:Notify(player, "Your right ankle sprain has developed into a break. Your movement speed has severely decreased.")
                rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
                rcms:ApplyWound(player, "WOUND_LEGR_BREAK")
            else
                if (rand <= 50) then
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

]]