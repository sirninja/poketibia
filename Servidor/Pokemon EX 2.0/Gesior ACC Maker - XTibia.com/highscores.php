<?PHP
$list = $_REQUEST['list'];
$page = $_REQUEST['page'];
switch($list)
{
  case "fist":
   $id = 0;
   $list_name = 'Fist Fighting';
   break;
  case "club":
   $id = 1;
   $list_name = 'Club Fighting';
   break;
  case "sword":
   $id = 2;
   $list_name = 'Sword Fighting';
   break;
  case "axe":
   $id = 3;
   $list_name = 'Axe Fighting';
   break;
  case "distance":
   $id = 4;
   $list_name = 'Distance Fighting';
   break;
  case "shield":
   $id = 5;
   $list_name = 'Shielding';
   break;
  case "fishing":
   $id = 6;
   $list_name = 'Fishing';
   break;
}
if(!isset($id))
	if($list == "magic")
		$list_name = "Magic Level";
	else
	{
		$list_name = 'Experience';
		$list = 'experience';
	}
if(count($config['site']['worlds']) > 1)
{
	$worlds .= '<i>Select world:</i> ';
	foreach($config['site']['worlds'] as $idd => $world_n)
	{
		if($idd == (int) $_GET['world'])
		{
			$world_id = $idd;
			$world_name = $world_n;
		}
	}
}
		if($idd == (int) $_GET['world'])
		{
			$world_id = $idd;
			$world_name = $world_n;
		}
if(!isset($world_id))
{
	$world_id = 0;
	$world_name = $config['server']['serverName'];
}
$offset = $page * 100;
if(isset($id))
	$skills = $SQL->query('SELECT name,online,value,level,vocation,promotion FROM players,player_skills WHERE players.world_id = '.$world_id.' AND players.deleted = 0 AND players.group_id < '.$config['site']['players_group_id_block'].' AND players.id = player_skills.player_id AND player_skills.skillid = '.$id.' ORDER BY value DESC, count DESC LIMIT 101 OFFSET '.$offset);
elseif($list == "magic")
	$skills = $SQL->query('SELECT name,online,maglevel,level,vocation,promotion FROM players WHERE players.world_id = '.$world_id.' AND players.deleted = 0 AND players.group_id < '.$config['site']['players_group_id_block'].' AND name != "Account Manager" ORDER BY maglevel DESC, manaspent DESC LIMIT 101 OFFSET '.$offset);
elseif($list == "experience")
	$skills = $SQL->query('SELECT name,online,level,experience,vocation,promotion FROM players WHERE players.world_id = '.$world_id.' AND players.deleted = 0 AND players.group_id < '.$config['site']['players_group_id_block'].' AND name != "Account Manager" ORDER BY level DESC, experience DESC LIMIT 101 OFFSET '.$offset);
//wyswietlanie wszystkiego
$main_content .= '<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100%><TR><TD><IMG SRC="'.$layout_name.'/images/general/blank.gif" WIDTH=10 HEIGHT=1 BORDER=0></TD><TD><CENTER><H2>Ranking for '.$list_name.' on '.$world_name.'</H2></CENTER><BR>';
	$main_content .= '<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100%><TR><TD></TD><TD>
<FORM ACTION="?subtopic=highscores" METHOD=get><INPUT TYPE=hidden NAME=subtopic VALUE=highscores><INPUT TYPE=hidden NAME=list VALUE=experience>
<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>World Selection</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['lightborder'].'">
    <TABLE BORDER=0 CELLPADDING=1><TR><TD>World: </TD><TD><SELECT SIZE="1" NAME="world"><OPTION VALUE="" SELECTED>(choose world)</OPTION>';
	foreach($config['site']['worlds'] as $id => $world_n)
{
	$main_content .= '<OPTION VALUE="'.$id.'">'.$world_n.'</OPTION>';
}
	$main_content .= '</SELECT> </TD><TD><INPUT TYPE=image NAME="Submit" ALT="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18>
        </TD></TR></TABLE></TABLE></FORM></TABLE><br><br><TABLE BORDER=0 CELLPADDING=4 CELLSPACING=1 WIDTH=100%></TABLE><TABLE BORDER=0 CELLPADDING=4 CELLSPACING=1 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD WIDTH=10% CLASS=whites><B>Country</B></TD><TD WIDTH=10% CLASS=whites><B>Rank</B></TD><TD WIDTH=75% CLASS=whites><B>Name</B></TD><TD WIDTH=15% CLASS=whites><b><center>Level</center></B></TD>';
