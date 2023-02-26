function onCreate()
  Missingno=false
  makeAnimatedLuaSprite('GengarLeave', 'characters/enter_gengar', getCharacterX('dad')+425, getCharacterY('dad')+45)
    addAnimationByIndices('GengarLeave', 'Idle', 'gengar entrance', '56,55,54,53,52,51,50,49,48',24 )
    scaleObject('GengarLeave',3.5,3.5)
    setProperty('GengarLeave.antialiasing',false)
    precacheImage('characters/leanmonster')
    
    
end
function onEvent(name, value1, value2)
    if name=='Leave' then
        if value1=='Missingno' then
            YBf=getCharacterY('bf')
            camY=cameraY
            Missingno=true
            doTweenY('DespawnMissingno', 'boyfriend', getCharacterY('bf')+901, 1.75, 'linear')
        elseif value1=='Gengar' then
         
            triggerEvent('Change Character','dad','No_GF')
            addLuaSprite('GengarLeave',false)
            playAnim('GengarLeave','Idle',true)
            runTimer('LeaveGengar',0.417,1)
        elseif value1=='Leanmonster' then
            triggerEvent('Change Character','dad','No_GF')
            makeAnimatedLuaSprite('MukLeave', 'characters/leanmonster', getCharacterX('dad')+800, getCharacterY('dad')+280)
    addAnimationByPrefix('MukLeave', 'Idle', 'Muk_Intro',24,false )
    scaleObject('MukLeave',3.5,3.5)
    setObjectOrder('MukLeave', 11)
    setProperty('MukLeave.antialiasing',false)
            addLuaSprite('MukLeave',false)
            playAnim('MukLeave', 'Idle',true,true)
            runTimer('LeaveMuk',1.458,1)
        end
    end
end
function onUpdate()
    if Missingno==true then
    setProperty('camFollowPos.y',camY)
    end
end
function onTweenCompleted(tag)
	
    if tag == 'DespawnMissingno' then
        triggerEvent('Change Character','bf','No_GF')
        setCharacterY('bf',YBf)
        runTimer('Y',1,1)
        
    end
   
    
end
function onTimerCompleted(tag, loops, loopsLeft)
if tag=='Y' then
    Missingno=false
end
if tag=='LeaveGengar' then
removeLuaSprite('GengarLeave',true)
end
if tag=='LeaveMuk' then
    removeLuaSprite('MukLeave',true)
end

end
