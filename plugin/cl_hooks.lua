function rcms:RenderScreenspaceEffects()
    if (Clockwork.Client:GetSharedVar("isOnMorphine")) then
        DrawSharpen(10,10)
    else
        return
    end;
end;