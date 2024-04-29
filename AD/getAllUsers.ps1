# Importiert das Client.ps1-Skript, das benötigte Funktionen und Variablen bereitstellt
. .\Variablen\Client.ps1

# Liest den Inhalt der Server.txt-Datei und speichert ihn in der Variable $serverUrl
$serverUrl = Get-Content -Path .\Variablen\Server.txt

# Definiert die Basis-URL für die API-Anfrage und die Basis64-kodierte Benutzername-Passwort-Kombination
$BaseURL = $serverUrl + "/bconnect/activedirectory/v2.0/ADUsers?OrderBy=Name&PageSize=1000"
$UserPassBase64 = $UserPassBase64

# Erstellt den Header für die API-Anfrage, der die Autorisierungsinformationen enthält
$Headers = @{
    "Authorization" = "Basic $UserPassBase64"
}

# Führt die API-Anfrage aus und speichert die Antwort in der Variable $Response
$Response = Invoke-RestMethod -Uri $BaseURL -Headers $Headers

# Verarbeitet die Daten aus der Antwort, sortiert die Ausgabe so, dass LastName und FirstName zuerst angezeigt werden, und zeigt die Ergebnisse in einem Gridview an
$Response.data | Select-Object LastName, FirstName, * -ExcludeProperty LastName, FirstName | Out-GridView