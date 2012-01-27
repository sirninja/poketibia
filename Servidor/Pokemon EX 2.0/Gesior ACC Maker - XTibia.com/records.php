<?PHP
$zapytanie = $SQL->query('SELECT * FROM `server_record` ORDER BY `record` DESC LIMIT 25;');
    foreach($zapytanie as $wynik) {
    $data = date("d/m/Y, G:i:s", $wynik['timestamp']);
     $gracze++;
            if(is_int($gracze / 2))
                $bgcolor = $config['site']['lightborder'];
            else
                $bgcolor = $config['site']['darkborder'];
        $tresc .= '<TR BGCOLOR='.$bgcolor.'><TD><center>'.$wynik['record'].'</center></TD><TD><center>'.$data.'</center></TD></TR>';
    }
    $main_content .= '<b><center>Players online records on '.$config['server']['serverName'].'</center></b><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b><center>Players</center></b></TD><TD class="white"><b><center>Date</center></b></TD></TR>'.$tresc.'</TABLE>';
?>
