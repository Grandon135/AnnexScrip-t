$tempNet1 = Import-Csv -Path './network1.csv'
$tempNet2 = Import-Csv -Path './network2.csv'

$COMMON_PORTS = @(1..1024)

#create an custom object for the CSV file
$netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
$net1 = @()
$net2 = @()

for ($i=0; $i -lt $tempNet1.length; $i++) {
    $netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
    $netData.IP = $tempNet1[$i].IP
    $netData.HostName = $tempNet1[$i].HostName
    $netData.OS = $tempNet1[$i].OS

    $ports = $COMMON_PORTS | Get-Random -Count 5
    foreach($p in $ports) {
        $netData.OP += "$p " 
    }

    $net1 += $netData
}

Write-Host "Net 1 Ports Complete"

for ($i=0; $i -lt $tempNet2.length; $i++) {
    $netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
    $netData.IP = $tempNet2[$i].IP
    $netData.HostName = $tempNet2[$i].HostName
    $netData.OS =  $tempNet2[$i].OS
    
    $ports = $COMMON_PORTS | Get-Random -Count 5
    foreach($p in $ports) {
        $netData.OP += "$p " 
    }

    $net2 += $netData
}

Write-Host "Net 2 Ports Complete"

$net1 | Export-Csv -Path './network1.csv'
$net2 | Export-Csv -Path './network2.csv'