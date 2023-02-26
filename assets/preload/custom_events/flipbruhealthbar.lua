local flipped = false;
function onEvent(name)
	if name == 'flipbruhealthbar' then
		if getProperty('healthBar.flipX') == false and flipped == false then
			setProperty('healthBar.flipX',true)
			flipped = true
		elseif flipped == true then 
			setProperty('healthBar.flipX',false)
			flipped = false 
	   end
	end
end

function onUpdatePost(elapsed)
	if getProperty('healthBar.flipX') == true then
		P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
		P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
		setProperty('iconP1.x',P1Mult - 110)
		setProperty('iconP1.origin.x',240)
		setProperty('iconP1.flipX',true)
		setProperty('iconP2.x',P2Mult + 110)
		setProperty('iconP2.origin.x',-100)
		setProperty('iconP2.flipX',true)
	else
		P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
		P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
		setProperty('iconP1.origin.x',0)
		setProperty('iconP1.flipX',false)
		setProperty('iconP2.origin.x',0)
		setProperty('iconP2.flipX',false)
	end
end