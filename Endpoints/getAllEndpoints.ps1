# Importiert das Client.ps1-Skript, das benötigte Funktionen und Variablen bereitstellt
. .\Variablen\Client.ps1

# Liest den Inhalt der Server.txt-Datei und speichert ihn in der Variable $serverUrl
$serverUrl = Get-Content -Path .\Variablen\Server.txt

# Definiert die Basis-URL für die API-Anfrage, die alle Windows-Endpunkte abruft und sie nach Hostnamen sortiert
$BaseURL = $serverUrl + "/bconnect/endpoints/v2.0/WindowsEndpoints?OrderBy=HostName&PageSize=1000"

# Erstellt den Header für die API-Anfrage, der die Autorisierungsinformationen enthält
$Headers = @{
    "Authorization" = "Basic $UserPassBase64"
}

# Führt die API-Anfrage aus und speichert die Antwort in der Variable $Response
$Response = Invoke-RestMethod -Uri $BaseURL -Headers $Headers

# Zeigt die Daten der Antwort in einem Gridview an und wählt bestimmte Eigenschaften zur Anzeige aus
$Response.data | Select-Object HostName, registeredUser, ipNetworkName, lastBoot, id, modelName, serialNumber | Out-GridView