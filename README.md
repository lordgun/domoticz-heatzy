# Contrôle de Heatzy Pilote via Domoticz

Scripts domoticz pour contrôler un module Heatzy Pilote

- Plus d'informations sur le Pilote: https://heatzy.com/pilote
- Documentation des API: https://heatzy.com/blog/heatzy-openapi

## Installation

* Création d'une variable utilisateur de type chaîne ex: "heatzytoken"

![Screenshot 2022-11-03 at 22-11-37 Domoticz](https://user-images.githubusercontent.com/61914395/199837156-c5fd111e-3a0e-4bbc-a760-8eb9b7b48ba4.png)

* Créer un switch de type "selector" en mode "on/off" pour gérer la demande de token:

![switch Heatzy Pilote](./doc/domoticz-heatzy-switch-token.png?raw=true)

  Détail de paramétrage:
 en respectant bien le nom "Get Heatzy Token"
 
![switch Heatzy Pilote détails](./doc/domoticz-heatzy-switch-token-detail.png?raw=true)

* Créer un switch de type "selector" pour gérer l'état de chaque radiateur:

![switch Heatzy Pilote](./doc/domoticz-heatzy-switch-pilote.png?raw=true)

Détail de paramétrage:

![switch Heatzy Pilote détails](./doc/domoticz-heatzy-switch-pilote-detail.png?raw=true)

* Création des fichiers LUA pour connaitre le status du/des radiateur(s) dans les "Configuration/Plus d'options/Evènements"

https://github.com/lordgun/domoticz-heatzy/blob/main/heatzy-get-status.lua

* Création des fichiers LUA pour contrôler le "selector"

https://github.com/lordgun/domoticz-heatzy/blob/main/heatzy-control.lua


