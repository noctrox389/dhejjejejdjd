function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.0196 then
        setProperty('health', health- 0.0195);
    end
end
