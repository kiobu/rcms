--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "SAM Splint";
ITEM.uniqueID = "rcms_splint";
ITEM.model = "models/Items/Flare.mdl";
ITEM.weight = 1;
ITEM.useText = "Apply to self";
ITEM.category = "Medical"
ITEM.business = false;
ITEM.useSound = "items/medshot4.wav";
ITEM.description = "A standard-issue SAM splint, used to remedy sprained or broken bones.";
ITEM.customFunctions = {"Apply to other"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
    if (rcms:HasWound(player, "WOUND_LEGL_BREAK")) then
        rcms:RemoveWound(player, "WOUND_LEGL_BREAK")
        Clockwork.player:Notify(player, {"ActionSplintUsedOnSelf", "left"})
        Clockwork.limb:HealDamage(player, rcms.HITGROUP_LEFTLEG, 100-(Clockwork.limb:GetHealth(player, rcms.HITGROUP_LEFTLEG, false)))

    elseif (rcms:HasWound(player, "WOUND_LEGR_BREAK")) then
        rcms:RemoveWound(player, "WOUND_LEGR_BREAK")
        Clockwork.player:Notify(player, {"ActionSplintUsedOnSelf", "right"})
        Clockwork.limb:HealDamage(player, rcms.HITGROUP_RIGHTLEG, 100-(Clockwork.limb:GetHealth(player, rcms.HITGROUP_RIGHTLEG, false)))

    elseif (rcms:HasWound(player, "WOUND_LEGL_SPRAIN")) then
        rcms:RemoveWound(player, "WOUND_LEGL_SPRAIN")
        Clockwork.player:Notify(player, {"ActionSplintUsedOnSelf", "left"})
        Clockwork.limb:HealDamage(player, rcms.HITGROUP_LEFTLEG, 100-(Clockwork.limb:GetHealth(player, rcms.HITGROUP_LEFTLEG, false)))

    elseif (rcms:HasWound(player, "WOUND_LEGR_SPRAIN")) then
        rcms:RemoveWound(player, "WOUND_LEGR_SPRAIN")
        Clockwork.player:Notify(player, {"ActionSplintUsedOnSelf", "right"})
        Clockwork.limb:HealDamage(player, rcms.HITGROUP_RIGHTLEG, 100-(Clockwork.limb:GetHealth(player, rcms.HITGROUP_RIGHTLEG, false)))

    else
        Clockwork.player:Notify(player, "You have no injuries that a splint can be useful for.")
        return;
    end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnCustomFunction(player, name)
    if (name == "Apply to other") then
        local target = player:GetEyeTraceNoCursor().Entity; 
    
        if (target:GetPos():Distance( player:GetShootPos() ) <= 64) then
            local targetID = Clockwork.player:FindByID(target)
            if (!targetID) then
                Clockwork.player:Notify("You are not looking at a player.")
                return;
            end;
            if (rcms:HasWound(targetID, "WOUND_LEGL_BREAK")) then
                rcms:RemoveWound(targetID, "WOUND_LEGL_BREAK")
                Clockwork.player:Notify(player, {"ActionSplintUsedOnTarget", "left"})
                Clockwork.player:Notify(targetID, {"ActionSplintUsedOnSelf", "left"})
                Clockwork.limb:HealDamage(targetID, rcms.HITGROUP_LEFTLEG, 100-(Clockwork.limb:GetHealth(player, rcms.HITGROUP_LEFTLEG, false)))

            elseif (rcms:HasWound(targetID, "WOUND_LEGR_BREAK")) then
                rcms:RemoveWound(targetID, "WOUND_LEGR_BREAK")
                Clockwork.player:Notify(player, {"ActionSplintUsedOnTarget", "right"})
                Clockwork.player:Notify(targetID, {"ActionSplintUsedOnSelf", "right"})
                Clockwork.limb:HealDamage(targetID, rcms.HITGROUP_RIGHTLEG, 100-(Clockwork.limb:GetHealth(player, rcms.HITGROUP_RIGHTLEG, false)))

            elseif (rcms:HasWound(targetID, "WOUND_LEGL_SPRAIN")) then
                rcms:RemoveWound(targetID, "WOUND_LEGL_SPRAIN")
                Clockwork.player:Notify(player, {"ActionSplintUsedOnTarget", "left"})
                Clockwork.player:Notify(targetID, {"ActionSplintUsedOnSelf", "left"})
                Clockwork.limb:HealDamage(targetID, rcms.HITGROUP_LEFTLEG, 100-(Clockwork.limb:GetHealth(player, rcms.HITGROUP_LEFTLEG, false)))

            elseif (rcms:HasWound(targetID, "WOUND_LEGR_SPRAIN")) then
                rcms:RemoveWound(targetID, "WOUND_LEGR_SPRAIN")
                Clockwork.player:Notify(player, {"ActionSplintUsedOnTarget", "right"})
                Clockwork.player:Notify(targetID, {"ActionSplintUsedOnSelf", "right"})
                Clockwork.limb:HealDamage(targetID, rcms.HITGROUP_RIGHTLEG, 100-(Clockwork.limb:GetHealth(player, rcms.HITGROUP_RIGHTLEG, false)))

            else
                Clockwork.player:Notify(player, "Your target has no injuries that a splint can be useful for.")
                return;
            end;
        else
            Clockwork.player:Notify("You are too far away from the target to use this splint.")
            return;
        end;
	end;
end;

ITEM:Register();