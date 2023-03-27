function onEvent(eventName, value1, value2)
    if eventName=='Finale Drop' then
        setProperty('HealthBarBG.visible',true)
        setHealth(0.1)
        setProperty('Overlay.visible',false)
        addLuaSprite('bgg', false);
        addLuaSprite('dead', false);
        addLuaSprite('bg', false)
        addLuaSprite('splat', true)
        addLuaSprite('lamp', false);
        addLuaSprite('fore', true);
        addLuaSprite('dark', true);
        addLuaSprite('light', true)
        setTextColor('scoreTxt','FFFF00')
        setTextSize('scoreTxt',20)
        setTextColor('botplayTxt','FFFF00')
        setTextSize('botplayTxt',32)
        cameraFlash('game','FFFF00', 0.75,false)
    end
end