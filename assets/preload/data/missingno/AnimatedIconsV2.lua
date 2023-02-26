-- Animated Dad Icon
function onCreatePost()
    makeAnimatedLuaSprite('dadnameIcon', 'icons/MissingnoIcons', getProperty('iconP2.x'), getProperty('iconP2.y'))
    addAnimationByPrefix('dadnameIcon', 'Netrual', 'missingno icons', 24, false);
    addAnimationByPrefix('dadnameIcon', 'Losing', 'missingno icons', 24, false);
    addAnimationByPrefix('dadnameIcon', 'Winning', 'missingno icons', 24, false);
    setObjectCamera('dadnameIcon', 'hud')
    addLuaSprite('dadnameIcon', true)
    setObjectOrder('dadnameIcon', getObjectOrder('iconP2') + 1)
end

function onUpdate()
    if getProperty('health') < 0.4 then
		objectPlayAnimation('dadnameIcon', 'Winning', false)
	end
	if getProperty('health') > 0.4 and getProperty('health') < 1.61 then 
		objectPlayAnimation('dadnameIcon', 'Netrual', false)
	end

	if getProperty('health') > 1.61 then
		objectPlayAnimation('dadnameIcon', 'Losing', false)
	end

    if dadName == 'dad' then
        setProperty('iconP2.visible', false)
        setProperty('dadnameIcon.visible', true)
    elseif dadName ~= 'dad' then
        setProperty('iconP2.visible', false)
        setProperty('dadnameIcon.visible', true)
    end
end

function onUpdatePost(elapsed)
    setProperty('dadnameIcon.x', getProperty('iconP2.x'))
    setProperty('dadnameIcon.angle', getProperty('iconP2.angle'))
    setProperty('dadnameIcon.y', getProperty('iconP2.y'))
    setProperty('dadnameIcon.scale.x', getProperty('iconP2.scale.x'))
    setProperty('dadnameIcon.scale.y', getProperty('iconP2.scale.y'))
end