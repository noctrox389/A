-- Script edited and added stuff by Bluespike (@FrideyNehgGuy on twitter) give credits if you use it
-- Also original base script by Sky Remanifested give credits to the mod tho 

function onCreatePost()
        makeLuaSprite('vcrshit2', 'vcrcd',0,0)  
        addLuaSprite('vcrshit2', true)
        setObjectCamera("vcrshit2", "hud")
        makeLuaSprite('borderL', 'aspect',0,0)
        addLuaSprite('borderL', false)
        setObjectCamera("borderL", "hud")


    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") + 87)
    end
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") + - 78)
        setPropertyFromGroup('strumLineNotes', i, "y", getPropertyFromGroup('strumLineNotes', i, "y") + 0)
    end
end

-- put below of this message your stage 