$networks = Import-Csv -Path (Get-ChildItem -Path './' -filter 'net*') #450 + 314
$personasIn = Get-Content -Path './Personas.txt'

$persona = @()
$personaData = ($personaData = "" | Select-Object IP, HostName, Persona)

$hosts = $networks | Select IP, HostName | Get-Random -Count 175

foreach($i in $hosts) {
    $rPersonas = Get-Random -Minimum 1 -Maximum 4
    $per = $personasIn | Get-Random -Count $rPersonas
    foreach($p in $per){
        $personaData = ($personaData = "" | Select-Object IP, HostName, Persona)
        $personaData.IP = $i.IP
        $personaData.HostName = $i.HostName
        $personaData.Persona = ""
        $personaData.Persona = $p
        $persona += $personaData
    }
}

$persona | Export-Csv -Path './personas.csv'