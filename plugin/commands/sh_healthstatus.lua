local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("HealthStatus");

COMMAND.tip = "Check your health status.";
COMMAND.alias = {"stat", "hs"};

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
        Clockwork.player:Notify(player, {"StatusNoInjuries"})
    else
        for k, v in ipairs(arr) do
            Clockwork.player:Notify(player, {v}, true, Clockwork.option:GetKey("info_text_red_icon"))
        end;  
    end;
end;

COMMAND:Register();
