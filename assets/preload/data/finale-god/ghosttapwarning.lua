function onCreatePost()
makeLuaText("engineText", "YOU GET NO GHOST TAPPING.", 660, 30, 30)
    setTextSize('engineText', 20)
    setTextColor('engineText', 'fefa7f')
    setTextAlignment("engineText", "left")
    addLuaText("engineText")
    setProperty('botplayTxt.x', 50 + getProperty('healthBar.x'))
    setProperty('botplayTxt.y', -100 + getProperty('healthBar.y'))
end