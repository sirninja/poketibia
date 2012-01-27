<?PHP
$ban_types = array(1 => 'IP Banishment', 2 => 'Namelock', 3 => 'Account Banishment', 4 => 'Notation', 5 => 'Until Deletion');
$ban_reason = array("Offensive Name", "Invalid Name Format", "Unsuitable Name", "Name Inciting Rule Violation", "Offensive Statement", "Spamming", "Illegal Advertising", "Off-Topic Public Statement", "Non-English Public Statement", "Inciting Rule Violation", "Bug Abuse", "Game Weakness Abuse", "Using Unofficial Software to Play", "Hacking", "Multi-Clienting", "Account Trading or Sharing", "Threatening Gamemaster", "Pretending to Have Influence on Rule Enforcer", "False Report to Gamemaster", "Destructive Behaviour", "Excessive Unjustified Player Killing", "Invalid Payment", "Spoiling Auction");
$players_banned = $SQL->query('SELECT `bans`.`type`, `bans`.`value`, `bans`.`comment`,`bans`.`admin_id`, `bans`.`expires`, `bans`.`added`, `bans`.`reason` FROM `bans`, `players` WHERE `players`.`account_id` = `bans`.`value` AND `bans`.`active` = 1 GROUP BY `bans`.`value` ORDER BY `bans`.`added` DESC')->fetchAll();
if(!$players_banned) {
$main_content .= '<h2><center><b>No one is banned at the moment at '.$config['server']['serverName'].'</b></center></h2>';
} else{
    $number_of_players = 0;
    foreach($players_banned as $player) {
        $nick = $SQL->query("SELECT name, id, level, account_id FROM `players` WHERE account_id =".$player['value']." ORDER BY level DESC LIMIT 1")->fetch();
        $gmnick = $SQL->query("SELECT name, id FROM `players` WHERE id =".$player['admin_id']."")->fetch();

        if($player['admin_id'] >= "1")
            $banby = "<a href=?subtopic=characters&name=".urlencode($gmnick['name'])."><font color ='green'>".$gmnick['name']."</font></a>";
        else
            $banby = "FunOT System";

        $number_of_players++;

        if(is_int($number_of_players / 2))
            $bgcolor = $config['site']['darkborder'];
        else
            $bgcolor = $config['site']['lightborder'];

        if ($player['expires'] == "-1") // If the banishment is permanent
            $expires = "Permament";
        else
            $expires = date("d/m/Y, G:i:s", $player['expires']);


        $players_rows .= '<TR BGCOLOR='.$bgcolor.'><TD WIDTH=15%><A HREF="?subtopic=characters&name='.$nick['name'].'">'.$nick['name'].'</A></TD><TD WIDTH=5%>'.$ban_reason[$player['reason']].'</TD><TD WIDTH=15%>'.$player['comment'].'</TD><TD>'.$banby.'</TD><TD>'.$expires.'</TD></TR>';
    }
    //list of players
    $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b><center>Banned Player</center></b></TD><TD class="white"><b><center>Reason</center></b></TD><TD class="white"><b><center>Comment</center></b></TD><TD class="white"><b><center>Banned By</center></b></TD><TD class="white"><b><center>Expires</center></b></TD></TR>'.$players_rows.'</TABLE>';
}
//COPY RIGHTS!! DO NOT DELETE!
 $main_content .= '<br/><p align="right">Scripted by <B>Samme</B> Rewriten by <b><a href="http://otland.net/members/widnet/">widnet</a></b>.</p>';
?>
