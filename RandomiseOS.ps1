$tempNet1 = Import-Csv -Path './network1.csv'
$tempNet2 = Import-Csv -Path './network2.csv'

#create an custom object for the CSV file
$netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
$net1 = @()
$net2 = @()

for ($i=0; $i -lt $tempNet1.length; $i++) {
    $netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
    $netData.IP = $tempNet1[$i].IP
    $netData.HostName = $tempNet1[$i].HostName

    $OSNum = Get-Random -Maximum 3
    if($OSNum -eq 0) {
        $netData.OS = "Probably Windows"
    }
    elseif ($OSNum -eq 1) {
        $netData.OS = "Probably Linux"
    }
    elseif ($OSNum -eq 2) {
        $netData.OS = "Probably Windows"
    }
    $netData.OP = ""

    $net1 += $netData
}

Write-Host "Net 1 OS Complete"

for ($i=0; $i -lt $tempNet2.length; $i++) {
    $netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
    $netData.IP = $tempNet2[$i].IP
    $netData.HostName = $tempNet2[$i].HostName
    $OSNum = Get-Random -Maximum 3
    if($OSNum -eq 0) {
        $netData.OS = "Probably Windows"
    }
    elseif ($OSNum -eq 1) {
        $netData.OS = "Probably Linux"
    }
    elseif ($OSNum -eq 2) {
        $netData.OS = "Probably Windows"
    }

    $netData.OP = ""

    $net2 += $netData
}

Write-Host "Net 2 OS Complete"

$net1 | Export-Csv -Path './network1.csv'
$net2 | Export-Csv -Path './network2.csv'