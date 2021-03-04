$tempNet1 = Import-Csv -Path './network1.csv'
$tempNet2 = Import-Csv -Path './network2.csv'

#create an custom object for the CSV file
$netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
$net1 = @()
$net2 = @()

for ($i=0; $i -lt $tempNet1.length; $i++) {
    $netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
    $netData.IP = $tempNet1[$i].IP
    
    $ComNum = Get-Random -Maximum 450 
    $LocNum = Get-Random -Maximum 3
    if($LocNum -eq 0) {
        $netData.HostName = "Computer-$ComNum.GA.mil"
    }
    elseif ($LocNum -eq 1) {
        $netData.HostName = "Computer-$ComNum.SC.mil"
    }
    elseif ($LocNum -eq 2) {
        $netData.HostName = "Computer-$ComNum.AL.mil"
    }
    else {
        $netData.HostName = ""
    }

    $netData.OS = ""
    $netData.OP = ""

    $net1 += $netData
}

Write-Host "Net 1 Hostname Complete"

for ($i=0; $i -lt $tempNet2.length; $i++) {
    $netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
    $netData.IP = $tempNet2[$i].IP

    $ComNum = Get-Random -Maximum 314
    $LocNum = Get-Random -Maximum 3
    if($LocNum -eq 0) {
        $netData.HostName = "Computer-$ComNum.GA.mil"
    }
    elseif ($LocNum -eq 1) {
        $netData.HostName = "Computer-$ComNum.SC.mil"
    }
    elseif ($LocNum -eq 2) {
        $netData.HostName = "Computer-$ComNum.AL.mil"
    }
    else {
        $netData.HostName = ""
    }


    $netData.OS = ""
    $netData.OP = ""

    $net2 += $netData
}

Write-Host "Net 2 Hostname Complete"

$net1 | Export-Csv -Path './network1.csv'
$net2 | Export-Csv -Path './network2.csv'