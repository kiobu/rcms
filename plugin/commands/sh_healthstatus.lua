local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("HealthStatus");

COMMAND.tip = "Check your health status.";
COMMAND.alias = {"stat", "hs"};

CW_ENGLISH = Clockwork.lang:GetTable("English");

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
    local injuries = Clockwork.injury:GetInjuryTable(player)

    local arr = {}
    for k, v in pairs(injuries) do
        for x, y in pairs(injuries[k]) do
            if (x != 1) then
                if (y) then
                    arr[#arr+1] = "STATUS_"..injuries[k][1].."_"..y
                end;
            end;
        end;
    end;
    if (#arr == 0) then
        Clockwork.chatBox:Add(player, nil, "medical_info", {"StatusNoInjuries"});
    else
        local occ = {}
        for k, v in pairs(arr) do
            if (occ[v] and occ[v] >= 1) then
                occ[v] = occ[v] + 1
            elseif (!occ[v]) then  
                occ[v] = 1
            end;
        end;
        for k, v in pairs(occ) do
            if (rcms.statusChatMod[k]) then
                Clockwork.chatBox:Add(player, nil, rcms.statusChatMod[k], "x" .. occ[k] .. ": " .. CW_ENGLISH[k]);
            else
                Clockwork.chatBox:Add(player, nil, "medical_severe", "x" .. occ[k] .. ": " .. CW_ENGLISH[k]);
            end;
        end;  
    end;
end;

COMMAND:Register();