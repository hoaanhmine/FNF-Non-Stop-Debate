function onCreate()
    makeLuaSprite('bg', 'fingersbg', -600, -200);
    scaleObject('bg', 1.4, 1.4);
    addLuaSprite('bg', false);
end

function onCreatePost()
    setProperty('boyfriendGroup.visible', false);
end

function onMoveCamera(focus)
    if focus == 'dad' then
        setProperty('defaultCamZoom', 1.1);
    else
        setProperty('defaultCamZoom', 0.95);
    end
end