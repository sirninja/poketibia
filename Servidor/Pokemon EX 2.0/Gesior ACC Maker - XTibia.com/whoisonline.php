<?PHP
$update_interval = 10;
if(count($config['site']['worlds']) > 1)
{
	$worlds .= '<i>Select world:</i> ';
	foreach($config['site']['worlds'] as $id => $world_n)
	{
		$worlds .= ' <a href="?subtopic=whoisonline&world='.$id.'">'.$world_n.'</a> , ';
		if($id == (int) $_GET['world'])
		{
			$world_id = $id;
			$world_name = $world_n;
		}
	}
	$main_content .= substr($worlds, 0, strlen($worlds)-3);
}
if(!isset($world_id))
{
	$world_id = 0;
	$world_name = $config['server']['serverName'];
}
$order = $_REQUEST['order'];
if($order == 'level')
	$orderby = 'level';
elseif($order == 'vocation')
	$orderby = 'vocation';
if(empty($orderby))
	$orderby = 'name';
$tmp_file_name = 'cache/whoisonline-'.$orderby.'-'.$world_id.'.tmp';
if(file_exists($tmp_file_name) && filemtime($tmp_file_name) > (time() - $update_interval))
{
	$tmp_file_content = explode(",", file_get_contents($tmp_file_name));
	$number_of_players_online = $tmp_file_content[0];
	$players_rows = $tmp_file_content[1];
}
else
{
	$players_online_data = $SQL->query('SELECT * FROM players WHERE world_id = '.(int) $world_id.' AND online > 0 ORDER BY '.$orderby);
	$number_of_players_online = 0;
	foreach($players_online_data as $player)
	{
		$number_of_players_online++;
		$acc = $SQL->query('SELECT * FROM '.$SQL->tableName('accounts').' WHERE '.$SQL->fieldName('id').' = '.$player['account_id'].'')->fetch();
		if(is_int($number_of_players_online / 2))
			$bgcolor = $config['site']['darkborder'];
		else
			$bgcolor = $config['site']['lightborder'];
			 $rs = "";
if ($player['skulltime'] > 0 && $player['skull'] == 3)
                $rs = "<img style='border: 0;' src='./images/whiteskull.gif'/>";
        elseif ($player['skulltime'] =  $player['skull'] == 4)
                $rs = "<img style='border: 0;' src='./images/redskull.gif'/>";
        elseif ($player['skulltime'] =  $player['skull'] == 5)
                $rs = "<img style='border: 0;' src='./images/blackskull.gif'/>";
                
		$players_rows .= '<TR BGCOLOR='.$bgcolor.'><TD WIDTH=10%><image src="images/flags/'.$acc['flag'].'.png"/></TD><TD WIDTH=70%><A HREF="?subtopic=characters&name='.urlencode($player['name']).'">'.$player['name'].$rs.'</A></TD><TD WIDTH=10%>'.$player['level'].'</TD><TD WIDTH=20%>'.$vocation_name[$world_id][$player['promotion']][$player['vocation']].'</TD></TR>';
	}
	file_put_contents($tmp_file_name, $number_of_players_online.','.$players_rows);
}
//Wykresik
$main_content.= '    <TABLE BORDER=0 CELLPADDING=4 CELLSPACING=1 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD WIDTH=10% CLASS=white><center><B>Players Online Chart</B></TD></TR></TABLE>
        <table align="center"><td>
<a href="http://otslist.eu/"><img border="0" src="http://otslist.eu/stats/'.$config['site']['otslist.eu'].'" width="100%" /></a>
    </td>
      </tr>
      </table>';
if($number_of_players_online == 0)
	//server status - server empty
	$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><B>Server Status</B></TD></TR><TR BGCOLOR='.$config['site']['darkborder'].'><TD><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=1><TR><TD>Currently no one is playing on <b>'.$config['site']['worlds'][$world_id].'</b>.</TD></TR></TABLE></TD></TR></TABLE><BR>';
else
{
//Vocations pics
$vocs = array();
foreach($SQL->query('SELECT `vocation`, COUNT(`id`) AS `count` FROM `players` WHERE `world_id` = "'.$world_id.'" AND `online` > 0 GROUP BY `vocation`') as $entry)
	  $vocs[$entry['vocation']] = $entry['count'];
$main_content .= '<table width="200" cellspacing="1" cellpadding="0" border="0" align="center">
    <tbody>
        <tr>
            <tr bgcolor="'.$config['site']['darkborder'].'">
            <td><img src="images/sorc.png" /></td>
            <td><img src="images/druid.png" /></td>
            <td><img src="images/paly.png" /></td>
            <td><img src="images/kina.png" /></td>
        </tr>
        <tr>
            <tr bgcolor="'.$config['site']['vdarkborder'].'">
            <td style="text-align: center;"><strong>Sorcerers<br /></strong></td>
            <td style="text-align: center;"><strong>Druids</strong></td>
            <td style="text-align: center;"><strong>Paladins</strong></td>
            <td style="text-align: center;"><strong>Knights</strong></td>
        </tr>
        <tr>
            <TR BGCOLOR="'.$config['site']['lightborder'].'">
            <td style="text-align: center;">'.$vocs[1].'</td>
            <td style="text-align: center;">'.$vocs[2].'</td>
            <td style="text-align: center;">'.$vocs[3].'</td>
            <td style="text-align: center;">'.$vocs[4].'</td>
        </tr>
    </tbody>
</table>
<div style="text-align: center;">&nbsp;</div>';

$main_content .= "<table width='100%' cellspacing='1'>
        <tr>
            <td style='background: ".$bgcolor.";' align='center'>
                <img src='./images/whiteskull.gif'/> - 1 - 6 Frags
                <br/>
                <img src='./images/redskull.gif'/> - 6+ Frags or Red Skull
                <br/>
                <img src='./images/blackskull.gif'/> - 10+ Frags or Black Skull
            </td>
        </tr>
        </table>";
	//server status - someone is online
	$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><B>Server Status</B></TD></TR><TR BGCOLOR='.$config['site']['darkborder'].'><TD><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=1><TR><TD>Currently '.$number_of_players_online.' players are online on <b>'.$config['site']['worlds'][$world_id].'</b>.</TD></TR></TABLE></TD></TR></TABLE><BR>';
	
      //list of players
	$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD><a href="" CLASS=white >Country</a></TD><TD><A HREF="?subtopic=whoisonline&order=name&world='.$world_id.'" CLASS=white>Name</A></TD><TD><A HREF="?subtopic=whoisonline&order=level&world='.$world_id.'" CLASS=white>Level</A></TD><TD><A HREF="?subtopic=whoisonline&order=vocation&world='.$world_id.'" CLASS=white>Vocation</TD></TR>'.$players_rows.'</TABLE>';
	//search bar
	$main_content .= '<BR><FORM ACTION="?subtopic=characters" METHOD=post>  <TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Search Character</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><TR><TD>Name:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></TABLE></TD></TR></TABLE></FORM>';
}
?>
