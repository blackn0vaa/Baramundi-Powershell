# Importiert das Client.ps1-Skript, das benötigte Funktionen und Variablen bereitstellt
. .\Variablen\Client.ps1

# Liest den Inhalt der Server.txt-Datei und speichert ihn in der Variable $serverUrl
$serverUrl = Get-Content -Path .\Variablen\Server.txt

# Definiert die Basis-URL für die API-Anfrage, die alle Bedrohungen abruft und sie nach Schweregrad sortiert
$BaseURL = $serverUrl + "/bconnect/defensecontrol/v2.0/MicrosoftDefender/Threats?OrderBy=Serverity&PageSize=1000"

# Erstellt den Header für die API-Anfrage, der die Autorisierungsinformationen und den gewünschten Antworttyp enthält
$Headers = @{
    "Authorization" = "Basic $UserPassBase64"
    "Accept"        = "application/json"
}

# Führt die API-Anfrage aus und speichert die Antwort in der Variable $Response
$Response = Invoke-RestMethod -Uri $BaseURL -Headers $Headers

# Überprüft, ob die Antwort Daten enthält
if ($Response.data.Count -gt 0) {
    # Wenn Daten vorhanden sind, wird jedes Element des Antwortdaten-Arrays in einem Gridview angezeigt und die ID des ersten Elements ausgegeben
    $Response.data | Out-GridView
    $Response.data[0].ID
}
else {
    # Wenn keine Daten vorhanden sind, wird eine entsprechende Nachricht ausgegeben
    Write-Host "Das Array ist leer."
}