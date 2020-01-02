--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

local PLUGIN = PLUGIN;

PLUGIN:SetGlobalAlias("rcms");

rcms.HITGROUP_RIGHTARM = HITGROUP_RIGHTARM;
rcms.HITGROUP_RIGHTLEG = HITGROUP_RIGHTLEG;
rcms.HITGROUP_LEFTARM = HITGROUP_LEFTARM;
rcms.HITGROUP_LEFTLEG = HITGROUP_LEFTLEG;
rcms.HITGROUP_STOMACH = HITGROUP_STOMACH;
rcms.HITGROUP_CHEST = HITGROUP_CHEST;
rcms.HITGROUP_HEAD = HITGROUP_HEAD;

Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_player.lua");
Clockwork.kernel:IncludePrefixed("language/sh_english.lua");

rcms.BleedRate = 3;
rcms.BleedAmount = 1;

function rcms:Normalize(value, min, max)
    local normalized = (value - min) / (max - min)
    return normalized;
end;

function rcms:LText(woundType)
	if (woundType) then
		if (woundType == "WOUND_LEGL_SPRAIN") then
			return {"StatusLegSprained", "left"};
		elseif (woundType == "WOUND_LEGR_SPRAIN") then
			return {"StatusLegSprained", "right"};
		elseif (woundType == "WOUND_LEGL_BREAK") then
			return {"StatusLegBroken", "left"};
		elseif (woundType == "WOUND_LEGR_BREAK") then
			return {"StatusLegBroken", "right"};
		elseif (woundType == "WOUND_LEGL_BLACKED") then
			return {"StatusLegBlacked", "left"}
		elseif (woundType == "WOUND_LEGR_BLACKED") then
			return {"StatusLegBlacked", "right"};
		elseif (woundType == "SE_PAINKILLER") then
			return {"StatusOnMorphine"};
		end;
	end;
end;