if($list == "experience")
	$main_content .= '<TD CLASS=whites><b><center>Points</center></B></TD>';
$main_content .= '</TR><TR>';
foreach($skills as $skill)
{
$player = $ots->createObject('Player');
$player->find($skill['name']);
$account = $player->getAccount();
$account_db = new OTS_Account();
$flagg = $account->getCustomField("flag");
	if($number_of_rows < 100)
	{
		if($list == "magic")
			$skill['value'] = $skill['maglevel'];
		if($list == "experience")
			$skill['value'] = $skill['level'];
		if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
		$main_content .= '<tr bgcolor="'.$bgcolor.'"><td><image src="images/flags/'.$flagg.'.png"/></td><td>'.($offset + $number_of_rows).'.</td><td><a href="?subtopic=characters&name='.urlencode($skill['name']).'">'.($skill['online']>0 ? "<font color=\"green\">".$skill['name']."</font>" : "<font color=\"red\">".$skill['name']."</font>").'</a><br><small>'.$skill['level'].' '.$vocation_name[$world_id][$skill['promotion']][$skill['vocation']].'</small></td><td><center>'.$skill['value'].'</center></td>';
		if($list == "experience")
			$main_content .= '<td><center>'.$skill['experience'].'</center></td>';
		$main_content .= '</tr>';
	}
	else
		$show_link_to_next_page = TRUE;
}
$main_content .= '</TABLE><TABLE BORDER=0 CELLPADDING=4 CELLSPACING=1 WIDTH=100%>';
if($page > 0)
	$main_content .= '<TR><TD WIDTH=100% ALIGN=right VALIGN=bottom><A HREF="?subtopic=highscores&list='.$list.'&page='.($page - 1).'" CLASS="size_xxs">Previous Page</A></TD></TR>';
if($show_link_to_next_page)
	$main_content .= '<TR><TD WIDTH=100% ALIGN=right VALIGN=bottom><A HREF="?subtopic=highscores&list='.$list.'&page='.($page + 1).'" CLASS="size_xxs">Next Page</A></TD></TR>';
  $main_content .= '</TABLE></TD><TD WIDTH=5%><IMG SRC="'.$layout_name.'/images/general/blank.gif" WIDTH=1 HEIGHT=1 BORDER=0></TD><TD WIDTH=15% VALIGN=top ALIGN=right><TABLE BORDER=0 CELLPADDING=4 CELLSPACING=1><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=whites><B>Choose<br/>a skill</B></TD></TR><TR BGCOLOR="'.$config['site']['lightborder'].'"><TD><A HREF="?subtopic=highscores&list=experience&world='.$world_id.'" CLASS="size_xs"><img src="images/skills/level.png" style="border: none;"></A><BR><A HREF="?subtopic=highscores&list=magic&world='.$world_id.'" CLASS="size_xs"><img src="images/skills/ml.png" style="border: none;"/></A><BR><A HREF="?subtopic=highscores&list=shield&world='.$world_id.'" CLASS="size_xs"><img src="images/skills/def.png" style="border: none;"/></A><BR><A HREF="?subtopic=highscores&list=distance&world='.$world_id.'" CLASS="size_xs"><img src="images/skills/dist.png" style="border: none;"/></A><BR><A HREF="?subtopic=highscores&list=club&world='.$world_id.'" CLASS="size_xs"><img src="images/skills/club.png" style="border: none;"/></A><BR><A HREF="?subtopic=highscores&list=sword&world='.$world_id.'" CLASS="size_xs"><img src="images/skills/sword.png" style="border: none;"/></A><BR><A HREF="?subtopic=highscores&list=axe&world='.$world_id.'" CLASS="size_xs"><img src="images/skills/axe.png" style="border: none;"/></A><BR><A HREF="?subtopic=highscores&list=fist&world='.$world_id.'" CLASS="size_xs"><img src="images/skills/fist.png" style="border: none;"/></A><BR><A HREF="?subtopic=highscores&list=fishing&world='.$world_id.'" CLASS="size_xs"><img src="images/skills/fish.png" style="border: none;"/></A><BR></TABLE></TD><TD><IMG SRC="'.$layout_name.'/images/general/blank.gif" WIDTH=10 HEIGHT=1 BORDER=0></TD></TR></TABLE>';

?>
