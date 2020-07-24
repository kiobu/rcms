local PLUGIN = PLUGIN;

PLUGIN:SetGlobalAlias("rcms");

Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_player.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_chatbox.lua");

rcms.statusChatMod = {}

function rcms:Normalize(value, min, max)
    local normalized = (value - min) / (max - min)
    return normalized;
end;

function rcms:AddToStatusTable(localized, chatType)
    rcms.statusChatMod[localized] = chatType;
end;

function table.contains(table, element)
    for key, value in pairs(table) do
        if value == element then
            return key
        end
    end
    return false
end

function table.countOccurences(table)
    local occ = {}
    for k, v in pairs(table) do
        if (occ[v] and occ[v] > 1) then
            occ[v] = occ[v] + 1
        elseif (!occ[v]) then  
            occ[v] = 1
        end;
    end;
end 