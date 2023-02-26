function onCreate()
    makeLuaSprite("tempShader0")


    initLuaShader('brimstoneCamEffects',150)



    


    

end
function onEvent(tag,v1,v2)
    if tag=='Filtrer' and shadersEnabled then
   
    if v2 == 'Game' then
        Pokemon(v1)
        Characters(v1)
        Stages(v1)
    elseif v2 =='Characters' then
        Characters(v1)
        Pokemon(v1)
    elseif v2 =='Stage' then
        Stages(v1)
    elseif v2 =='All' then
        All(v1)
       
    end

   


    
    end

end
function Stages(shader0)
    if shader0=='' then
      
        removeSpriteShader('Back')
        removeSpriteShader('Floor')
        removeSpriteShader('Graves')
    else
 setSpriteShader('Back',shader0)
 setSpriteShader('Floor',shader0)
 setSpriteShader('Graves',shader0)
    end
end
function Characters(shader9)
    if shader9=='' then
        removeSpriteShader('BF')
        removeSpriteShader('Buryman')

    else
    setSpriteShader('BF',shader9)
    setSpriteShader('Buryman',shader9)
    end
end
function Pokemon(shader8)
    if shader8=='' then
        removeSpriteShader('boyfriend')
        removeSpriteShader('dad')

    else
    setSpriteShader('boyfriend',shader8)
    setSpriteShader('dad',shader8)
    end
end
function All(shader7)
    if shader7 == '' then
        runHaxeCode([[
           
            
            
            game.camGame.setFilters([]);
            game.camHUD.setFilters([]);
            game.getLuaObject("tempShader0").shader = null; 
        
        ]])
    elseif shader7=='brimstoneCamEffects' then
    local Shader=shader7
    runHaxeCode([[
        var shaderName = "]]..Shader..[[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        
        shader0.setFloat('intensity', 1);
        
    ]])
    end
    
    
end
