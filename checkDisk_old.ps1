$hi =  Get-WmiObject Win32_DiskDrive
# foreach ($x in $hi){ echo $x.model - $x.Size }
foreach ($x in $hi){
    $query = "INSERT INTO checkDisk VALUES ('" + $env:computername + "', '"+ $x.model +"', '"+[math]::Round($x.Size/1024/1024/1024, 2) + "GB', '"+$x.status+"' );"
    echo $query;
    \\10.4.39.204\wymiana$\checkDisk\mysql.exe -h 10.4.39.204 --user=skrypty --password=Skrypty123 --database=skrypty --execute=$query
}
