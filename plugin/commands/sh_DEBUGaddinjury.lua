local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("DEBUGAddInjury");

COMMAND.tip = "DEBUGGING PURPOSES Add a sprain to the left leg.";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
    local injuries = Clockwork.injury:GetInjuryTable(player)
    Clockwork.injury:ApplyInjury(player, "SPRAIN", "HITGROUP_LEFTLEG")
end;

COMMAND:Register();
