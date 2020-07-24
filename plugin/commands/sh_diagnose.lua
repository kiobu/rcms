local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("Diagnose");

COMMAND.tip = "Check a patient's health status.";

CW_ENGLISH = Clockwork.lang:GetTable("English");

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)  
    
end;

COMMAND:Register();