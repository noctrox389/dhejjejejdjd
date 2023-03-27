function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bloody Knife' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'bknifenotes'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    	health = getProperty('health')
	if noteType == 'Bloody Knife' then
		setProperty('health', getProperty('health')+0.023);
		playSound('bknhit', 0.2)
    		if health < 0.4 then
        	setProperty('health', getProperty('health')+0.023);
		else
    		end
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Bloody Knife' then
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
				   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',0.1,0.1,'ff3030')
	      addLuaSprite('flash', true);
		  setObjectCamera('flash', 'other');
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',0.5)
		doTweenAlpha('flTw','flash',0,0.4,'linear')
			setProperty('health', getProperty('health')-1);
		playSound('kill', 2)
		cameraShake('camGame', 0.01, 0.2);
		addMisses(-1);
    end
end