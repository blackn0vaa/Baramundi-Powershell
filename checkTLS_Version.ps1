# Definiert den Server und den Port, zu dem eine Verbindung hergestellt werden soll
#schreibweise $server = "Server.Domain"
$server = "Server.Domain"
$port = 443

# Erstellt eine Instanz von TcpClient und stellt eine Verbindung zum definierten Server und Port her
$client = New-Object System.Net.Sockets.TcpClient($server, $port)

# Erstellt einen SslStream, der die Datenübertragung zwischen Client und Server sichert
$stream = New-Object System.Net.Security.SslStream($client.GetStream(), $false)

# Versucht, die Verbindung als Client zu authentifizieren und gibt die verwendete TLS-Version aus
try {
    $stream.AuthenticateAsClient($server)
    Write-Host "Verwendete TLS-Version: $($stream.SslProtocol)"
}
# Fängt mögliche Fehler während der Authentifizierung ab und gibt sie aus
catch {
    Write-Host "Fehler: $_"
}
# Schließt den Stream und den Client, unabhängig davon, ob die Authentifizierung erfolgreich war oder nicht
finally {
    $stream.Close()
    $client.Close()
}