local HITGROUP_RIGHTARM = HITGROUP_RIGHTARM;
local HITGROUP_RIGHTLEG = HITGROUP_RIGHTLEG;
local HITGROUP_LEFTARM = HITGROUP_LEFTARM;
local HITGROUP_LEFTLEG = HITGROUP_LEFTLEG;
local HITGROUP_STOMACH = HITGROUP_STOMACH;
local HITGROUP_CHEST = HITGROUP_CHEST;
local HITGROUP_HEAD = HITGROUP_HEAD;

function rcms:GetWoundTable(player)
	local wounds = player:GetCharacterData("Wounds");
	if (wounds and istable(wounds)) then
		return wounds;
	else
		return {};
	end;
end;

function rcms:HasWound(player, woundType)
    local wounds = player:GetCharacterData("Wounds");
    if (wounds and istable(wounds)) then
        local hasWound = false;
        for k, v in pairs(wounds) do
            if (v == woundType) then
                hasWound = true;
                break;
            end;
        end;
        return hasWound;
	end;
end;

function rcms:ApplyWound(player, woundType)
    local wounds = rcms:GetWoundTable(player)
    table.insert(wounds, woundType)
    player:SetCharacterData("Wounds", wounds);
end;

function rcms:RemoveWound(player, woundType)
    local wounds = rcms:GetWoundTable(player)
    table.RemoveByValue(wounds, woundType);
    player:SetCharacterData("Wounds", wounds);
end;

function rcms:RemoveAllWounds(player)
    player:SetCharacterData("Wounds", {});
end;

function rcms:CalculateFallWounds(player)
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
        elseif (rcms:HasWound(player, "WOUND_LEGL_BREAK")) then
            Clockwork.player:Notify(player, {"ActionLegBlacked", "left"})
            rcms:RemoveWound(player, "WOUND_LEGL_BREAK")
            rcms:ApplyWound(player, "WOUND_LEGL_BLACKED")
        elseif (rcms:HasWound(player, "WOUND_LEGL_BLACKED")) then
            return;
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
        elseif (rcms:HasWound(player, "WOUND_LEGR_BREAK")) then
            Clockwork.player:Notify(player, {"ActionLegBlacked", "right"})
            rcms:RemoveWound(player, "WOUND_LEGR_BREAK")
            rcms:ApplyWound(player, "WOUND_LEGR_BLACKED")
        elseif (rcms:HasWound(player, "WOUND_LEGL_BLACKED")) then
            return;
        else
            Clockwork.player:Notify(player, {"ActionLegSprained", "right"})
            rcms:ApplyWound(player, "WOUND_LEGR_SPRAIN")
        end;
    end;
    if (LEFTLEG < 50 and LEFTLEG > 0) then
        if (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
            Clockwork.player:Notify(player, {"ActionLegSprainToBreak", "left"})
            rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
            rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
        elseif (rcms:HasWound(player, "WOUND_LEGL_BREAK")) then
            Clockwork.player:Notify(player, {"ActionLegBlacked", "left"})
            rcms:RemoveWound(player, "WOUND_LEGL_BREAK")
            rcms:ApplyWound(player, "WOUND_LEGL_BLACKED")
        elseif (rcms:HasWound(player, "WOUND_LEGL_BLACKED")) then
            return;
        else 
            Clockwork.player:Notify(player, {"ActionLegBroken", "left"})
            rcms:ApplyWound(player, "WOUND_LEGL_BREAK")
        end;
    end;
    if (RIGHTLEG < 50 and RIGHTLEG > 0) then
        if (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
            Clockwork.player:Notify(player, {"ActionLegSprainToBreak", "right"})
            rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
            rcms:ApplyWound(player, "WOUND_LEGR_BREAK")
        elseif (rcms:HasWound(player, "WOUND_LEGR_BREAK")) then
            Clockwork.player:Notify(player, {"ActionLegBlacked", "right"})
            rcms:RemoveWound(player, "WOUND_LEGR_BREAK")
            rcms:ApplyWound(player, "WOUND_LEGR_BLACKED")
        elseif (rcms:HasWound(player, "WOUND_LEGL_BLACKED")) then
            return;
        else 
            Clockwork.player:Notify(player, {"ActionLegBroken", "right"})
            rcms:ApplyWound(player, "WOUND_LEGR_BREAK")
        end;
    end;
    if (RIGHTLEG == 0) then
        if (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
            Clockwork.player:Notify(player, {"ActionLegBlacked", "right"})
            rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
            rcms:ApplyWound(player, "WOUND_LEGR_BLACKED")
        elseif (rcms:HasWound(player, "WOUND_LEGR_BREAK")) then
            rcms:RemoveWound(player, "WOUND_LEGR_BREAK")
            rcms:ApplyWound(player, "WOUND_LEGR_BLACKED")
            Clockwork.player:Notify(player, {"ActionLegBlacked", "right"})
        elseif (rcms:HasWound(player, "WOUND_LEGL_BLACKED")) then
            return;
        else 
            Clockwork.player:Notify(player, {"ActionLegBlacked", "right"})
            rcms:ApplyWound(player, "WOUND_LEGR_BLACKED")
        end;
    end;
    if (LEFTLEG == 0) then
        if (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
            Clockwork.player:Notify(player, {"ActionLegBlacked", "left"})
            rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
            rcms:ApplyWound(player, "WOUND_LEGR_BLACKED")
        elseif (rcms:HasWound(player, "WOUND_LEGR_BREAK")) then
            rcms:RemoveWound(player, "WOUND_LEGR_BREAK")
            rcms:ApplyWound(player, "WOUND_LEGR_BLACKED")
            Clockwork.player:Notify(player, {"ActionLegBlacked", "left"})
        elseif (rcms:HasWound(player, "WOUND_LEGL_BLACKED")) then
            return;
        else 
            Clockwork.player:Notify(player, {"ActionLegBlacked", "left"})
            rcms:ApplyWound(player, "WOUND_LEGR_BLACKED")
        end;
    end;
end;