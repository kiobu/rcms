local PLUGIN = PLUGIN;

PLUGIN:SetGlobalAlias("rcms");

Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_player.lua");

function rcms:Normalize(value, min, max)
    local normalized = (value - min) / (max - min)
    return normalized;
end;

