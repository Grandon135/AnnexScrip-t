$networks = Import-Csv -Path (Get-ChildItem -Path './' -filter 'net*') # Total 1064
$personas = Import-Csv -Path '.\personas.csv' #700

$annex =@()

$networks = $networks | sort {[version]$_.IP}

for($y = 0; $y -lt $networks.length; $y++) {
    $AnnexData = ($AnnexData = ""| Select-Object RefNum, IP, HostName, OS, OP, Persona, Location)
    $current = $networks[$y]
    $AnnexData.IP = $current.IP
    $AnnexData.HostName = $current.Hostname
    $AnnexData.OS = $current.OS
    $AnnexData.OP = $current.OP
    $AnnexData.Persona = ""
    $AnnexData.Location = ""
    
    #Set Ref Num currectly
    if($current.IP.split('.')[0] -eq 10) {
        $index = $y + 1
        $AnnexData.RefNum = "Net1-$index" 
    }
    else {
        $index = $y + 1
        $AnnexData.RefNum = "Net2-$index"
    }

    #Set Location
    if($current.Hostname.contains('ga') -or $current.Hostname.contains('GA')) { $AnnexData.Location = "Georgia" }
    if($current.Hostname.contains('sc') -or $current.Hostname.contains('SC')) { $AnnexData.Location = "South Carolina" }
    if($current.Hostname.contains('al') -or $current.Hostname.contains('AL')) { $AnnexData.Location = "Alabama" }
    
    for($x =0;$x -lt $personas.Length; $x++) {
        $pcurrent = $personas[$x]
        if($pcurrent.IP -eq $current.IP) { $AnnexData.Persona += $pcurrent.Persona + " "}
    }
    $annex += $AnnexData;
}

$annex | Export-Csv -Path './annex.csv'