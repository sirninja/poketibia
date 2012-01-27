<?PHP
$name = stripslashes(ucwords(strtolower(trim($_REQUEST['name']))));
if(empty($name)) {
	$main_content .= 'Here you can get detailed information about a certain player on '.$config['server']['serverName'].'.<BR>  <FORM ACTION="?subtopic=characters" METHOD=post><TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Search Character</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><TR><TD>Name:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></TABLE></TD></TR></TABLE></FORM>';
}
else
{
	if(check_name($name)) {
		$player = $ots->createObject('Player');
		$player->find($name);
		if($player->isLoaded()) {
			$account = $player->getAccount();
			$main_content .= '<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100%><TR><TD><IMG SRC="'.$layout_name.'/images/general/blank.gif" WIDTH=10 HEIGHT=1 BORDER=0></TD><TD><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Character Information</B></TD></TR>';
			if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD WIDTH=20%>Name:</TD><TD><font color="';
			$main_content .= ($player->isOnline()) ? 'green' : 'red';
			$main_content .= '"><b>'.$player->getName().'</b></font>';
			if($player->isDeleted())
				$main_content .= '<font color="red"> [DELETED]</font>';
			if($player->isNameLocked())
				$main_content .= '<font color="red"> [NAMELOCK]</font>';
			$main_content .= '</TD></TR>';
			if($player->getOldName())
			{
				if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				if($player->isNameLocked())
					$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Proposition:</TD><TD>'.$player->getOldName().'</TD></TR>';
				else
					$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Old name:</TD><TD>'.$player->getOldName().'</TD></TR>';
			}
			            // BEGIN Position Showing *** Fixed by jerryb1988 from otfans.net
            $group = $player->getGroup();
            if ($group == 2){$group_name = 'Tutor';}
            if ($group == 3){$group_name = 'Senior Tutor';}
            if ($group == 4){$group_name = 'Gamemaster';}
            if ($group == 5){$group_name = 'Community Manager';}
            if ($group == 6){$group_name = 'GOD';}

            if($group != 1)
            {

                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Position:</TD><TD>'.$group_name.'</TD></TR>';
            }
            // END Position Showing
			if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Sex:</TD><TD>';
			$main_content .= ($player->getSex() == 0) ? 'female' : 'male';
			$main_content .= '</TD></TR>';
			if($config['site']['show_marriage_info'])
			{
				if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Marital status:</TD><TD>';
				$marriage = new OTS_Player();
				$marriage->load($player->getMarriage());
				if($marriage->isLoaded())
					$main_content .= 'married to <a href="?subtopic=characters&name='.urlencode($marriage->getName()).'"><b>'.$marriage->getName().'</b></a></TD></TR>';
				else
					$main_content .= 'single</TD></TR>';
			}
			if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Profession:</TD><TD>'.$vocation_name[$player->getWorld()][$player->getPromotion()][$player->getVocation()].'</TD></TR>';
			if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Level:</TD><TD>'.$player->getLevel().'</TD></TR>';
			if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>World:</TD><TD>'.$config['site']['worlds'][$player->getWorld()].'</TD></TR>';
			if(!empty($towns_list[$player->getWorld()][$player->getTownId()]))
			{
				if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
             	$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Residence:</TD><TD>'.$towns_list[$player->getWorld()][$player->getTownId()].'</TD></TR>';
			 if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
            $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Balance:</TD><TD>'.$player->getBalance().' Gold Coins.</TD></TR>';


                  }

			$rank_of_player = $player->getRank();
			if(!empty($rank_of_player))
			{
			{
			$guild_id = $rank_of_player->getGuild()->getId();
			$guild_name = $rank_of_player->getGuild()->getName();
				if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Guild Membership:</TD><TD>'.$rank_of_player->getName().' of the <a href="?subtopic=guilds&action=show&guild='.$guild_id.'">'.$guild_name.'</a></TD></TR>';
			}
			}
			if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			$lastlogin = $player->getLastLogin();
			if(empty($lastlogin))
				$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Last login:</TD><TD>Never logged in.</TD></TR>';
			else
				$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Last login:</TD><TD>'.date("j F Y, g:i a", $lastlogin).'</TD></TR>';
				if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			if($config['site']['show_creationdate'] && $player->getCreated())
			{
				$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Created:</TD><TD>'.date("j F Y, g:i a", $player->getCreated()).'</TD></TR>';
			}
			if($config['site']['show_vip_status'])
			{
           		 $id = $player->getCustomField("id");
				if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
         		   $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD WIDTH=10%>Vip Status:</TD>';
                         $vip = $SQL->query('SELECT * FROM player_storage WHERE player_id = '.$id.' AND `key` = '.$config['site']['show_vip_storage'].';')->fetch();
         		   if($vip == false) {
        		    $main_content .= '<TD><span class="red"><B>NOT VIP</B></TD></TR>';
        		    }
        		    else
       			     {
       		          $main_content .= '<TD><span class="green"><B>VIP</B></TD></TR>';
          		  }
			$comment = $player->getComment();
			$newlines   = array("\r\n", "\n", "\r");
			$comment_with_lines = str_replace($newlines, '<br />', $comment, $count);
			if($count < 50)
				$comment = $comment_with_lines;
			if(!empty($comment))
			{
				if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD VALIGN=top>Comment:</TD><TD>'.$comment.'</TD></TR>';
			}
			}

			//Outfit shower by Pening edited by loleslav
			if($config['site']['show_outfit']) {
            $id = $player->getCustomField("id");
            $main_content .= '<TD BGCOLOR="'.$config['site']['darkborder'].'">Outfit:';
			$listaddon = array('128','129','130','131','132','133','134','135','136','137','138','139','140','141','142','143','144','145','146','147','148','149','150','151','152','153','154','155','158','159','251','252','268','269','270','273','278','279','288','289','302','324','325');
			$lookadd = array('0','1','2','3');
			foreach ($listaddon as $pid => $name)
				foreach ($lookadd as $addo => $name) {
					$addon1 = $SQL->query('SELECT * FROM players WHERE id = '.$id.' AND looktype = '.$listaddon[$pid].' AND lookaddons = '.$lookadd[$addo].';')->fetch();
					if($addon1[looktype] == true ) {
						$finaddon = $addon1[looktype] + $addon1[lookaddons] * 300;
						$main_content .= '<TD with=50% style="background-color: '.$config['site']['darkborder'].'"><center><img src="images/addons/'.$finaddon.'.gif"/></center></TD></TD>';
					}
				}
			}
			$main_content .= '</td>';
			//end   Outfit shower by Pening edited by loleslav
			if($config['site']['show_signature']) {
			// Signature by makr0mango.
function randomSignature( $folder ) {
    $files = scandir ( "./$folder/" );
    $signature = array();

    foreach ( $files as $file ):
        if ( substr ( strtolower ( $file ) , -4 ) == ".png" )
            $signature[] = $file;
    endforeach;

    return rand(0,count($signature)-1);
}
			$random = randomSignature("signatures");
			$main_content .= '<br><tr></tr><tr></tr><tr></tr><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Signature</B></TD></TR>';
			$main_content .= "<TR BGCOLOR=".$config['site']['darkborder']."><TD WIDTH=20%>Forum Link:</TD><TD><input type='text' size='75' onclick='this.select();' value='[url=\"http://" . $_SERVER['HTTP_HOST'] . "\"][IMG]http://" . $_SERVER['HTTP_HOST'] . "/signature.php?character=" .$player->getName(). "&image=" . $random . "[/IMG][/url]' /></TD></TR>";
			$main_content .= "<TR BGCOLOR=".$config['site']['lightborder']."><TD WIDTH=20%>Direct Link:</TD><TD><input type='text' size='75' onclick='this.select();' value='http://" . $_SERVER['HTTP_HOST'] . "/signature.php?character=" .$player->getName(). "&image=" . $random . "' /></TD></TR>";
			$main_content .= "<TR BGCOLOR=".$config['site']['darkborder']."><TD COLSPAN='2' style='text-align: center;'><img src='signature.php?character=" .$player->getName(). "&image=" . $random . "' /></TD></TR>";
			$main_content .= '</TD></TR></TABLE>';
			// Signature by makr0mango.
			}
			//modified status scripts by ballack13
			$main_content .= '<table width=100%><tr>';
             //equipment shower by ballack13
			$id = $player->getCustomField("id");
			$number_of_items = 1;
			$main_content .= '<td align=center><table with=100% style="border: solid 1px #888888;" CELLSPACING="1"><TR>';		
                        $list = array('2','1','3','6','4','5','9','7','10','8');
                        foreach ($list as $pid => $name) {
                        $top = $SQL->query('SELECT * FROM player_items WHERE player_id = '.$id.' AND pid = '.$list[$pid].';')->fetch();
                           if($top[itemtype] == false) {
                           if($list[$pid] == '8') {
			$main_content .= '<td style="background-color: '.$config['site']['darkborder'].'; text-align: center;">Soul:<br/>'.$player->getSoul().'</td>';
			}
				if(is_int($number_of_items / 3)){
			$main_content .= '<TD style="background-color: '.$config['site']['darkborder'].'; text-align: center;"><img src="images/items/'.$list[$pid].'.gif"/></TD></tr><tr>';
				} else {
			$main_content .= '<TD style="background-color: '.$config['site']['darkborder'].'; text-align: center;"><img src="images/items/'.$list[$pid].'.gif"/></TD>';
			}
				$number_of_items++;
			}
			else
			{
                           if($list[$pid] == '8') {
			$main_content .= '<td style="background-color: '.$config['site']['darkborder'].'; text-align: center;">Soul:<br/>'.$player->getSoul().'</td>';
			}
				if(is_int($number_of_items / 3))
			$main_content .= '<TD style="background-color: '.$config['site']['darkborder'].'; text-align: center;"><img src="images/items/'.$top[itemtype].'.gif" width="45"/></TD></tr><tr>';
				else
			$main_content .= '<TD style="background-color: '.$config['site']['darkborder'].'; text-align: center;"><img src="images/items/'.$top[itemtype].'.gif" width="45"/></TD>';
				$number_of_items++;
			}
                           if($list[$pid] == '8') {
			$main_content .= '<td style="background-color: '.$config['site']['darkborder'].'; text-align: center;">Cap:<br/>'.$player->getCap().'</td>';
			}
			}
			$main_content .= '</tr></TABLE></td>';

            //Hp/Mana/Exp Status by ballack13
			$hp = ($player->getHealth() / $player->getHealthMax() * 100);
			$main_content .= '<td align=center ><table width=100%><tr><td align=center><table CELLSPACING="1" CELLPADDING="4"><tr><td BGCOLOR="#D4C0A1" align="left" width="20%"><b>Player Health:</b></td>
					<td BGCOLOR="#D4C0A1" align="left">'.$player->getHealth().'/'.$player->getHealthMax().'<div style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: red; width: '.$hp.'%; height: 3px;"></td></tr>';
			if ($player->getManaMax() > 0) {
				$mana = ($player->getMana() / $player->getManaMax() * 100);
				$main_content .= '<tr><td BGCOLOR="#F1E0C6" align="left"><b>Player Mana:</b></td><td BGCOLOR="#F1E0C6" align="left">'.$player->getMana().'/'.$player->getManaMax().'<div style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: blue; width: '.$mana.'%; height: 3px;"></td>'; 
			} else {
			$main_content .= '<tr><td BGCOLOR="#F1E0C6" align="left"><b>Player Mana:</b></td><td BGCOLOR="#F1E0C6" align="left">0/0<div style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: blue; width: 100%; height: 3px;"></td>'; }
			$main_content .= '</tr></table><tr>';
			$next = ($player->getLevel() + 1);
			$exp = ((50 / 3) * ($player->getLevel() * $player->getLevel() * $player->getLevel()) - (100 * ($player->getLevel() * $player->getLevel())) + ((850/3) * $player->getLevel()) - 200);
			$expnext = ((50 / 3) * ($next * $next * $next) - (100 * ($next * $next)) + ((850/3) * $next) - 200 - $player->getExperience());
			$expresult = ($expnext / (($expnext  + $player->getExperience()) - $exp) * 100);
			$main_content .= '<tr><table CELLSPACING="1" CELLPADDING="4"><tr><td BGCOLOR="'.$config['site']['lightborder'].'" align="left" width="20%"><b>Player Level:</b></td><td BGCOLOR="'.$config['site']['lightborder'].'" align="left">'.$player->getLevel().'</td></tr>
					<tr><td BGCOLOR="'.$config['site']['darkborder'].'" align="left"><b>Player Experience:</b></td><td BGCOLOR="'.$config['site']['darkborder'].'" align="left">'.$player->getExperience().' EXP.</td></tr>
					<tr><td BGCOLOR="'.$config['site']['lightborder'].'" align="left"><b>To Next Level:</b></td><td BGCOLOR="'.$config['site']['lightborder'].'" align="left">You need <b>'.$exp.' EXP</b> to Level <b>'.$next.'</b>.<div title="99.320604545 %" style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: red; width: '.$expresult.'%; height: 3px;"></td></tr></table></td></tr></table></tr></TABLE></td>';
			if($config['site']['show_skills_info']) {
			//Skills Pics v2. Table borders optimized by Absolute Mango
			$main_content .= '<br/><table cellspacing="0" cellpadding="0" border="0" width="200" align="center"><caption><strong>Skills</strong></caption><tbody><tr>
            <td align="center"><a href="?subtopic=highscores&list=experience"><img src="images/skills/level.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=magic"><img src="images/skills/ml.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=fist"><img src="images/skills/fist.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=club"><img src="images/skills/club.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=sword"><img src="images/skills/sword.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=axe"><img src="images/skills/axe.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=distance"><img src="images/skills/dist.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=shield"><img src="images/skills/def.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=fishing"><img src="images/skills/fish.png" style="border: none;"/></a></td>
			</tr></tbody></table>
			<table cellspacing="0" cellpadding="0" border="1" width="360" align="center"><tbody><tr><tr bgcolor="'.$config['site']['darkborder'].'">
            <td align="center" width="38"><strong>Level</strong></td>
            <td align="center" width="38"><strong>ML</strong></td>
            <td align="center" width="42"><strong>Fist</strong></td>
            <td align="center" width="40"><strong>Club</strong></td>
            <td align="center" width="38"><strong>Swrd</strong></td>
            <td align="center" width="38"><strong>Axe</strong></td>
            <td align="center" width="38"><strong>Dist</strong></td>
            <td align="center" width="38"><strong>Shield</strong></td>
            <td align="center" width="38"><strong>Fish</strong></td></font>
        </tr>
        <tr bgcolor="'.$config['site']['lightborder'].'">
            <td align="center" width="38">'.$player->getLevel().'</td>
            <td align="center" width="38">'.$player->getMagLevel().'</td>
            <td align="center" width="38">'.$player->getSkill(0).'</td>
            <td align="center" width="38">'.$player->getSkill(1).'</td>
            <td align="center" width="38">'.$player->getSkill(2).'</td>
            <td align="center" width="38">'.$player->getSkill(3).'</td>
            <td align="center" width="38">'.$player->getSkill(4).'</td>
            <td align="center" width="38">'.$player->getSkill(5).'</td>
            <td align="center" width="38">'.$player->getSkill(6).'</td>
        </tr></tbody></table><div table align="center">&nbsp;<br />&nbsp;</div>';
			//skill script end
			}
			//quest status by ballack13
			$id = $player->getCustomField("id");
			$number_of_quests = 0;
			$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD align="left" COLSPAN=2 CLASS=white><B>Quests</B></TD></TD align="right"></TD></TR>';		
                        $quests = $config['site']['quests'];
                        foreach ($quests as $storage => $name) {
				if(is_int($number_of_quests / 2))
					$bgcolor = $config['site']['darkborder'];
				else
					$bgcolor = $config['site']['lightborder'];
				$number_of_quests++;
			$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD WIDTH=95%>'.$storage.'</TD>';
                        $quest = $SQL->query('SELECT * FROM player_storage WHERE player_id = '.$id.' AND `key` = '.$quests[$storage].';')->fetch();
                           if($quest == false) {
			$main_content .= '<TD><img src="images/false.png"/></TD></TR>';
                        }
			else
			{
			$main_content .= '<TD><img src="images/true.png"/></TD></TR>';
			}
			}

			$main_content .= '</TABLE></td></tr></table><br />';
			$deads = 0;

			//deaths list
			$player_deaths = $SQL->query('SELECT `id`, `date`, `level` FROM `player_deaths` WHERE `player_id` = '.$player->getId().' ORDER BY `date` DESC LIMIT 0,10;');
			foreach($player_deaths as $death)
			{
				if(is_int($number_of_rows / 2))
					$bgcolor = $config['site']['darkborder']; else $bgcolor = $config['site']['lightborder'];

				$number_of_rows++; $deads++;
				$dead_add_content .= "<tr bgcolor=\"".$bgcolor."\">
				<td width=\"20%\" align=\"center\">".date("j M Y, H:i", $death['date'])."</td>
				<td>";
				$killers = $SQL->query("SELECT environment_killers.name AS monster_name, players.name AS player_name, players.deleted AS player_exists FROM killers LEFT JOIN environment_killers ON killers.id = environment_killers.kill_id
LEFT JOIN player_killers ON killers.id = player_killers.kill_id LEFT JOIN players ON players.id = player_killers.player_id
WHERE killers.death_id = ".$SQL->quote($death['id'])." ORDER BY killers.final_hit DESC, killers.id ASC")->fetchAll();

				$i = 0;
				$count = count($killers);
				foreach($killers as $killer)
				{
					$i++;
					if(in_array($i, array(1, $count)))
						$killer['monster_name'] = str_replace(array("an ", "a "), array("", ""), $killer['monster_name']);

					if($killer['player_name'] != "")
					{
						if($i == 1)
							$dead_add_content .= "Killed at level <b>".$death['level']."</b> by ";
						else if($i == $count)
							$dead_add_content .= " and by ";
						else
							$dead_add_content .= ", ";

						if($killer['monster_name'] != "")
							$dead_add_content .= $killer['monster_name']." summoned by ";

						if($killer['player_exists'] == 0)
							$dead_add_content .= "<a href=\"index.php?subtopic=characters&name=".urlencode($killer['player_name'])."\">";

						$dead_add_content .= $killer['player_name'];
						if($killer['player_exists'] == 0)
							$dead_add_content .= "</a>";
					}
					else
					{
						if($i == 1)
							$dead_add_content .= "Died at level <b>".$death['level']."</b> by ";
						else if($i == $count)
							$dead_add_content .= " and by ";
						else
							$dead_add_content .= ", ";

						$dead_add_content .= $killer['monster_name'];
					}

					if($i == $count)
						$dead_add_content .= ".";
				}

				$dead_add_content .= ".</td></tr>";
			}

			if($deads > 0)
				$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Deaths</B></TD></TR>' . $dead_add_content . '</TABLE><br />';

			//end
			if(!$player->getHideChar()) {
				$main_content .= '<TABLE BORDER=0><TR><TD></TD></TR></TABLE><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Account Information</B></TD></TR>';
				if($account->getRLName())
				{
					if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
					$main_content .= '<TR BGCOLOR='.$config['site']['lightborder'].'><TD WIDTH=20%>Real name:</TD><TD>'.$account->getRLName().'</TD></TR>';
				}
				if($account->getLocation())
				{
					if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
					$main_content .= '<TR BGCOLOR='.$config['site']['darkborder'].'><TD WIDTH=20%>Location:</TD><TD>'.$account->getLocation().'</TD></TR>';
				}
				if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				if($account->getLastLogin())
					$main_content .= '<TR BGCOLOR='.$config['site']['lightborder'].'><TD WIDTH=20%>Last login:</TD><TD>'.date("j F Y, g:i a", $account->getLastLogin()).'</TD></TR>';
				else
					$main_content .= '<TR BGCOLOR='.$config['site']['lightborder'].'><TD WIDTH=20%>Last login:</TD><TD>Never logged in.</TD></TR>';
				if($account->getCreated())
				{
					if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
					$main_content .= '<TR BGCOLOR='.$config['site']['lightborder'].'><TD WIDTH=20%>Created:</TD><TD>'.date("j F Y, g:i a", $account->getCreated()).'</TD></TR>';
				}
				if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
				$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Account&#160;Status:</TD><TD>';
				$main_content .= ($account->isPremium()) ? '<b><font color="green">Premium Account</font></b>' : '<b><font color="red">Free Account</font></b>';
				if($account->isBanned())
					if($account->getBanTime() > 0)
						$main_content .= '<font color="red"> [Banished until '.date("j F Y, G:i", $account->getBanTime()).']</font>';
					else
						$main_content .= '<font color="red"> [Banished FOREVER]</font>';
				$main_content .= '</TD></TR></TABLE>';
				$main_content .= '<br><TABLE BORDER=0><TR><TD></TD></TR></TABLE><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=5 CLASS=white><B>Characters</B></TD></TR>
				<TR BGCOLOR='.$config['site']['darkborder'].'><TD><B>Name</B></TD><TD><B>World</B></TD><TD><B>Level</B></TD><TD><b>Status</b></TD><TD><B>&#160;</B></TD></TR>';
				$account_players = $account->getPlayersList();
				$account_players->orderBy('name');
				$player_number = 0;
				foreach($account_players as $player_list)
				{
					if(!$player_list->getHideChar())
					{
						$player_number++;
						if(is_int($player_number / 2))
							$bgcolor = $config['site']['darkborder'];
						else
							$bgcolor = $config['site']['lightborder'];
						if(!$player_list->isOnline())
							$player_list_status = '<font color="red">Offline</font>';
						else
							$player_list_status = '<font color="green">Online</font>';
						$main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD WIDTH=52%><NOBR>'.$player_number.'.&#160;'.$player_list->getName();
						$main_content .= ($player_list->isDeleted()) ? '<font color="red"> [DELETED]</font>' : '';
						$main_content .= '</NOBR></TD><TD WIDTH=15%>'.$config['site']['worlds'][$player_list->getWorld()].'</TD><TD WIDTH=25%>'.$player_list->getLevel().' '.$vocation_name[$player_list->getWorld()][$player_list->getPromotion()][$player_list->getVocation()].'</TD><TD WIDTH="8%"><b>'.$player_list_status.'</b></TD><TD><TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0><FORM ACTION="?subtopic=characters" METHOD=post><TR><TD><INPUT TYPE=hidden NAME=name VALUE="'.$player_list->getName().'"><INPUT TYPE=image NAME="View '.$player_list->getName().'" ALT="View '.$player_list->getName().'" SRC="'.$layout_name.'/images/buttons/sbutton_view.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></FORM></TABLE></TD></TR>';
					}
				}
				$main_content .= '</TABLE></TD><TD><IMG SRC="'.$layout_name.'/images/general/blank.gif" WIDTH=10 HEIGHT=1 BORDER=0></TD></TR></TABLE>';
			}
			$main_content .= '<BR><BR><FORM ACTION="?subtopic=characters" METHOD=post><TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Search Character</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><TR><TD>Name:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></TABLE></TD></TR></TABLE></FORM>';
			$main_content .= '</TABLE>';
		}
		else
			$search_errors[] = 'Character <b>'.$name.'</b> does not exist.';
	}
	else
		$search_errors[] = 'This name contains invalid letters. Please use only A-Z, a-z and space.';
	if(!empty($search_errors))
	{
		$main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
		foreach($search_errors as $search_error)
			$main_content .= '<li>'.$search_error;
		$main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
		$main_content .= '<BR><FORM ACTION="?subtopic=characters" METHOD=post><TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Search Character</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><TR><TD>Name:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></TABLE></TD></TR></TABLE></FORM>';
	}
}
?>

