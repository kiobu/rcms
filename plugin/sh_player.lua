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
    if (table != nil) then
        table.RemoveByValue(wounds, woundType);
        player:SetCharacterData("Wounds", wounds);
    end;
end;