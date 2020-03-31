local HITGROUP_RIGHTARM = HITGROUP_RIGHTARM;
local HITGROUP_RIGHTLEG = HITGROUP_RIGHTLEG;
local HITGROUP_LEFTARM = HITGROUP_LEFTARM;
local HITGROUP_LEFTLEG = HITGROUP_LEFTLEG;
local HITGROUP_STOMACH = HITGROUP_STOMACH;
local HITGROUP_CHEST = HITGROUP_CHEST;
local HITGROUP_HEAD = HITGROUP_HEAD;

function rcms:ClockworkAddSharedVars(t, playerVars)
	playerVars:Bool("isOnMorphine", true);
end;

function rcms:CalculateFallInjuries(player) -- hitGroup will always return 0 for HITGROUP_GENERIC because CalculateFallInjuries is only called once.

    local LeftLegHealth = Clockwork.limb:GetHealth(player, HITGROUP_LEFTLEG, false)
    local RightLegHealth = Clockwork.limb:GetHealth(player, HITGROUP_RIGHTLEG, false)
    local LeftLeg = Clockwork.injury:GetHitgroupName(HITGROUP_LEFTLEG)
    local RightLeg = Clockwork.injury:GetHitgroupName(HITGROUP_RIGHTLEG)

    print("Calculate fall injuries!")
    if (LeftLegHealth <= 80 and LeftLegHealth >= 50) then
        Clockwork.injury:DevelopInjuries(player, 0, LeftLeg, true)
        print("Player should develop injuries now! LEFTLEG")
    end;
    if (RightLegHealth <= 80 and RightLegHealth >= 50) then
        Clockwork.injury:DevelopInjuries(player, 0, RightLeg, true)
        print("Player should develop injuries now! RIGHTLEG")
    end;
    if (LeftLegHealth < 50 and LeftLegHealth > 0) then
        Clockwork.injury:DevelopInjuries(player, 1, LeftLeg, true)
        print("Player should develop injuries now! LEFTLEG")
    end;
    if (RightLegHealth < 50 and RightLegHealth > 0) then
        Clockwork.injury:DevelopInjuries(player, 1, RightLeg, true)
        print("Player should develop injuries now! RIGHTLEG")
    end;
    if (LeftLegHealth == 0 and LeftLegHealth == 0) then
        Clockwork.injury:DevelopInjuries(player, 99, LeftLeg, true)
        print("Player should develop injuries now! LEFTLEG")
    end;
    if (RightLegHealth == 0 and RightLegHealth == 0) then
        Clockwork.injury:DevelopInjuries(player, 99, RightLeg, true)
        print("Player should develop injuries now! RIGHTLEG")
    end;
end;

