
-- décommentez la ligne correspondant à votre plateforme et commentez les autres
-- éventuellement, modifiez le chemin du fichier JSON.lua
json = (loadfile "/home/__YOURUSERNAME__/domoticz/scripts/lua/JSON.lua")()  		-- (GNU/linux)
--   json = (loadfile "/home/pi/domoticz/scripts/lua/JSON.lua")()  		-- (Raspberry Pi)
--   json = (loadfile "D:\\Domoticz\\scripts\\lua\\json.lua")()    		-- (Windows)
--   json = (loadfile "/volume1/@appstore/domoticz/var/scripts/lua/json.lua")() -- (Synology)

-- Variables à editer 
user = '__EMAIL__' 		-- adresse email pour s'enregistrer sur l'application conserver les ' '
password = '__PASSWORD__'  	-- mot de passe utiliser pour l'application conserver les ' '
heatzyvariable = 'heatzytoken'	-- nom de la variable utilisateur de type chaine qui stock le token conserver les ' '


function ChkToken()
 local config=assert(io.popen('curl -X POST --header \'Content-Type: application/json\' --header \'Accept: application/json\' --header \'X-Gizwits-Application-Id:  c70a66ff039d41b4a220e198b0fcc8b3\' -d \'{ "username": "'..user..'", "password": "'..password..'", "lang": "en" }\' \'https://euapi.gizwits.com/app/login\''))
 local blocjson = config:read('*all')
 config:close()
 --print (blocjson)
 local jsonValeur = json:decode(blocjson)
 token = jsonValeur.token
-- print(token)
 commandArray['Variable:'..heatzyvariable..'']=''..token..''
end
 
commandArray = {}
 
time = os.date("*t")
 
-- rafraichissement du token tout les 3 jours
if ((((time.day-1) % 3)== 0) and (time.hour==00 and time.min ==1)) then 
        ChkToken()
elseif otherdevices['Get Heatzy Token'] == 'On' then 
        ChkToken()
end

return commandArray
