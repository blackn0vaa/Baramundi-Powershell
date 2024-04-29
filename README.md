# PowerShell Skripte

Dieses Repository enthält eine Reihe von PowerShell-Skripten zur Interaktion mit Active Directory. Hier ist eine kurze Beschreibung jedes Skripts:

## Skripte

### [AD/searchUserByName.ps1](AD/searchUserByName.ps1)
Dieses Skript sucht einen Benutzer im Active Directory anhand seines Namens. Es liest den Server-URL aus der `Server.txt`-Datei und führt eine API-Anfrage aus, um den Benutzer zu suchen. Wenn der Benutzer gefunden wird, werden seine Daten in einem Gridview angezeigt und seine ID wird ausgegeben.

### [AD/searchUserByID.ps1](AD/searchUserByID.ps1)
Dieses Skript sucht einen Benutzer im Active Directory anhand seiner ID. Es führt zunächst eine API-Anfrage aus, um den Benutzer anhand seines Namens zu suchen, und speichert dann die ID des gefundenen Benutzers. Anschließend führt es eine zweite API-Anfrage aus, um den Benutzer anhand dieser ID zu suchen.

### [AD/getAllUsersFromOU.ps1](AD/getAllUsersFromOU.ps1)
Dieses Skript holt alle Benutzer aus einer bestimmten Organizational Unit (OU) im Active Directory. Es führt eine API-Anfrage aus und zeigt die Daten des ersten Elements des Antwortdaten-Arrays in einem Gridview an.

### [AD/getAllUsers.ps1](AD/getAllUsers.ps1)
Dieses Skript holt alle Benutzer aus dem Active Directory. Es führt eine API-Anfrage aus und zeigt die Daten aller Benutzer in einem Gridview an, wobei die Nachnamen und Vornamen zuerst angezeigt werden.

### [run.ps1](run.ps1)
Dieses Skript dient als Hauptskript, das die anderen Skripte ausführt. Es setzt den Benutzernamen und den Endpunktnamen, die in den folgenden Skripten verwendet werden. Derzeit sind die meisten Skripte auskommentiert und werden daher nicht ausgeführt, wenn Sie dieses Skript ausführen.

## Hinweis
Bitte beachten Sie, dass Sie die Dateien im Ordner `Variablen` mit den entsprechenden Werten befüllen müssen, bevor Sie diese Skripte ausführen können. Insbesondere müssen Sie die `Server.txt`-Datei mit der URL Ihres Servers und die `Client.ps1`-Datei mit den erforderlichen Funktionen und Variablen befüllen.