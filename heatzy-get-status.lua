json = (loadfile "/home/YOURUSERNAME/domoticz/scripts/lua/JSON.lua")()  -- For Linux enlever les -- devant la ligne qui vous interesse et mettre -- devant la ligne a commenter
--   json = (loadfile "/home/pi/domoticz/scripts/lua/JSON.lua")()  -- For raspberry enlever les -- devant la ligne qui vous interesse et mettre -- devant la ligne a commenter
--   json = (loadfile "D:\\Domoticz\\scripts\\lua\\json.lua")()  -- For Windows enlever les -- devant la ligne qui vous interesse et mettre -- devant la ligne a commenter
--   json = (loadfile "/volume1/@appstore/domoticz/var/scripts/lua/json.lua")()  -- For Syno enlever les -- devant la ligne qui vous interesse et mettre -- devant la ligne a commenter
 
 --variable a configurer
did = '__DID__' 			--did que l'on a trouvé, on garde les ''
selectorheatzy = 'Heatzy Pilote'	--nom de votre inter selecteur qui pilote le heatzy on garde les ''
 --fin des variable a configurere
 
 
 --ligne de commande qui interoge les serveur heatzy pour le retour d'etat
 local config=assert(io.popen('curl -X GET --header \'Accept: application/json\' --header \'X-Gizwits-Application-Id: c70a66ff039d41b4a220e198b0fcc8b3\' \'https://euapi.gizwits.com/app/devdata/'..did..'/latest\''))
 
 --parsing du json
 local blocjson = config:read('*all')
 config:close()
 --print (blocjson)
 local jsonValeur = json:decode(blocjson)
 mode = jsonValeur.attr.mode
 --print('****************')
 --print(mode)
  
 
commandArray = {}

if mode == 'stop' and otherdevices[selectorheatzy]~='Off' then
    print("heatzy le radiateur est passé en mode Stop")
    commandArray[selectorheatzy]='Set Level: 0'

elseif mode == 'cft' and otherdevices[selectorheatzy]~='Confort' then 
    print("heatzy le radiateur est passé en mode Confort")
    commandArray[selectorheatzy]='Set Level: 10'

elseif mode == 'eco' and otherdevices[selectorheatzy]~='Eco' then 
    print("heatzy le radiateur est passé en mode Eco")
    commandArray[selectorheatzy]='Set Level: 20'

elseif mode == 'fro' and otherdevices[selectorheatzy]~='Hors Gel' then  
    print("heatzy le radiateur est passé en mode Hors-gel")
    commandArray[selectorheatzy]='Set Level: 30'
end
    

return commandArray
