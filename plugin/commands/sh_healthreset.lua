--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("HealthReset");

COMMAND.tip = "Reset a player's injuries and wounds.";
COMMAND.access = "a";
COMMAND.alias = {"hr"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
    local target = Clockwork.player:FindByID(arguments[1])
    rcms:RemoveAllWounds(target)
    Clockwork.player:Notify(player, target:Name().."'s wounds have been reset.")
    Clockwork.player:Notify(target, "Your wounds have been reset.")
end;

COMMAND:Register();
