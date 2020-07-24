local HITGROUP_RIGHTARM = HITGROUP_RIGHTARM;
local HITGROUP_RIGHTLEG = HITGROUP_RIGHTLEG;
local HITGROUP_LEFTARM = HITGROUP_LEFTARM;
local HITGROUP_LEFTLEG = HITGROUP_LEFTLEG;
local HITGROUP_STOMACH = HITGROUP_STOMACH;
local HITGROUP_CHEST = HITGROUP_CHEST;
local HITGROUP_HEAD = HITGROUP_HEAD;

function rcms:ClockworkAddSharedVars(t, playerVars)
    playerVars:Bool("isOnMorphine", true);
    playerVars:Bool("isOnAdrenaline", true);
end;

function rcms:CalculateFallInjuries(player, damageInfo) -- hitGroup will always return 0 for HITGROUP_GENERIC because CalculateFallInjuries is only called once.

    local damageInflicted = math.ceil(damageInfo:GetDamage())

    -- local LeftLegHealth = Clockwork.limb:GetDamage(player, HITGROUP_LEFTLEG, false)
    -- local RightLegHealth = Clockwork.limb:GetDamage(player, HITGROUP_RIGHTLEG, false)
    local LeftLeg = Clockwork.injury:GetHitgroupName(HITGROUP_LEFTLEG)
    local RightLeg = Clockwork.injury:GetHitgroupName(HITGROUP_RIGHTLEG)

    --[[
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
    ]]--

    if (damageInflicted >= 20 and damageInflicted < 50) then
        Clockwork.injury:DevelopInjuries(player, 1, LeftLeg, true)
        Clockwork.injury:DevelopInjuries(player, 1, RightLeg, true)
    elseif (damageInflicted >= 50 and damageInflicted < 100) then
        Clockwork.injury:DevelopInjuries(player, 2, LeftLeg, true)
        Clockwork.injury:DevelopInjuries(player, 2, RightLeg, true)
    elseif (damageInflicted == 100) then -- probably never called because 100 damage would kill the player, but just in case, get the worst injury and apply it.
        Clockwork.injury:DevelopInjuries(player, 99, LeftLeg, true)
        Clockwork.injury:DevelopInjuries(player, 99, RightLeg, true)  
    end;           
end;

function rcms:CalculateGunshotInjuries(player, damageInfo, hitGroup)
    -- if hitGroup returns 0 (generic), that means the attacker damaged the victim in >1 places in one function call. ie. hit with a shotgun in multiple hitgroups.
    -- when this happens, we should just apply injuries to the chest.
    if (hitGroup == HITGROUP_GENERIC) then
        hitGroup = HITGROUP_CHEST
    end;
    
    local limbH = Clockwork.limb:GetHealth(player, hitGroup, false)

    local scw = false;
    if (hitGroup == HITGROUP_CHEST) then
        local n = math.random(5)
        if (n == 1) then
            scw = true;
        end;
    end;

    if (limbH <= 80) then -- only apply injuries when the limb health is below 80%.
        if (Clockwork.config:Get("armor_chest_only"):Get()) then
            if (hitGroup != HITGROUP_CHEST) then
                Clockwork.injury:ApplyInjuryNotify(player, "GSW", Clockwork.injury:GetHitgroupName(hitGroup));
            else
                if (player:Armor() <= 0) then
                    Clockwork.injury:ApplyInjuryNotify(player, "GSW", Clockwork.injury:GetHitgroupName(hitGroup));
                    if (scw) then
                        Clockwork.injury:ApplyInjuryNotify(player, "SCW", Clockwork.injury:GetHitgroupName(hitGroup));
                    end;
                end;
            end;
        else
            if (player:Armor() <= 0) then
                Clockwork.injury:ApplyInjuryNotify(player, "GSW", Clockwork.injury:GetHitgroupName(hitGroup));
                if (scw) then
                    Clockwork.injury:ApplyInjuryNotify(player, "SCW", Clockwork.injury:GetHitgroupName(hitGroup));
                end;
            end;
        end;
    end;
end;

