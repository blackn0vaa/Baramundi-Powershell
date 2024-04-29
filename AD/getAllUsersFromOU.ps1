# Importiert das Client.ps1-Skript, das benötigte Funktionen und Variablen bereitstellt
. .\Variablen\Client.ps1

# Liest den Inhalt der Server.txt-Datei und speichert ihn in der Variable $serverUrl
$serverUrl = Get-Content -Path .\Variablen\Server.txt

# Definiert die Basis-URL für die API-Anfrage und die Basis64-kodierte Benutzername-Passwort-Kombination
$BaseURL = $serverUrl + "/bconnect/activedirectory/v2.0/ADGroups?OrderBy=Name&SearchQuery=Users&Page=1"
$UserPassBase64 = $UserPassBase64

# Erstellt den Header für die API-Anfrage, der die Autorisierungsinformationen und den gewünschten Antworttyp enthält
$Headers = @{
    "Authorization" = "Basic $UserPassBase64"
    "Accept"        = "application/json"
}

# Führt die API-Anfrage aus und speichert die Antwort in der Variable $Response
$Response = Invoke-RestMethod -Uri $BaseURL -Headers $Headers

# Überprüft, ob die Antwort Daten enthält
if ($Response.data.Count -gt 0) {
    # Wenn Daten vorhanden sind, wird das erste Element des Antwortdaten-Arrays in einem Gridview angezeigt
    $Response.data[0] | Out-GridView
}
else {
    # Wenn keine Daten vorhanden sind, wird eine entsprechende Nachricht ausgegeben
    Write-Host "Das Array ist leer."
}