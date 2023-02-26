function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bellNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'bellnote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

	function noteMiss(id, i, noteType, isSustainNote)
		if noteType == 'bellNote' then
			setProperty('health', 1);
	end
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
   if noteData == 0 and noteType == 'bellNote' then
        triggerEvent('Play Animation','singLEFT-alt','bf');
   elseif noteData == 1 and noteType == 'bellNote'  then
        triggerEvent('Play Animation','singDOWN-alt','bf');
    elseif noteData == 2 and noteType == 'bellNote' then
        triggerEvent('Play Animation','singUP-alt','bf');
    elseif noteData == 3 and noteType == 'bellNote' then
        triggerEvent('Play Animation','singRIGHT-alt','bf');
	end	
	if noteType == 'bellNote' then
     triggerEvent('Play Animation','atack','gf');
	end
end