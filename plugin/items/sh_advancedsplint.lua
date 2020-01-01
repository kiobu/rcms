--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Advanced Splint";
ITEM.uniqueID = "rcms_advsplint";
ITEM.model = "models/Items/combine_rifle_ammo01.mdl";
ITEM.weight = 1;
ITEM.useText = "Apply to self";
ITEM.category = "Medical"
ITEM.business = false;
ITEM.useSound = "items/medshot4.wav";
ITEM.description = "An advanced, hospital-grade splint and cast. Used to remedy completely fractured, 'blacked' bones.";
ITEM.customFunctions = {"Apply to other"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
    if (rcms:HasWound(player, "WOUND_LEGL_BLACKED")) then
        rcms:RemoveWound(player, "WOUND_LEGL_BLACKED")
        Clockwork.player:Notify(player, {"ActionSplintUsedOnSelf", "left"})

    elseif (rcms:HasWound(player, "WOUND_LEGR_BLACKED")) then
        rcms:RemoveWound(player, "WOUND_LEGR_BLACKED")
        Clockwork.player:Notify(player, {"ActionSplintUsedOnSelf", "right"})

    else
        Clockwork.player:Notify(player, "You have no injuries that an advanced splint can be useful for.")
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
            if (rcms:HasWound(targetID, "WOUND_LEGL_BLACKED")) then
                rcms:RemoveWound(targetID, "WOUND_LEGL_BLACKED")
                Clockwork.player:Notify(player, {"ActionSplintUsedOnTarget", "left"})
                Clockwork.player:Notify(targetID, {"ActionSplintUsedOnSelf", "left"})

            elseif (rcms:HasWound(targetID, "WOUND_LEGR_BLACKED")) then
                rcms:RemoveWound(targetID, "WOUND_LEGR_BLACKED")
                Clockwork.player:Notify(player, {"ActionSplintUsedOnTarget", "right"})
                Clockwork.player:Notify(targetID, {"ActionSplintUsedOnSelf", "right"})

            else
                Clockwork.player:Notify(player, "Your target has no injuries that an advanced splint can be useful for.")
                return;
            end;
        else
            Clockwork.player:Notify("You are too far away from the target to use this advanced splint.")
            return;
        end;
	end;
end;

ITEM:Register();