local ITEM = Clockwork.item:New();

ITEM.name = "Occlusive Bandage";
ITEM.uniqueID = "rcms_occlusive";
ITEM.model = "models/fallout/components/box.mdl";
ITEM.weight = 1;
ITEM.useText = "Apply to self";
ITEM.category = "Medical"
ITEM.business = false;
ITEM.useSound = "items/medshot4.wav";
ITEM.description = "An occlusive bandage. Used to treat sucking chest wounds that would cause a pneumothorax.";
ITEM.customFunctions = {"Apply to other"};

rcms:AddToStatusTable("STATUS_HITGROUP_CHEST_SCW_TREATED", "medical_info")

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
    if (Clockwork.injury:HasInjury(player, "SCW", "HITGROUP_CHEST")) then
        Clockwork.injury:RemoveInjury(player, "SCW", "HITGROUP_CHEST")
        Clockwork.injury:ApplyInjuryNotify(player, "SCW_TREATED", "HITGROUP_CHEST")
    else
        Clockwork.player:Notify(player, "You do not have a sucking chest wound.")
    end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnCustomFunction(player, name)
    if (name == "Apply to other") then
        local target = player:GetEyeTraceNoCursor().Entity; 
        local targetID = Clockwork.entity:GetPlayer(target);
        
        if (target:GetPos():Distance( player:GetShootPos() ) <= 192) then
            if (!targetID) then
                Clockwork.player:Notify(player, "You are not looking at a player.")
            else
                if (Clockwork.injury:HasInjury(targetID, "SCW", "HITGROUP_CHEST")) then
                    Clockwork.injury:RemoveInjury(targetID, "SCW", "HITGROUP_CHEST")
                    Clockwork.injury:ApplyInjuryNotify(targetID, "SCW_TREATED", "HITGROUP_CHEST")
                else
                    Clockwork.player:Notify(player, "The patient does not have a sucking chest wound.")
                end;
            end;
        else
            Clockwork.player:Notify(player, "You are too far away from the target.")
            return;
        end;
	end;
end;

ITEM:Register();