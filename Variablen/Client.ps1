# Client.ps1
# Definiert die globale Variable UserPass mit den Anmeldedaten für den baramundi-Server
#Schreibweise: $global:UserPass = "domain\Username:PASSWORD"
$global:UserPass = "domain\Username:PASSWORD"

# Konvertiert die Anmeldedaten in das Base64-Format, um sie in der Autorisierungsanforderung zu verwenden
$global:UserPassBase64 = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes($global:UserPass))

# Setzt das Sicherheitsprotokoll auf TLS 1.2, um eine sichere Verbindung zum Server herzustellen
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Ignoriert die SSL-Zertifikatsüberprüfung, um Verbindungsprobleme aufgrund von ungültigen oder selbstsignierten Zertifikaten zu vermeiden
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }