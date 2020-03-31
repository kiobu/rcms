-- Disable automatic health regeneration.
function rcms:PlayerShouldHealthRegenerate(player)
	return false;
end;

function rcms:PlayerCharacterInitialized(player)
	print("Char initialized.")
	--if (!Clockwork.injury:GetInjuryTable(player)) then
		print("Character does not have an injury table.")
		Clockwork.injury:CreateInjuryTable(player)
	-- end;
end;

-- Calculate wounds for fall damage.
function rcms:PlayerTakeDamage(player, inflictor, attacker, hitGroup, damageInfo)
    if (player:Alive()) then
		if (damageInfo:IsFallDamage()) then
			print("We should now enter calculate fall injuries!")
			rcms:CalculateFallInjuries(player);
		end;
    end;
end;