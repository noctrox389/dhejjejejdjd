function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'hestabbed'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'loss-defeat'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover_v4_LOOP'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover_v4_End'); --put in mods/music/
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Danger Note' then
	setPropertyFromClass('GameOverSubstate', 'characterName', 'NOTHISBALLS'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'defeat_kill_ballz_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover_v4_LOOP'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover_v4_End'); --put in mods/music/
	end
end