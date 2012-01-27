<?php
$list = $SQL->query('SELECT name,online,group_id,world_id FROM players WHERE players.group_id > 1 ORDER BY group_id DESC');
$showed_players = 0;
$groups = simplexml_load_file($config['site']['server_path'].'/data/XML/groups.xml') or die('<b>Could not load groups!</b>'); 
        foreach($groups->group as $g) 
            $groupList[(int)$g['id']] = $g['name']; 

$main_content .= '<center><h2>Support in game</h2></center>';
$main_content .= "<table border=0 cellspacing=1 cellpadding=4 width=100%>
	<tr bgcolor=\"".$config['site']['vdarkborder']."\">
	<td width=\"20%\"><font class=white><b>Group</b></font></td>
	<td width=\"45%\"><font class=white><b>Name</b></font></td>
	<td width=\"15%\"><font class=white><b>Status</b></font></td>
	<td width=\"20%\"><font class=white><b>World</b></font></td>";
foreach($list as $gm) {
	if($gm['online'] == 0)
		$player_list_status = '<font color="red">Offline</font>';
	else
		$player_list_status = '<font color="green">Online</font>';
		if(is_int($showed_players / 2))
			$bgcolor = $config['site']['darkborder'];
		else
			$bgcolor = $config['site']['lightborder'];
$showed_players++;
$main_content .= '<tr bgcolor="'.$bgcolor.'"><td>' . $groupList[(int)$gm['group_id']] . '</td><td><a href="?subtopic=characters&name='.urlencode($gm['name']).'">'.$gm['name'].'</a></td><td>'.$player_list_status.'</td><td>'.$config['site']['worlds'][$gm['world_id']].'</td></tr>';
}

$main_content .= "</table>";
?>