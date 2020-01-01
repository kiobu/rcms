--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

local PLUGIN = PLUGIN;

PLUGIN:SetGlobalAlias("rcms");

Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_player.lua");

rcms.BleedRate = 3;
rcms.BleedAmount = 1;

function rcms:Normalize(value, min, max)
    local normalized = (value - min) / (max - min)
    return normalized;
end;