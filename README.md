# PowerShell Skripte

Dieses Repository enthält eine Reihe von PowerShell-Skripten zur Interaktion mit Active Directory und anderen Funktionen. Hier ist eine kurze Beschreibung jedes Skripts:

## Skripte

### [AD/getAllUsers.ps1](AD/getAllUsers.ps1)
Dieses Skript holt alle Benutzer aus dem Active Directory. Es führt eine API-Anfrage aus und zeigt die Daten aller Benutzer in einem Gridview an, wobei die Nachnamen und Vornamen zuerst angezeigt werden.

### [AD/getAllUsersFromOU.ps1](AD/getAllUsersFromOU.ps1)
Dieses Skript holt alle Benutzer aus einer bestimmten Organizational Unit (OU) im Active Directory. Es führt eine API-Anfrage aus und zeigt die Daten des ersten Elements des Antwortdaten-Arrays in einem Gridview an.

### [AD/searchUserByID.ps1](AD/searchUserByID.ps1)
Dieses Skript sucht einen Benutzer im Active Directory anhand seiner ID. Es führt zunächst eine API-Anfrage aus, um den Benutzer anhand seines Namens zu suchen, und speichert dann die ID des gefundenen Benutzers. Anschließend führt es eine zweite API-Anfrage aus, um den Benutzer anhand dieser ID zu suchen.

### [AD/searchUserByName.ps1](AD/searchUserByName.ps1)
Dieses Skript sucht einen Benutzer im Active Directory anhand seines Namens. Es liest den Server-URL aus der `Server.txt`-Datei und führt eine API-Anfrage aus, um den Benutzer zu suchen. Wenn der Benutzer gefunden wird, werden seine Daten in einem Gridview angezeigt und seine ID wird ausgegeben.

### [checkTLS_Version.ps1](checkTLS_Version.ps1)
Dieses Skript dient dazu, die TLS-Version zu überprüfen, die für die Kommunikation mit dem Server verwendet wird. Es definiert den Server und den Port, zu dem eine Verbindung hergestellt werden soll, erstellt eine Instanz von TcpClient und stellt eine Verbindung zum definierten Server und Port her. Anschließend erstellt es einen SslStream, der die Datenübertragung zwischen Client und Server sichert. Das Skript versucht, die Verbindung als Client zu authentifizieren und gibt die verwendete TLS-Version aus. Es fängt auch mögliche Fehler während der Authentifizierung ab und gibt sie aus. Schließlich schließt es den Stream und den Client, unabhängig davon, ob die Authentifizierung erfolgreich war oder nicht.

### [Defense/getAllWindowsEndpoint.ps1](Defense/getAllWindowsEndpoint.ps1)
Dieses Skript führt eine API-Anfrage aus, um alle Windows-Endpunkte abzurufen. Die Daten werden in einem Gridview angezeigt und die ID des ersten Elements wird ausgegeben.

### [Defense/getThreats.ps1](Defense/getThreats.ps1)
Dieses Skript führt eine API-Anfrage aus, um alle Bedrohungen abzurufen und sie nach Schweregrad zu sortieren. Die Daten werden in einem Gridview angezeigt und die ID des ersten Elements wird ausgegeben.

### [Defense/searchEndpointByName.ps1](Defense/searchEndpointByName.ps1)
Dieses Skript dient dazu, einen Endpunkt anhand seines Namens zu suchen. Es importiert das `Client.ps1`-Skript, das benötigte Funktionen und Variablen bereitstellt, und liest den Inhalt der `Server.txt`-Datei. Es nimmt den ersten Argumentwert als Endpunktnamen und definiert die Basis-URL für die API-Anfrage, die alle Windows-Endpunkte abruft und sie nach Endpunktnamen sortiert. Das Skript erstellt den Header für die API-Anfrage, der die Autorisierungsinformationen und den gewünschten Antworttyp enthält, und führt die API-Anfrage aus. Wenn die Antwort Daten enthält, werden diese in einem Gridview angezeigt und die ID des ersten Elements wird ausgegeben. Wenn keine Daten vorhanden sind, wird eine entsprechende Nachricht ausgegeben.

### [Endpoints/createEndpoint.ps1](Endpoints/createEndpoint.ps1)
Dieses Skript dient dazu, einen neuen Endpunkt zu erstellen. Es nimmt den Endpunktnamen und die Endpunkt-URL als Argumente, erstellt die erforderlichen Header für die API-Anfrage und führt die Anfrage aus, um den Endpunkt zu erstellen. Bei Erfolg gibt das Skript die ID des erstellten Endpunkts aus.

### [Endpoints/deleteEndpoint.ps1](Endpoints/deleteEndpoint.ps1)
Dieses Skript dient dazu, einen Endpunkt zu löschen. Es nimmt die Endpunkt-ID als Argument, erstellt die erforderlichen Header für die API-Anfrage und führt die Anfrage aus, um den Endpunkt zu löschen. Bei Erfolg gibt das Skript eine Bestätigungsnachricht aus.

### [Endpoints/getAllEndpoints.ps1](Endpoints/getAllEndpoints.ps1)
Dieses Skript dient dazu, alle Endpunkte abzurufen. Es erstellt die erforderlichen Header für die API-Anfrage und führt die Anfrage aus, um alle Endpunkte abzurufen. Die Daten aller Endpunkte werden in einem Gridview angezeigt und die ID des ersten Elements wird ausgegeben.

### [Endpoints/getEndpointByName.ps1](Endpoints/getEndpointByName.ps1)
Dieses Skript dient dazu, einen Endpunkt anhand seines Namens zu suchen. Es nimmt den Endpunktnamen als Argument, erstellt die erforderlichen Header für die API-Anfrage und führt die Anfrage aus, um den Endpunkt zu suchen. Wenn der Endpunkt gefunden wird, werden seine Daten in einem Gridview angezeigt und seine ID wird ausgegeben.

### [Variablen/Client.ps1](Variablen/Client.ps1)
Dieses Skript definiert globale Variablen, die für die Autorisierung bei API-Anfragen benötigt werden. Es setzt auch das Sicherheitsprotokoll auf TLS 1.2 und ignoriert die SSL-Zertifikatsüberprüfung.

### [Variablen/Server.txt](Variablen/Server.txt)
Diese Datei enthält die URL des Servers, mit dem die Skripte kommunizieren.

### [run.ps1](run.ps1)
Dieses Skript dient als Hauptskript, das die anderen Skripte ausführt. Es setzt den Benutzernamen und den Endpunktnamen, die in den folgenden Skripten verwendet werden. Derzeit sind die meisten Skripte auskommentiert und werden daher nicht ausgeführt, wenn Sie dieses Skript ausführen.

## Hinweis
Bitte beachten Sie, dass Sie die Dateien im Ordner `Variablen` mit den entsprechenden Werten befüllen müssen, bevor Sie diese Skripte ausführen können. Insbesondere müssen Sie die `Server.txt`-Datei mit der URL Ihres Servers und die `Client.ps1`-Datei mit den erforderlichen Funktionen und Variablen befüllen.