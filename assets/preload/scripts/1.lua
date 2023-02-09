local font = 'goodbyeDespair.ttf';

function onCreate()
    if songName == 'Puppeteer' then
        font = 'VLGothic.ttf';
    else
        font = 'goodbyeDespair.ttf';
    end
end

function onCreatePost()
    setTextFont("scoreTxt", font);
    setTextFont("botplayTxt", font);
    setTextFont("timeTxt", font);
end