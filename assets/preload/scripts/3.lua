function onCreate()
makeLuaText('HMFNF','Port by HMFNF','width',0,500)
    setTextSize('HMFNF',20)
   addLuaText('HMFNF',true);
   end
function onBeatHit()
if curBeat == 30 then
doTweenX('nameTween', 'HMFNF',  -500, 2, 'linear')
end
if curBeat == 60 then
removeLuaText('HMFNF',true)
end
end