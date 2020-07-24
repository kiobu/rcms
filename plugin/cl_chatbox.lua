Clockwork.chatBox:RegisterDefaultClass("medical_severe", "ooc", function(info)
	if (Clockwork.kernel:GetNoticePanel()) then
		Clockwork.kernel:AddCinematicText(info.text, Color(224, 67, 67), 32, 6, Clockwork.option:GetFont("menu_text_tiny"), true);
	end;
	
	local filtered = (CW_CONVAR_SHOWAURA:GetInt() == 0) or info.filtered;
	local icon = "heart_delete";
	local color = Color(224, 67, 67);
	
	local localized = Clockwork.chatBox:LangToTable("ChatPlayerNotify", color, info.text);

	Clockwork.chatBox:Add(filtered, "icon16/"..icon..".png", unpack(localized));
end);

Clockwork.chatBox:RegisterDefaultClass("medical_green", "ooc", function(info)
	if (Clockwork.kernel:GetNoticePanel()) then
		Clockwork.kernel:AddCinematicText(info.text, Color(139,186,98), 32, 6, Clockwork.option:GetFont("menu_text_tiny"), true);
	end;
	
	local filtered = (CW_CONVAR_SHOWAURA:GetInt() == 0) or info.filtered;
	local icon = "heart_add";
	local color = Color(139,186,98);
	
	local localized = Clockwork.chatBox:LangToTable("ChatPlayerNotify", color, info.text);

	Clockwork.chatBox:Add(filtered, "icon16/"..icon..".png", unpack(localized));
end);

Clockwork.chatBox:RegisterDefaultClass("medical_info", "ooc", function(info)
	if (Clockwork.kernel:GetNoticePanel()) then
		Clockwork.kernel:AddCinematicText(info.text, Color(255,144,144), 32, 6, Clockwork.option:GetFont("menu_text_tiny"), true);
	end;
	
	local filtered = (CW_CONVAR_SHOWAURA:GetInt() == 0) or info.filtered;
	local icon = "heart";
	local color = Color(255,144,144);
	
	local localized = Clockwork.chatBox:LangToTable("ChatPlayerNotify", color, info.text);

	Clockwork.chatBox:Add(filtered, "icon16/"..icon..".png", unpack(localized));
end);