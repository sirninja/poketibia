<?PHP
if($logged && $account_logged->getPageAccess() > 0)
{
	if(!empty($action))
	{
		$name = $_GET['name'];
		$name_new = $_GET['name_new'];
		$player = new OTS_Player();
		$player->find($name);
		if($player->isLoaded() && $player->isNameLocked())
		{
			if($name_new == $player->getOldName())
			{
				if($action == 'accept')
				{
					$main_content .= '<font color="green">Changed name from <b>'.$player->getName().'</b> to <b>'.$player->getOldName().'</b>.</font>';
					$player->setCustomField('old_name', $player->getName());
					$player->setCustomField('name', $player->getOldName());
					$player->setCustomField('nick_verify', 1);
					$player->removeNameLock();
				}
				elseif($action == 'reject')
				{
					$main_content .= '<font color="green">Rejected proposition of change name from <b>'.$player->getName().'</b> to <b>'.$player->getOldName().'</b>.</font>';
					$player->setCustomField('old_name', '');
				}
			}
			else
				$main_content .= '<font color="red">Invalid new name. Try again.</font><br>';
		}
		else
			$main_content .= '<font color="red">Player with this name doesn\'t exist or isn\'t namelocked.</font><br>';
	}
	$main_content .= '<h2>First 50 namelocked players</h2>';
	$main_content .= '<table><tr bgcolor="'.$config['site']['vdarkborder'].'"><td><font color="white"><b>- New nick proposition -</b></font></td><td><font color="white"><b>- ACCEPT -</b></font></td><td><font color="white"><b>- REJECT -</b></font></td></tr>';
	$number_of_rows = 1;
	$players_info = $SQL->query("SELECT `players`.`name`, `players`.`old_name` AS `name_new` FROM `bans`, `players` WHERE `players`.`old_name` != '' AND `bans`.`value` = `players`.`id` AND `bans`.`active` = 1");
	$players = array();
	foreach($players_info->fetchAll() as $player)
	{
		if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
		$main_content .= '<tr bgcolor="'.$bgcolor.'"><td>'.$player['name_new'].'</td><td><a href="?subtopic=namelock&action=accept&name='.urlencode($player['name']).'&name_new='.urlencode($player['name_new']).'"><font color="green">Accept</font></a></td><td><a href="?subtopic=namelock&action=reject&name='.urlencode($player['name']).'&name_new='.urlencode($player['name_new']).'"><font color="red">Reject</font></a><td></tr>';
	}
	$main_content .= '</TABLE>';

}
else
	$main_content .= 'You are not logged or you dont have access to this site.';
?>