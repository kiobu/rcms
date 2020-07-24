local ITEM = Clockwork.item:New();

ITEM.name = "Morphine Autoinjector";
ITEM.uniqueID = "rcms_morphine";
ITEM.model = "models/Items/Flare.mdl";
ITEM.weight = 1;
ITEM.useText = "Apply to self";
ITEM.category = "Medical"
ITEM.business = false;
ITEM.useSound = "items/medshot4.wav";
ITEM.description = "A morphine syringe of 10mg/mL. Used as a pain reliever.";
ITEM.customFunctions = {"Apply to other"};

rcms:AddToStatusTable("STATUS_STATUS_EFFECTS_MORPHINE", "medical_green")

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
    player:SetSharedVar("isOnMorphine", true)
    Clockwork.injury:ApplyInjury(player, "MORPHINE", "STATUS_EFFECTS")
    Clockwork.chatBox:Add(player, nil, "medical_green", {"ActionMorphineUsedOnSelf"});
    timer.Simple(10, function() 
        Clockwork.injury:RemoveInjury(player, "MORPHINE", "STATUS_EFFECTS")
        Clockwork.chatBox:Add(player, nil, "medical_info", {"ActionMorphineEnd"});
        player:SetSharedVar("isOnMorphine", false) 
    end)
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnCustomFunction(player, name)
    if (name == "Apply to other") then
	end;
end;

ITEM:Register();