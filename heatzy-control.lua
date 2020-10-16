-- script pilotant les modules fils pilote heatzy version 1, 2 ou 3
 
-- variables a personnaliser
did = '__DID__' 			--que tu recuperes avec la commande : "curl -X GET --header 'Accept: application/json' --header 'X-Gizwits-User-token: quicetrouvedanstavariableutilisateurdomoticzheatzytoken' --header 'X-Gizwits-Application-Id: c70a66ff039d41b4a220e198b0fcc8b3' 'https://euapi.gizwits.com/app/bindings?limit=20&skip=0'
selectorheatzy = 'Heatzy Pilote'	-- ici le nom de ton selector entre les '  '
vartoken = 'heatzytoken'		-- ici le nom de ta variable utilisateur de type chaîne que tu as créer pour recevoir le token entre les '  '
token = tostring(uservariables[vartoken])


-- il existe deux versions d'Heatzy Pilote, commentez et décommentez suivant la votre.

-- version 1 
--Confort = '[1,1,0]'
--Eco = '[1,1,1]' 
--Hors_Gel = '[1,1,2]'
--Off = '[1,1,3]'
 
-- versions 2 & 3 
Confort = '{ "attrs": { "mode":0 } }'   
Eco = '{ "attrs": { "mode":1 } }' 
Hors_Gel = '{ "attrs": { "mode":2 } }'
Off = '{ "attrs": { "mode":3} }'


commandArray = {}

function setMode(mode)
    runcommand = "curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-Gizwits-User-token: "..token.."' --header 'X-Gizwits-Application-Id: c70a66ff039d41b4a220e198b0fcc8b3' --data-raw '"..mode.."' 'https://euapi.gizwits.com/app/control/"..did.."'";
    os.execute(runcommand);
    --print(runcommand)
end
    
    
--Off
if devicechanged[selectorheatzy] == 'Off' then
    setMode(Off)   
   
--Confort
elseif devicechanged[selectorheatzy] == 'Confort' then
    setMode(Confort)

--Eco
elseif devicechanged[selectorheatzy] == 'Eco' then
    setMode(Eco)

--Horsgel
elseif devicechanged[selectorheatzy] == 'Hors Gel' then
    setMode(Hors_Gel)
end

return commandArray
