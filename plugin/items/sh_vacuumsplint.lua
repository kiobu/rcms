--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Vacuum Splint";
ITEM.uniqueID = "rcms_vacuumsplint";
ITEM.model = "models/Items/combine_rifle_ammo01.mdl";
ITEM.weight = 1;
ITEM.useText = "Apply to other";
ITEM.category = "Medical"
ITEM.business = false;
ITEM.useSound = "items/medshot4.wav";
ITEM.description = "A vacuum splint used to treat compound fractures.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
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
            Clockwork.player:Notify(player, "Your target has no injuries that a vacuum splint can be useful for.")
            return;
        end;
    else
        Clockwork.player:Notify("You are too far away from the target to use this vacuum splint.")
        return;
    end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();