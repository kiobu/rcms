--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("HealthStatus");

COMMAND.tip = "Check your health status.";
COMMAND.access = "o";
COMMAND.alias = {"stat", "hs"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
    local wounds = rcms:GetWoundTable(player)
    for k, v in pairs(wounds) do
        Clockwork.player:Notify(player, rcms:LText(v))
        print(v);
    end;
end;

COMMAND:Register();
