-- Disable automatic health regeneration.
function rcms:PlayerShouldHealthRegenerate(player)
	return false;
end;

-- Calculate wounds for fall damage.
function rcms:PlayerTakeDamage(player, inflictor, attacker, hitGroup, damageInfo)
    if (player:Alive()) then
        if (damageInfo:IsFallDamage()) then
            rcms:CalculateFallWounds(player);
        end;
    end;
end;