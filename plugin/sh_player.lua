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
    if (wounds != nil) then
        table.RemoveByValue(wounds, woundType);
        player:SetCharacterData("Wounds", wounds);
    end;
end;

function rcms:RemoveAllWounds(player)
    player:SetCharacterData("Wounds", {});
end;