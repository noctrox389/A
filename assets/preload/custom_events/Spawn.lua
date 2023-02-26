function onCreate()
    makeAnimatedLuaSprite('Hand', 'characters/WA_assets', getCharacterX('dad')+700, getCharacterY('dad')+150)
    addAnimationByPrefix('Hand', 'Idle', 'WH_Idle', 24,true )
    addAnimationByPrefix('Hand', 'Intro', 'WH_Intro', 24,true )
    addAnimationByPrefix('Hand', 'ToGF', 'WH_ToGF', 24,true )
    setGraphicSize('Hand', getProperty('Hand.width')*3.5,getProperty('Hand.height')*3.5)
    setProperty('Hand.antialiasing',false)
    initLuaShader('desaturation',150)
    initLuaShader('vignetteApparition',150)
    makeLuaSprite('ApparitionH')

    
   makeLuaSprite('ShaderA','characters/No_GF',0,0)
   setGraphicSize('ShaderA',screenWidth,screenHeight)
   setObjectCamera('ShaderA','hud')
   addLuaSprite('ShaderA',true)

   makeLuaSprite('Shadow','shadow',getCharacterX('dad')+700,300)
   setGraphicSize('Shadow',getProperty('Shadow.width')*3.5,getProperty('Shadow.height')*3.5)
 setProperty('Shadow.antialiasing',false)
 
   
  
end
function onEvent(name, value1, value2)
    if name=='Spawn' then
        if value1=='Missingno' then
            missingno(tonumber(value2))
        elseif value1=='ApparitionGF' then
            addLuaSprite('Hand',false)
            playAnim('Hand','Intro',true)
            runTimer('lolGF',1.3,1)
            apparitionGF(tonumber(value2))
        elseif value1=='Gengar' then
            gengar()
        
        elseif value1=='Leanmonster' then
            leanmonster()
        end
    end
end
function missingno(wait)
    playAnim('BF', 'Throw' ,true)
    runTimer('Ending_missingono',wait,1)
    runTimer('Starting',0.7,1)
    
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'Starting' then
        triggerEvent('Change Character','bf','MissingnoPokeBall')
        playAnim('BF', 'Idle' ,true)
        triggerEvent('Play Animation','Start','bf')
    end
    if tag == 'Ending_missingono' then
        triggerEvent('Change Character','bf','MissingnoPokeBall')
        triggerEvent('Play Animation','END','bf')
        runTimer('Changing',2,1)
    end
    if tag == 'Changing' then
        triggerEvent('Change Character','bf','Missingno')
    end
    if tag == 'START' then
        triggerEvent('Change Character','dad','Gengar')
    end
    if tag=='lolGF' then
        playAnim('Hand','Idle',true)
    end
    if tag=='taGF' then
        playAnim('Hand', 'ToGF' ,true)
        doTweenZoom('EpicZoom', 'camGame', 1.5, 3, 'circInOut')
        runTimer('setGF',3.17,1)
        if shadersEnabled then
        setSpriteShader('ShaderA','vignetteApparition')
        setSpriteShader('Back','desaturation')
        setSpriteShader('Floor','desaturation')
        setSpriteShader('Graves','desaturation')
        setShaderFloat('Graves','distortionTime','1')
        setShaderFloat('Graves','desaturationAmount','1.0')
        setShaderFloat('Graves','frequency','0')
        setShaderFloat('Graves','amplitude','0')
        setShaderFloat('ShaderA','time',1)
      runTimer('vignetteIntensity',0.1,74)
      runTimer('desaturationAmount',0.1,20)
      runTimer('frequency',0.1,8)
      runTimer('amplitude',0.1,100)
        end
    end
    if tag=='setGF' then
        triggerEvent('Change Character','dad','ApparitionGF')
        
        removeLuaSprite('Hand',true)
    end
    if tag=='vignetteIntensity' and shadersEnabled then
        setShaderFloat('ShaderA','vignetteIntensity',getShaderFloat('ShaderA','vignetteIntensity')+0.01)
    end
    if tag=='desaturationAmount'and shadersEnabled then
        setShaderFloat('Graves','desaturationAmount',getShaderFloat('Graves','desaturationAmount')-0.05)
    end
    if tag=='frequency'and shadersEnabled then
        setShaderFloat('Graves','frequency',getShaderFloat('Graves','frequency')+1)
    end
    if tag=='amplitude'and shadersEnabled then
        setShaderFloat('Graves','amplitude',getShaderFloat('Graves','amplitude')-0.001)
    end
    
end
function gengar()
    triggerEvent('Change Character','dad','Enter_gengar')
    runTimer('START',2.5,1)
end
function leanmonster()
    triggerEvent('Change Character','dad','Leanmonster')
  
    characterPlayAnim('dad','Intro',true)
end
function apparitionGF(time)
    addLuaSprite('Shadow',true)
runTimer('taGF',time-3.17,1)
end
function onUpdate(elapsed)
setShaderFloat('ShaderA','time',getShaderFloat('ShaderA','time')+elapsed)
setShaderFloat('Graves','distortionTime',getShaderFloat('Graves','distortionTime')+elapsed)




end