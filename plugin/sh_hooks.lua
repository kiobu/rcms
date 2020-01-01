local HITGROUP_RIGHTARM = HITGROUP_RIGHTARM;
local HITGROUP_RIGHTLEG = HITGROUP_RIGHTLEG;
local HITGROUP_LEFTARM = HITGROUP_LEFTARM;
local HITGROUP_LEFTLEG = HITGROUP_LEFTLEG;
local HITGROUP_STOMACH = HITGROUP_STOMACH;
local HITGROUP_CHEST = HITGROUP_CHEST;
local HITGROUP_HEAD = HITGROUP_HEAD;

local SPRAIN = SPRAIN;

function rcms:PlayerThink(player, curTime, infoTable)
    local wounds = rcms:GetWoundTable(player);
    for k, v in pairs(wounds) do
        if (v == "WOUND_SPRAIN") then
            infoTable.walkSpeed = 50;
            infoTable.runSpeed = 100;
        end;
    end
end;

