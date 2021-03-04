$net1IPArrayPos = @()
$net2IPArrayPos = @()

#Generate All of net1's possible IPS
for($z=0; $z -le 1; $z++){
    for($y=0; $y -le 255; $y++) {
        $net1IPArrayPos += "10.0.$z.$y"
        $net2IPArrayPos += "172.16.$z.$y"
    }
}

Write-Host "Generated Possiable IPs"

#create an custom object for the CSV file
$netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
$net1 =@()
$net2 =@()

#generate a list of random ip's from the list of possible IPS
$net1IPArray = $net1IPArrayPos | Get-random -Count 450

Write-Host "Got Random Net 1"

$net2IPArray = $net2IPArrayPos | Get-random -Count 314

Write-Host "Got Random Net 2"

foreach ($i in $net1IPArray) {
    $netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
    $netData.IP = $i
    $netData.HostName = ""
    $netData.OS = ""
    $netData.OP = ""

    $net1 += $netData
}

foreach ($i in $net2IPArray) {
    $netData = ($netData = ""| Select-Object IP, HostName, OS, OP)
    $netData.IP = $i
    $netData.HostName = ""
    $netData.OS = ""
    $netData.OP = ""

    $net2 += $netData
}

$net1 | Export-Csv -Path './network1.csv'
$net2 | Export-Csv -Path './network2.csv'