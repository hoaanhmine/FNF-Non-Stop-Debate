--[[function onCreate()
    makeLuaSprite('cFlash', nil, 0, 0);
    makeGraphic('cFlash', screenWidth, screenHeight, 'FFFFFF');
    setObjectCamera('cFlash', 'hud');
    setProperty('cFlash.alpha', 0);
    addLuaSprite('cFlash', true);
end

function onEvent(name, value1, value2)
    if name == "Camera Flash" then
        if value1 ~= '' then
            duration = tonumber(value1);
        else
            duration = 1
        end

        setProperty('cFlash.alpha', 1);
        doTweenAlpha('thinkFastChucklenuts', 'cFlash', 0, value1, 'sineInOut');
    end
end]]