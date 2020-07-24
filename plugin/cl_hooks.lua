function rcms:RenderScreenspaceEffects()
    if (Clockwork.Client:GetSharedVar("isOnMorphine")) then
        DrawSharpen(1.5,1.2)
    else
        return
    end;
end;