function onCreatePost()
	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Left')
		setProperty('timeBarBG.visible', false)
		setProperty('timeBar.visible', false)
		setProperty('timeTxt.visible', false)
		setProperty('scoreTxt.visible', false)
		
		makeLuaSprite('newTimeBar', 'timeBarAlt', 100, getProperty('timeBarBG.y'))
		setObjectCamera('newTimeBar', 'hud')
		scaleObject('newTimeBar', 1.08, 1)
		addLuaSprite('newTimeBar', true)
		
		makeLuaSprite('greenBar', nil, 102, getProperty('timeBarBG.y')+4.5)
		makeGraphic('greenBar', 425, 10, '43ff55')
		setObjectCamera('greenBar', 'hud')
		addLuaSprite('greenBar', true)

		makeLuaText('NewScoreTxt','Score: 0 | FUCK YOU. MISS AND YOU DIE. | Accuracy: 0%', getPropertyFromClass('flixel.FlxG', 'width'),getProperty('scoreTxt.x'), getProperty('scoreTxt.y'))
		setTextSize('NewScoreTxt',20)
		setObjectCamera('NewScoreTxt', 'hud')
		setTextBorder('NewScoreTxt', 1, '000000');
		setTextAlignment('NewScoreTxt', 'center');
		addLuaText('NewScoreTxt');
	
		makeLuaText("nametext", string.upper(songName), 600, 108, getProperty('timeTxt.y')+10.2)
		setTextSize('nametext', 15)
		addLuaText("nametext")
		setTextAlignment('nametext', 'left')
		setProperty('nametext.visible', true)
	if middlescroll then
		if songName == 'Actin-Sus' or songName == 'Alpha-Moogus' then
			--do nothing
		else
			for i = 0, 3 do
        		setPropertyFromGroup('opponentStrums', i, 'x', 9000)
        	end
        end
    end
end

function toHexString(red, green, blue, prefix)
	if (prefix == nil) then 
		prefix = true 
	end
	return (prefix and "0x" or "") .. (
	string.format("%02X%02X%02X", red, green, blue)
		)
end

function mathlerp(from,to,i)
	return from+(to-from)*i
end

function onUpdate()
	if songName == 'Defeat' or songName == 'finale' or songName == 'victory' or songName == 'Actin-Sus' or songName == 'Alpha-Moogus' then
	--do nothing 
	else
    	local dadColors = getProperty("dad.healthColorArray")
		local dadColor = tonumber(toHexString(dadColors[1], dadColors[2], dadColors[3]))
	
   	 	setProperty('greenBar.scale.x', getProperty("songPercent"))
    	setProperty('greenBar.x', 0 - 108.5 + (getProperty("songPercent") * 210))
    	
    	setProperty("NewScoreTxt.color", dadColor)
    
    	setProperty('NewScoreTxt.scale.x', getProperty('scoreTxt.scale.x'))
    	setProperty('NewScoreTxt.scale.y', getProperty('scoreTxt.scale.y'))
    
    	local acc = rating * 100

    	if hits > 0 then
        	setTextString("NewScoreTxt", "Score: " .. score .. " | FUCK YOU. MISS AND YOU DIE. | Accuracy: " .. math.floor(acc * 100) / 100 .. "% ["..ratingFC..']')
   		else
       		setTextString("NewScoreTxt", "Score: 0 | FUCK YOU. MISS AND YOU DIE. | Accuracy: 0%")
    	end
    
   		setProperty('iconP2.scale.x', mathlerp(getProperty('iconP2.scale.x'), 1, 0.1 * playbackRate))
  		setProperty('iconP1.scale.x', mathlerp(getProperty('iconP1.scale.x'), 1, 0.1 * playbackRate))
	end
end

function onUpdatePost()
	if getProperty('songMisses') == 1 then
		setProperty("NewScoreTxt.color", 0x808016)
	end
	if getProperty('songMisses') == 2 then
		setProperty("NewScoreTxt.color", 0xFFFF16)
	end
  	setProperty('iconP2.origin.x',80)
  	setProperty('iconP1.origin.y',0)
  	setProperty('iconP1.origin.x',20)
    setProperty('iconP2.origin.y',0)
end