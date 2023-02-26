function onCreate()
    for i = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i,'noteType') == 'Hey!' then
            setPropertyFromGroup('unspawnNotes', i,'texture','invi')
            setPropertyFromGroup('unspawnNotes', i,'noAnimation',true)
            setPropertyFromGroup('unspawnNotes', i,'ignoreNote',true)
        end
    end
end