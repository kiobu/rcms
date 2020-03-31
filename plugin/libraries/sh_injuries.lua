Clockwork.injury = Clockwork.kernel:NewLibrary("Injuries");
local cwInj = Clockwork.injury;

local HITGROUP_RIGHTARM = HITGROUP_RIGHTARM;
local HITGROUP_RIGHTLEG = HITGROUP_RIGHTLEG;
local HITGROUP_LEFTARM = HITGROUP_LEFTARM;
local HITGROUP_LEFTLEG = HITGROUP_LEFTLEG;
local HITGROUP_STOMACH = HITGROUP_STOMACH;
local HITGROUP_CHEST = HITGROUP_CHEST;
local HITGROUP_HEAD = HITGROUP_HEAD;

Clockwork.injury.hitgroupnames = {
    [HITGROUP_RIGHTARM] = "HITGROUP_RIGHTARM",
    [HITGROUP_RIGHTLEG] = "HITGROUP_RIGHTLEG",
    [HITGROUP_LEFTARM]  = "HITGROUP_LEFTARM",
    [HITGROUP_LEFTLEG]  = "HITGROUP_LEFTLEG",
    [HITGROUP_STOMACH]  = "HITGROUP_STOMACH",
    [HITGROUP_CHEST]    = "HITGROUP_CHEST",
    [HITGROUP_HEAD]     = "HITGROUP_HEAD",
    [HITGROUP_GENERIC]  = "HITGROUP_GENERIC"
};

Clockwork.injury.HITGROUPS = {
    ["HITGROUP_HEAD"] = {"HITGROUP_HEAD"},
    ["HITGROUP_RIGHTARM"] = {"HITGROUP_RIGHTARM"},
    ["HITGROUP_RIGHTLEG"] = {"HITGROUP_RIGHTLEG"},
    ["HITGROUP_LEFTARM"] = {"HITGROUP_LEFTARM"},
    ["HITGROUP_LEFTLEG"] = {"HITGROUP_LEFTLEG"},
    ["HITGROUP_STOMACH"] = {"HITGROUP_STOMACH"},
    ["HITGROUP_CHEST"] = {"HITGROUP_CHEST"},
    ["STATUS_EFFECTS"] = {"STATUS_EFFECTS"}
}

Clockwork.injury.INJURIES = {
    ["HITGROUP_LEFTLEG"] = {"GSW", "BLOOD_LOSS"},
    ["HITGROUP_RIGHTLEG"] = {"GSW", "BLOOD_LOSS"},
}

Clockwork.injury.INJURIES_FALL = {
    ["HITGROUP_LEFTLEG"] = {"SPRAIN", "BREAK", "FRACTURE"},
    ["HITGROUP_RIGHTLEG"] = {"SPRAIN", "BREAK", "FRACTURE"},
}

function cwInj:GetHitgroupName(hitgroup)
    return self.hitgroupnames[hitgroup]
end;

function cwInj:CreateInjuryTable(player)
    local injuries = {};
    for k, v in pairs(Clockwork.injury.HITGROUPS) do
        injuries[k] = v
    end;
    player:SetCharacterData("Injuries", injuries)
end;

function cwInj:GetInjuryTable(player)
	local injuries = player:GetCharacterData("Injuries");
    if (istable(injuries)) then
        print("Injury table should be printed.")
		return injuries;
    else
        print("Injury table is not a table.")
		return false;
	end;
end;

function cwInj:ApplyInjury(player, type, hitgroup)
    local injuries = cwInj:GetInjuryTable(player)
    table.insert(injuries[hitgroup], type)
    player:SetCharacterData("Injuries", injuries);
end;

function cwInj:RemoveInjury(player, type, hitgroup)
    local injuries = cwInj:GetInjuryTable(player)
    table.RemoveByValue(injuries[hitgroup], type)
    player:SetCharacterData("Injuries", injuries);
end;

function cwInj:RemoveAllInjuries(player)
    cwInj:CreateInjuryTable(player)
end;

function cwInj:HasInjury(player, type, hitgroup)
    local injuries = player:GetCharacterData("Injuries");
    if (injuries and istable(injuries)) then
        local has = false;
        for k, v in pairs(injuries[hitgroup]) do
            if (v == type) then
                has = true;
                break;
            end;
        end;
        return has;
	end;
end;

function cwInj:DevelopInjuries(player, factor, hitgroup, bIsFallDamage)

    if (bIsFallDamage) then
        tab = Clockwork.injury.INJURIES_FALL
    else
        tab = Clockwork.injury.INJURIES
    end

    canDevelop = false;
    print(hitgroup)
    for k, v in ipairs(tab[hitgroup]) do
        if (cwInj:HasInjury(player, v, hitgroup)) then
            canDevelop = true;
            if (k+factor <= #tab[hitgroup]) then
                cwInj:RemoveInjury(player, v, hitgroup)
                cwInj:ApplyInjury(player, tab[hitgroup][k+factor], hitgroup)
                break;
            else
                cwInj:RemoveInjury(player, v, hitgroup)
                cwInj:ApplyInjury(player, tab[hitgroup][#tab[hitgroup]], hitgroup)
                break;
            end;
        end;
    end;
    if (!canDevelop) then
        cwInj:ApplyInjury(player, tab[hitgroup][factor+1], hitgroup)
    end;
end;