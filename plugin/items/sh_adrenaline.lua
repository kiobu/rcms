local ITEM = Clockwork.item:New();

ITEM.name = "Adrenaline Autoinjector";
ITEM.uniqueID = "rcms_adrenaline";
ITEM.model = "models/Items/Flare.mdl";
ITEM.weight = 1;
ITEM.useText = "Apply to self";
ITEM.category = "Medical"
ITEM.business = false;
ITEM.useSound = "items/medshot4.wav";
ITEM.description = "An autoinjector containing a liberal amount of epinephrine, also known as adrenaline. For 300 seconds, you will be faster, stronger, and less susceptible to injuries.";
ITEM.customFunctions = {"Apply to other"};

rcms:AddToStatusTable("STATUS_STATUS_EFFECTS_ADRENALINE", "medical_green")

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
    Clockwork.injury:ApplyInjury(player, "ADRENALINE", "STATUS_EFFECTS")
    Clockwork.chatBox:Add(player, nil, "medical_green", {"ActionAdrenalineUsedOnSelf"});
    player:SetCharacterData("Stamina", 100);
	
	player:BoostAttribute(self.name, ATB_AGILITY, 2, 300);
    player:BoostAttribute(self.name, ATB_STAMINA, 5, 300);
    player:BoostAttribute(self.name, ATB_ENDURANCE, 5, 300);
    player:SetSharedVar("isOnAdrenaline", true);

    timer.Simple(300, function() 
        Clockwork.injury:RemoveInjury(player, "ADRENALINE", "STATUS_EFFECTS")
        Clockwork.chatBox:Add(player, nil, "medical_info", {"ActionAdrenalineEnd"});
        player:SetSharedVar("isOnAdrenaline", false)
    end)
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnCustomFunction(player, name)
    if (name == "Apply to other") then
	end;
end;

ITEM:Register();