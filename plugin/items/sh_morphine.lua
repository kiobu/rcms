--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Morphine";
ITEM.uniqueID = "rcms_morphine";
ITEM.model = "models/Items/Flare.mdl";
ITEM.weight = 1;
ITEM.useText = "Apply to self";
ITEM.category = "Medical"
ITEM.business = false;
ITEM.useSound = "items/medshot4.wav";
ITEM.description = "A morphine syringe of 10mg/mL. Used as a pain reliever.";
ITEM.customFunctions = {"Apply to other"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
    if (rcms:HasWound(player, "SE_PAINKILLER")) then
        Clockwork.player:Notify(player, {"ActionMorphineUsedOnSelfDuplicate"})
        return;
    else
        rcms:ApplyWound(player, "SE_PAINKILLER")
        Clockwork.player:Notify(player, {"ActionMorphineUsedOnSelf"})
        timer.Simple(5, function() 
            rcms:RemoveWound(player, "SE_PAINKILLER")
            Clockwork.player:Notify(player, {"ActionMorphineEnd"}) 
        end)
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
            else
                if (rcms:HasWound(targetID, "SE_PAINKILLER")) then
                    Clockwork.player:Notify(targetID, {"ActionMorphineUsedOnSelfDuplicate"})
                    return;
                else
                    rcms:ApplyWound(targetID, "SE_PAINKILLER")
                    Clockwork.player:Notify(player, {"ActionMorphineUsedOnTarget"})
                    Clockwork.player:Notify(targetID, {"ActionMorphineUsedOnSelf"})
                    timer.Simple(320, function() 
                        rcms:RemoveWound(targetID, "SE_PAINKILLER") 
                        Clockwork.player:Notify(targetID, {"ActionMorphineEnd"})
                    end)
                end;
            end;
        else
            Clockwork.player:Notify("You are too far away from the target to use this splint.")
            return;
        end;
	end;
end;

ITEM:Register();