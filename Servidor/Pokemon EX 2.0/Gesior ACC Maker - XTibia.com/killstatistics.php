<?PHP
$players_deaths = $SQL->query('SELECT `player_deaths`.`id`, `player_deaths`.`date`, `player_deaths`.`level`, `players`.`name`, `players`.`world_id` FROM `player_deaths` LEFT JOIN `players` ON `player_deaths`.`player_id` = `players`.`id` ORDER BY `date` DESC LIMIT 0,'.$config['site']['last_deaths_limit']);
$players_deaths_count = 0;
if(!empty($players_deaths))
{
	foreach($players_deaths as $death)
	{
		$players_deaths_count++;
		if(is_int($players_deaths_count / 2))
			$bgcolor = $config['site']['darkborder'];
		else
			$bgcolor = $config['site']['lightborder'];

		$players_rows .= '<TR BGCOLOR="'.$bgcolor.'"><TD WIDTH="30"><center>'.$players_deaths_count.'.</center></TD><TD WIDTH="125"><small>'.date("j.m.Y, G:i:s",$death['date']).'</small></TD><TD><a href="?subtopic=characters&name='.urlencode($death['name']).'"><b>'.$death['name'].'</b></a> ';
		$killers = $SQL->query("SELECT environment_killers.name AS monster_name, players.name AS player_name, players.deleted AS player_exists
FROM killers LEFT JOIN environment_killers ON killers.id = environment_killers.kill_id
LEFT JOIN player_killers ON killers.id = player_killers.kill_id LEFT JOIN players ON players.id = player_killers.player_id
WHERE killers.death_id = '".$death['id']."' ORDER BY killers.final_hit DESC, killers.id ASC")->fetchAll();

		$i = 0;
		$count = count($killers);
		foreach($killers as $killer)
		{
			$i++;
			if($killer['player_name'] != "")
			{
				if($i == 1)
					$players_rows .= "killed at level <b>".$death['level']."</b>";
				else if($i == $count)
					$players_rows .= " and";
				else
					$players_rows .= ",";

				$players_rows .= " by ";
				if($killer['monster_name'] != "")
					$players_rows .= $killer['monster_name']." summoned by ";

				if($killer['player_exists'] == 0)
					$players_rows .= "<a href=\"index.php?subtopic=characters&name=".urlencode($killer['player_name'])."\">";

				$players_rows .= $killer['player_name'];
				if($killer['player_exists'] == 0)
					$players_rows .= "</a>";
			}
			else
			{
				if($i == 1)
					$players_rows .= "died at level <b>".$death['level']."</b>";
				else if($i == $count)
					$players_rows .= " and";
				else
					$players_rows .= ",";

				$players_rows .= " by ".$killer['monster_name'];
			}
		}

		$players_rows .= '.</TD><TD>'.$config['site']['worlds'][(int)$death['world_id']].'</TD></TR>';
	}
}

if($players_deaths_count == 0)
	$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><B>Last Deaths</B></TD></TR><TR BGCOLOR='.$config['site']['darkborder'].'><TD><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=1><TR><TD>No one died on '.$config['server']['serverName'].'.</TD></TR></TABLE></TD></TR></TABLE><BR>';
else
	$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><B>Last Deaths</B></TD></TR></TABLE><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>'.$players_rows.'</TABLE>';
?>

