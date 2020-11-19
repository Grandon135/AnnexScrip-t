$networks = Import-Csv -Path (Get-ChildItem -Path './' -filter 'net*') # Total 1064

$personas = Import-Csv -Path '.\personas.csv' #700

$annex =@()

for($y = 0; $y -lt $networks.length; $y++) {
    $AnnexData = ($AnnexData = ""| Select-Object RefNum, IP, HostName, OS, OP, Persona, Location)
    $current = $networks[$y]
    $AnnexData.IP = $current.IP
    $AnnexData.HostName = $current.Hostname
    $AnnexData.OS = $current.'Probably OS'
    $AnnexData.OP = $current.'Open Ports'
    $AnnexData.Persona = ""
    $AnnexData.Location = ""
    
    #Set Ref Num currectly
    if($current.IP.split('.')[1] -eq 0 -or $current.IP.split('.')[1] -eq 1) {
        $index = $y + 1
        $AnnexData.RefNum = "Net1-$index" 
    }
    else {
        $index = $y + 1
        $AnnexData.RefNum = "Net2-$index"
    }

    #Set Location
    if($current.Hostname.contains('ga')) { $AnnexData.Location = "Geogra" }
    
    for($x =0;$x -lt $personas.Length; $x++) {
        $pcurrent = $personas[$x]
        if($pcurrent.IP -eq $current.IP) { $AnnexData.Persona += $pcurrent.Persona + " "}
    }
    $annex += $AnnexData;
}

$annex | Export-Csv -Path './annex.csv'