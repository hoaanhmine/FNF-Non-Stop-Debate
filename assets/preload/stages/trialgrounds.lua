local charFramerate = 14;
local bgCharacters = {'himiko', 'tenko', 'kiibo', 'kaito'};
local barSize = 104;
local allowCameraBop = false;

function onCreate()
    -- Normal BG
        makeLuaSprite('bg', 'background', -510, -400);
        setScrollFactor('bg', 0.6, 0.8);
        scaleObject('bg', 1.1, 1.1);
        addLuaSprite('bg', false);

        makeLuaSprite('light', 'light', -505, -400);
        setScrollFactor('light', 1.1, 1.1);
        scaleObject('light', 1.2, 1.2);
        setBlendMode('light', 'add');
        addLuaSprite('light', true);

    -- Panic Section BG
        makeLuaSprite('bg-panic', 'backgroundpanic', -510, -400);
        setScrollFactor('bg-panic', 0.8, 0.8);
        scaleObject('bg-panic', 1.1, 1.1);
        setProperty('bg-panic.visible', false);
        addLuaSprite('bg-panic', false);

        makeLuaSprite('light-panic', 'lightpanic', -505, -400);
        setScrollFactor('light-panic', 1.1, 1.1);
        scaleObject('light-panic', 1.2, 1.2);
        setBlendMode('light-panic', 'add');
        setProperty('light-panic.visible', false);
        addLuaSprite('light-panic', true);

    -- Rebuttal Showdown BG
        makeLuaSprite('bg-rebuttal', 'backgroundrebuttal', -420, -400);
        setScrollFactor('bg-rebuttal', 0.8, 0.8);
        scaleObject('bg-rebuttal', 1.1, 1.1);
        setProperty('bg-rebuttal.alpha', 0);
        addLuaSprite('bg-rebuttal', false);

    -- BG Characters
        directory = 'bgcharacters/';

        makeAnimatedLuaSprite('himiko', directory .. 'himiko', -550, -75);
        addAnimationByPrefix('himiko', 'idle', 'himiko', charFramerate, true);
        addLuaSprite('himiko', false);

        makeAnimatedLuaSprite('tenko', directory .. 'tenko', 500, -350);
        addAnimationByPrefix('tenko', 'idle', 'tenki', charFramerate, true);
        addLuaSprite('tenko', false);

        makeAnimatedLuaSprite('kiibo', directory .. 'kiibo', 1300, -300);
        addAnimationByPrefix('kiibo', 'idle', 'kiibo', charFramerate, true);
        addLuaSprite('kiibo', false);

        makeAnimatedLuaSprite('kaito', directory .. 'kaito', -450, 0);
        addAnimationByPrefix('kaito', 'idle', 'kaito', charFramerate, true);
        addLuaSprite('kaito', true);

        setObjectOrder('light', getObjectOrder('kaito') + 1);
        setObjectOrder('light-panic', getObjectOrder('kaito') + 1);

    -- Character Stands
        makeLuaSprite('standH', 'stand', -525, 425);
        setObjectOrder('standH', getObjectOrder('himiko') + 1);
        addLuaSprite('standH', false);

        makeLuaSprite('standKo', 'stand', 75, 400);
        setObjectOrder('standKo', getObjectOrder('gfGroup') + 1);
        addLuaSprite('standKo', false);

        makeLuaSprite('standT', 'stand', 675, 350);
        setObjectOrder('standT', getObjectOrder('tenko') + 1);
        addLuaSprite('standT', false);

        makeLuaSprite('standKi', 'stand', 1275, 400);
        setObjectOrder('standKi', getObjectOrder('kiibo') + 1);
        setProperty('standKi.flipX', true);
        addLuaSprite('standKi', false);

    -- UI Cinematic Bars
        makeLuaSprite('blackbar', nil, 0, 0);
        makeGraphic('blackbar', screenWidth, barSize, '000000');
        setObjectCamera('blackbar', 'hud');
        addLuaSprite('blackbar', true);

        makeLuaSprite('blackbar2', nil, 0, screenHeight - barSize);
        makeGraphic('blackbar2', screenWidth, barSize, '000000');
        setObjectCamera('blackbar2', 'hud');
        addLuaSprite('blackbar2', true);

    -- Eye Catches
        makeLuaSprite('eyecatchKo', 'eyecatchKo', -screenWidth, barSize);
        setObjectCamera('eyecatchKo', 'hud');
        addLuaSprite('eyecatchKo', true);

        makeLuaSprite('eyecatchSh', 'eyecatchSh', screenWidth, barSize + getProperty('eyecatchKo.height'));
        setObjectCamera('eyecatchSh', 'hud');
        addLuaSprite('eyecatchSh', true);

    -- Character Adjustments
        setObjectOrder('dadGroup', getObjectOrder('gfGroup') - 1);
end

function onMoveCamera(focus)
    if curStep <= 1248 then
        if focus ~= 'boyfriend' then
            setProperty('defaultCamZoom', 0.8);
            doTweenAlpha('excuseme', 'kaito', 0.6, 0.4, 'sineInOut');
        else
            setProperty('defaultCamZoom', 0.72);
            doTweenAlpha('thankyou', 'kaito', 1, 0.4, 'sineInOut');
        end
    end
end

function onStepHit()
    if curStep == 976 then
        massPanicDebate(true, false);
    elseif curStep == 1232 then
        massPanicDebate(false, false);
    elseif curStep == 1248 then
        doTweenAlpha('rebuttalAppear', 'bg-rebuttal', 1, 3, 'sineInOut');
        doTweenY('blackbarGone', 'blackbar', -barSize, 1.5, 'expoOut');
        doTweenY('blackbarGone2', 'blackbar2', screenHeight, 1.5, 'expoOut');
    elseif curStep == 1872 then
        massPanicDebate(true, true);
    elseif curStep == 2128 then
        massPanicDebate(false, true);
    end

    if allowCameraBop == true and curStep % 4 == 0 then
        triggerEvent('Add Camera Zoom', '0.06', '0.04');
    end
end

function onBeatHit()
    for i = 1, #bgCharacters do
        if curBeat % 2 == 0 then
            playAnim(bgCharacters[i], 'idle', true);
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'blackbarGone' then
        removeLuaSprite('blackbar', false);
        removeLuaSprite('blackbar2', false);
    end
end

function massPanicDebate(isON, isRebuttal)
    cameraFlash('game', 'FFFFFF', 0.6, false);
    
    if isON == true then
        allowCameraBop = true;
        doTweenY('blackbarTween', 'blackbar', 0 - 52, 2, 'expoOut');
        doTweenY('blackbarTween2', 'blackbar2', screenHeight - barSize + 52, 2, 'expoOut');

        setProperty('bg-panic.visible', true);
        setProperty('light-panic.visible', true);

        if isRebuttal == true then
            setProperty('bg-rebuttal.visible', false);
        else
            setProperty('bg.visible', false);
        end
        setProperty('light.visible', false);
    else
        allowCameraBop = false;
        doTweenY('blackbarTween', 'blackbar', 0, 2, 'expoOut');
        doTweenY('blackbarTween2', 'blackbar2', screenHeight - barSize, 2, 'expoOut');

        setProperty('bg-panic.visible', false);
        setProperty('light-panic.visible', false);

        if isRebuttal == true then
            setProperty('bg-rebuttal.visible', true);
        else
            setProperty('bg.visible', true);
        end
        setProperty('light.visible', true);
    end
end