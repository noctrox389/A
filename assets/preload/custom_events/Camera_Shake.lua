function onEvent(tag,v1,v2)
    if tag=='Camera_Shake' then
        cameraShake('Game', tonumber(v1), tonumber(v2))   
    end

end