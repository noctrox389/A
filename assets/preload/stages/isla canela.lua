function onCreate()
	-- background shit
    makeAnimatedLuaSprite('stageback', '0error sin color', 0, 0); 
    addAnimationByPrefix('stageback', 'f', 'Bg Sky', 24, false);
	scaleObject('stageback', 5.9, 5.9);
	addLuaSprite('stageback', false); 
	
    makeAnimatedLuaSprite('15', '0error sin color', 0, 0); 
    addAnimationByPrefix('15', '3', 'Bg Ocean', 24, false);
	scaleObject('15', 5.9, 5.9);
	addLuaSprite('15', false); 

	makeAnimatedLuaSprite('2', '0error sin color', 0, 0); 
    addAnimationByPrefix('2', '2', 'Bg Wave0', 24, true);
	scaleObject('2', 5.9, 5.9);
	addLuaSprite('2', false);
	
	makeAnimatedLuaSprite('verde1', 'error', 0, 0); 
	setProperty('verde1.visible', false);
    addAnimationByPrefix('verde1', 'f', 'Bg Sky', 24, false);
	scaleObject('verde1', 5.9, 5.9);
	addLuaSprite('verde1', false); 
	
    makeAnimatedLuaSprite('16', 'error', 0, 0); 
	setProperty('16.visible', false);
    addAnimationByPrefix('16', '3', 'Bg Ocean', 24, false);
	scaleObject('16', 5.9, 5.9);
	addLuaSprite('16', false); 

	makeAnimatedLuaSprite('28', 'error', 0, 0);
	setProperty('28.visible', false);	
    addAnimationByPrefix('28', '2', 'Bg Wave0', 24, true);
	scaleObject('28', 5.9, 5.9);
	addLuaSprite('28', false);


end

function onEvent(name,value1,value2)
	if name == 'missigno cambio' then 
		
		if value1 == '2' then
			setProperty('verde1.visible', true);
			setProperty('16.visible', true);
			setProperty('28.visible', true);			
			setProperty('stageback.visible', false);
			setProperty('15.visible', false);
			setProperty('2.visible', false);
		end	

		if value1 == 'si' then
			setProperty('dad.visible', true);
		end
	end
end