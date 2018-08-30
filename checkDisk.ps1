# ===================== KONFIGURACJA =====================

# lokalizacja smartctl
$smartctl = "\\10.4.39.204\wymiana$\checkDisk\smartctl.exe";

# lokalizacja mysql
$mysql = "\\10.4.39.204\wymiana$\checkDisk\mysql.exe";

# dane do bazy z wynikami
$mysql_host = "10.4.39.204";
$mysql_user = "skrypty";
$mysql_passw = "Skrypty123";

# ===================== KONFIGURACJA =====================


function trimuj([string] $text) {
    #echo $smart $text;
    if ($text -ne ""){
        # $tmp_1 = $text.Substring(75,12).Trim();
        $tmp = $text.Substring(87, $text.length - 87).Trim();
        return $tmp;
    }
    else {
        # empty value
        return ""
    }
}

$dlist = &$smartctl --scan-open
foreach ($i in $dlist){
    $disk = $i.split()[0];
    $type = $i.split()[2]
    if ($disk -like "/dev/sd*") {

        $smart = &$smartctl --attributes $disk;

        [string] $row = $smart | Select-String -Pattern 'Throughput_Performance';
        $02 = trimuj $row

        [string] $row = $smart | Select-String -Pattern 'Reallocated_Sector_Ct';
        $05 = trimuj $row

        [string] $row = $smart | Select-String -Pattern 'Reallocated_Event_Count';
        $C4 = trimuj $row

        [string] $row = $smart | Select-String -Pattern 'Current_Pending_Sector';
        $C5 = trimuj $row

        echo "[dysk: $disk] => [02]: $02  [05]: $05,  [C4]: $C4  [C5]: $C5";
        $query = "INSERT INTO checkDisk VALUES ( '" + $env:computername + "', '$disk', '$02', '$05', '$C4', '$C5');";
        &$mysql --host $mysql_host --user=$mysql_user --password=$mysql_passw --database=skrypty --execute=$query

    }
}

exit
