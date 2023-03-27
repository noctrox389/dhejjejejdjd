function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Danger Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'HD_Note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.025'); --Default value is: 0.23, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '2'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false); --Should hitting the note add a miss to your miss counter?
			
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Danger Note' and difficulty == 2 then
		setProperty('health', 0);
		playSound('hankshoot', 0.5);
	end
end