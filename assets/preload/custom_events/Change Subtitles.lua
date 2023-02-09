--made by ItsAizakku

function onCreate()
    makeLuaText('subtitles', '', screenWidth, 0, 500);
    setTextSize('subtitles', 28);
    setTextFont('subtitles', 'goodbyeDespair.ttf');
    setObjectCamera('subtitles', 'other');
    setTextAlignment('subtitles', 'center');
    addLuaText('subtitles');
end

function onEvent(name, value1, value2)
    if name == 'Change Subtitles' then
        setTextString('subtitles', value1);

        if value2 ~= '' then
            setTextSize('subtitles', value2);
        else
            setTextSize('subtitles', 28);
        end
    end
end
