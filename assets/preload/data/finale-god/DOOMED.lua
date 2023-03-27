yourMaxMiss = 0

function onUpdatePost()
	if getProperty('songMisses') > yourMaxMiss then
		setProperty('health', -0.1)
	end
end