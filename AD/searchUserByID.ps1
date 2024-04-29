# Importiert das Client.ps1-Skript, das benötigte Funktionen und Variablen bereitstellt
. .\Variablen\Client.ps1

# Liest den Inhalt der Server.txt-Datei und speichert ihn in der Variable $serverUrl
$serverUrl = Get-Content -Path .\Variablen\Server.txt

# Nimmt den ersten Argumentwert als Benutzernamen
$Username = $args[0]

# Definiert die Basis-URL für die erste API-Anfrage, die nach einem bestimmten Benutzer sucht
$BaseURL = $serverUrl + "/bconnect/activedirectory/v2.0/ADUsers?OrderBy=Name&SearchQuery=" + $Username + "&PageSize=1000"

# Erstellt den Header für die API-Anfrage, der die Autorisierungsinformationen und den gewünschten Antworttyp enthält
$Headers = @{
    "Authorization" = "Basic $UserPassBase64"
    "Accept"        = "application/json"
}

# Führt die erste API-Anfrage aus und speichert die Antwort in der Variable $Response
$Response = Invoke-RestMethod -Uri $BaseURL -Headers $Headers

# Überprüft, ob die Antwort Daten enthält
if ($Response.data.Count -gt 0) {
    # Wenn Daten vorhanden sind, wird die ID des ersten Elements des Antwortdaten-Arrays in der Variable $UserID gespeichert

    $UserID = $Response.data[0].ID

    # Definiert die Basis-URL für die zweite API-Anfrage, die nach einem Benutzer mit einer bestimmten ID sucht
    $BaseURL = $serverUrl + "/bconnect/activedirectory/v2.0/ADUsers/" + $UserID

    # Führt die zweite API-Anfrage aus und speichert die Antwort in der Variable $Response
    $Response = Invoke-RestMethod -Uri $BaseURL -Headers $Headers

    # Zeigt die Antwortdaten in einem Gridview an
    $Response | Out-GridView
}