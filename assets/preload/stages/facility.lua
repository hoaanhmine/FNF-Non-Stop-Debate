function onCreate()
    luaDebugMode = true;
    
    --Background
        makeLuaSprite('sky', 'midoribg/sky', -400, -350);
        setScrollFactor('sky', 0.4, 0.4);
        addLuaSprite('sky', false);

        makeLuaSprite('buildings', 'midoribg/buildings', -400, -350);
        setScrollFactor('buildings', 0.75, 0.75);
        addLuaSprite('buildings', false);

        makeLuaSprite('ground', 'midoribg/ground', -500, -100);
        addLuaSprite('ground', false);

    --[[ UI Cinematic Bars
        barSize = 104;

        makeLuaSprite('blackbar', nil, 0, -barSize);
        makeGraphic('blackbar', screenWidth, barSize, '000000');
        setObjectCamera('blackbar', 'hud');
        addLuaSprite('blackbar', true);

        makeLuaSprite('blackbar2', nil, 0, screenHeight);
        makeGraphic('blackbar2', screenWidth, barSize, '000000');
        setObjectCamera('blackbar2', 'hud');
        addLuaSprite('blackbar2', true);
    ]]
end

function onSongStart()
    cameraFlash('game', 'FFFFFF', 0.8);
    --doTweenY('blackbarTween', 'blackbar', 0, 1.2, 'expoOut');
    --doTweenY('blackbarTween2', 'blackbar2', screenHeight - barSize, 1.2, 'expoOut');
    setProperty('defaultCamZoom', 1.0);
end

function onStepHit()
    if songName == 'Puppeteer' and curStep >= 528 and curStep <= 544 then
        cameraShake('hud', 0.002, 0.1);
    end
end