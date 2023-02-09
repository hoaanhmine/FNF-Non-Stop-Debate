function onCreate()
    local dadX = getProperty('dadGroup.x');
    local dadY = getProperty('dadGroup.y');

    if dadName == 'monokuma' then
        makeLuaSprite('highChair', 'chair', dadX - 250, dadY + 80);
        scaleObject('highChair', 1.15, 1.15);
        addLuaSprite('highChair', false);
        setObjectOrder('highChair', getObjectOrder('dadGroup') - 1);
        --get it it's because high chairs are for BABIES and monokuma is a stupid lil BABY bitch
        --quite hilarious right
        --
        --right
    end
end