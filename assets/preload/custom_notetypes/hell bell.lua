function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an desviation note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'hell bell' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'hell bell note'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
	function noteMiss(id, i, noteType, isSustainNote)
		if noteType == 'hell bell' then
			setProperty('health', 10);


	end
end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'hell bell' then
       triggerEvent('Play Animation','tapate','bf');
       triggerEvent('Play Animation','atack','gf');
	end
end