# Importiert das Client.ps1-Skript, das benötigte Funktionen und Variablen bereitstellt
. .\Variablen\Client.ps1

# Nimmt den ersten Argumentwert als Endpunktnamen
$EndpointName = $args[0]

# Liest den Inhalt der Server.txt-Datei und speichert ihn in der Variable $serverUrl
$serverUrl = Get-Content -Path .\Variablen\Server.txt

# Definiert die Basis-URL für die API-Anfrage, die einen Windows-Endpunkt erstellt
$BaseURL = $serverUrl + "/bconnect/endpoints/v2.0/WindowsEndpoints"

# Definiert die Eingabevariablen für das Skript
param(
    [string]$EndpointName,
    [string]$LogicalGroupId,
    [string]$Comment,
    [string]$HostName,
    [string]$Domain,
    [string]$PrimaryMAC,
    [string]$PrimaryIP,
    [string]$PrimarySubnetMask,
    [string]$RegisteredUser
)

# Definiert die Header für den API-Aufruf
$Headers = @{
    'accept'        = 'application/json'
    'Content-Type'  = 'application/json'
    'Authorization' = 'Basic ' + $UserPassBase64
}

# Definiert den Body für den API-Aufruf
$Body = @{
    "displayName"                      = $EndpointName
    "logicalGroupId"                   = $LogicalGroupId
    "comment"                          = $Comment
    "hostName"                         = $HostName
    "domain"                           = $Domain
    "primaryMAC"                       = $PrimaryMAC
    "primaryIP"                        = $PrimaryIP
    "primarySubnetMask"                = $PrimarySubnetMask
    "registeredUser"                   = $RegisteredUser
    "registeredUserUpdateMode"         = "UseNextLogonUser"
    "userRelatedJobExecution"          = "Always"
    "isApplicationUsageTrackingActive" = $true
    "isEnergyManagementActive"         = $true
    "clientAgentLink"                  = @{
        "extendedInternetMode" = $true
        "networkMode"          = "LAN"
    }
} | ConvertTo-Json

# Führt den API-Aufruf aus und erstellt einen neuen Windows-Endpunkt
Invoke-RestMethod -Method Post -Uri $BaseURL -Headers $Headers -Body $Body