<?PHP
// ###################### CONFIG ########################
$config['site'] = parse_ini_file('config/config.ini');
include('config/config.php');
if($config['site']['install'] != "no") {
	header("Location: install.php");
	exit;
}

$config['server'] = parse_ini_file($config['site']['server_path'].'config.lua');
if(isset($config['server']['mysqlHost'])) {
	$mysqlhost = $config['server']['mysqlHost'];
	$mysqluser = $config['server']['mysqlUser'];
	$mysqlpass = $config['server']['mysqlPass'];
	$mysqldatabase = $config['server']['mysqlDatabase'];
}
elseif(isset($config['server']['sqlHost'])) {
	$mysqlhost = $config['server']['sqlHost'];
	$mysqluser = $config['server']['sqlUser'];
	$mysqlpass = $config['server']['sqlPass'];
	$mysqldatabase = $config['server']['sqlDatabase'];
}
$sqlitefile = $config['server']['sqliteDatabase'];
$passwordency = '';
if(strtolower($config['server']['useMD5Passwords']) == 'yes' || strtolower($config['server']['passwordType']) == 'md5')
	$passwordency = 'md5';
if(strtolower($config['server']['passwordType']) == 'sha1')
	$passwordency = 'sha1';
// ####################### POT #########################
include('pot/OTS.php');
$ots = POT::getInstance();
if(strtolower($config['server']['sqlType']) == "mysql") {
	try {
		$ots->connect(POT::DB_MYSQL, array('host' => $mysqlhost, 'user' => $mysqluser, 'password' => $mysqlpass, 'database' => $mysqldatabase) );
	}
	catch(PDOException $error) {
	    	echo 'Database error - can\'t connect to MySQL database. Possible reasons:<br>1. MySQL server is not running on host.<br>2. MySQL user, password, database or host isn\'t configured in: <b>'.$config['site']['server_path'].'config.lua</b> .<br>3. MySQL user, password, database or host is wrong.';
		exit;
	}
}
elseif(strtolower($config['server']['sqlType']) == "sqlite") {
	$link_to_sqlitedatabase = $config['site']['server_path'].$sqlitefile;
	try {
		$ots->connect(POT::DB_SQLITE, array('database' => $link_to_sqlitedatabase));
	}
	catch(PDOException $error) {
		echo 'Database error - can\'t open SQLite database. Possible reasons:<br><b>'.$link_to_sqlitedatabase.'</b> - file isn\'t valid SQLite database.<br><b>'.$link_to_sqlitedatabase.'</b> - doesn\'t exist.<br><font color="red">Wrong PHP configuration. Default PHP does not work with SQLite databases!</font>';
		exit;
	}
} else {
	echo 'Database error. Unknown database type in <b>'.$config['site']['server_path'].'config.lua</b> . Must be equal to: "<b>mysql</b>" or "<b>sqlite</b>". Now is: "<b>'.strtolower($config['server']['sqlType']).'"</b>';
	exit;
}

$SQL = POT::getInstance()->getDBHandle();
$layout_name = "layouts/".$layout_name = $config['site']['layout'];;
$layout_ini = parse_ini_file($layout_name.'/layout_config.ini');
foreach($layout_ini as $key => $value)
	$config['site'][$key] = $value;

//###################### FUNCTIONS ######################
function isPremium($premdays, $lastday) {
	return ($premdays - (date("z", time()) + (365 * (date("Y", time()) - date("Y", $lastday))) - date("z", $lastday)) > 0);
}
function saveconfig_ini($config) {
$file = fopen("config/config.ini", "w");
foreach($config as $param => $data) {
$file_data .= $param.' = "'.str_replace('"', '', $data).'"';
}
rewind($file);
fwrite($file, $file_data);
fclose($file);
}
function password_ency($password) {
	$ency = $GLOBALS['passwordency'];
	if($ency == 'sha1')
		return sha1($password);
	elseif($ency == 'md5')
		return md5($password);
	elseif($ency == '')
		return $password;
}
function delete_player($name) {
	$SQL = $GLOBALS['SQL'];
	$player = new OTS_Player();
	$player->find($name);
	if($player->isLoaded()) {
		try { $SQL->query("DELETE FROM player_skills WHERE player_id = '".$player->getId()."';"); } catch(PDOException $error) {}
		try { $SQL->query("DELETE FROM guild_invites WHERE player_id = '".$player->getId()."';"); } catch(PDOException $error) {}
		try { $SQL->query("DELETE FROM player_items WHERE player_id = '".$player->getId()."';"); } catch(PDOException $error) {}
		try { $SQL->query("DELETE FROM player_depotitems WHERE player_id = '".$player->getId()."';"); } catch(PDOException $error) {}
		try { $SQL->query("DELETE FROM player_spells WHERE player_id = '".$player->getId()."';"); } catch(PDOException $error) {}
		try { $SQL->query("DELETE FROM player_storage WHERE player_id = '".$player->getId()."';"); } catch(PDOException $error) {}
		try { $SQL->query("DELETE FROM player_viplist WHERE player_id = '".$player->getId()."';"); } catch(PDOException $error) {}
		try { $SQL->query("DELETE FROM player_deaths WHERE player_id = '".$player->getId()."';"); } catch(PDOException $error) {}
		try { $SQL->query("DELETE FROM player_deaths WHERE killed_by = '".$player->getId()."';"); } catch(PDOException $error) {}
		$rank = $player->getRank();
		if(!empty($rank)) {
			$guild = $rank->getGuild();
			if($guild->getOwner()->getId() == $player->getId()) {
				$rank_list = $guild->getGuildRanksList();
				if(count($rank_list) > 0) {
					$rank_list->orderBy('level');
					foreach($rank_list as $rank_in_guild) {
						$players_with_rank = $rank_in_guild->getPlayersList();
						$players_with_rank->orderBy('name');
						$players_with_rank_number = count($players_with_rank);
						if($players_with_rank_number > 0) {
							foreach($players_with_rank as $player_in_guild) {
								$player_in_guild->setRank();
								$player_in_guild->save();
							}
						}
						$rank_in_guild->delete();
					}
					$guild->delete();
				}
			}
		}
		$player->delete();
		return TRUE;
	}
}

function delete_guild($id) {
	$guild = new OTS_Guild();
	$guild->load($id);
	if($guild->isLoaded()) {
		$rank_list = $guild->getGuildRanksList();
		if(count($rank_list) > 0) {
			$rank_list->orderBy('level');
			foreach($rank_list as $rank_in_guild) {
				$players_with_rank = $rank_in_guild->getPlayersList();
				if(count($players_with_rank) > 0) {
					foreach($players_with_rank as $player_in_guild) {
						$player_in_guild->setRank();
						$player_in_guild->save();
					}
				}
				$rank_in_guild->delete();
			}
		}
		$guild->delete();
		return TRUE;
	}
	else
	return FALSE;
}

function check_name($name) {
	$temp = strspn("$name", "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM- [ ] '");
	if ($temp != strlen($name)) {
		return false;
	} else {
		$ok = "/[a-zA-Z ']{1,25}/";
		return (preg_match($ok, $name))? true: false;
	}
}

function check_account_name($name) {
	$temp = strspn("$name", "QWERTYUIOPASDFGHJKLZXCVBNM0123456789");
	if ($temp != strlen($name))
		return false;
	if(strlen($name) > 32)
		return false;
	else {
		$ok = "/[A-Z0-9]/";
		return (preg_match($ok, $name))? true: false;
	}
}

function check_name_new_char($name) {
	$name_to_check = strtolower($name);
	$names_blocked = array('gm','cm', 'god', 'tutor');
	$first_words_blocked = array('gm ','cm ', 'god ','tutor ', "'", '-');
	$words_blocked = array('gamemaster', 'game master', 'game-master', "game'master", '--', "''","' ", " '", '- ', ' -', "-'", "'-", 'fuck', 'sux', 'suck', 'noob', 'tutor');
	foreach($first_words_blocked as $word)
		if($word == substr($name_to_check, 0, strlen($word)))
			return false;
	if(substr($name_to_check, -1) == "'" || substr($name_to_check, -1) == "-")
		return false;
	if(substr($name_to_check, 1, 1) == ' ')
		return false;
	if(substr($name_to_check, -2, 1) == " ")
		return false;
	foreach($names_blocked as $word)
		if($word == $name_to_check)
			return false;
	foreach($GLOBALS['config']['site']['monsters'] as $word)
		if($word == $name_to_check)
			return false;
	foreach($GLOBALS['config']['site']['npc'] as $word)
		if($word == $name_to_check)
			return false;
	for($i = 0; $i < strlen($name_to_check); $i++)
		if($name_to_check[$i-1] == ' ' && $name_to_check[$i+1] == ' ')
			return false;
	foreach($words_blocked as $word)
		if (!(strpos($name_to_check, $word) === false))
			return false;
	for($i = 0; $i < strlen($name_to_check); $i++)
		if($name_to_check[$i] == $name_to_check[($i+1)] && $name_to_check[$i] == $name_to_check[($i+2)])
			return false;
	for($i = 0; $i < strlen($name_to_check); $i++)
		if($name_to_check[$i-1] == ' ' && $name_to_check[$i+1] == ' ')
			return false;
	$temp = strspn("$name", "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM- '");
	if ($temp != strlen($name))
		return false;
	else {
		$ok = "/[a-zA-Z ']{1,25}/";
		return (preg_match($ok, $name))? true: false;
	}
}

function check_rank_name($name) {
	$temp = strspn("$name", "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM0123456789-[ ] ");
	if ($temp != strlen($name)) {
		return false;
	} else {
		$ok = "/[a-zA-Z ]{1,60}/";
		return (preg_match($ok, $name))? true: false;
	}
}

function check_guild_name($name) {
	$temp = strspn("$name", "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM0123456789- ");
	if ($temp != strlen($name)) {
		return false;
	} else {
		$ok = "/[a-zA-Z ]{1,60}/";
		return (preg_match($ok, $name))? true: false;
	}
}

function check_password($pass) {
	$temp = strspn("$pass", "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890");
	if ($temp != strlen($pass)) {
		return false;
	} else {
		$ok = "/[a-zA-Z0-9]{1,40}/";
		return (preg_match($ok, $pass))? true: false;
	}
}

function check_mail($email) {
	$ok = "/[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,4}/";
	return (preg_match($ok, $email))? true: false;
}

function items_on_player($characterid, $pid)
{
        global $SQL;
        $item = $SQL->query("SELECT `itemtype` FROM `player_items` WHERE `pid` = '".$pid."' AND `player_id` = '".$characterid."'")->fetch();
        return '<img src="images/items/' . $item['itemtype'] . '.gif" />';
}

function showCommentsCount( $date )
{
        global $SQL;
        $result = $SQL->query("SELECT COUNT(*) as `count` FROM `z_news_comments` WHERE `news_date` = " . (int)$date . ";")->fetch();
        return (int)$result['count'];
}

function getReason($reasonId)
{
        switch($reasonId)
        {
                case 0:
                        return "Offensive Name";
                case 1:
                        return "Invalid Name Format";
                case 2:
                        return "Unsuitable Name";
                case 3:
                        return "Name Inciting Rule Violation";
                case 4:
                        return "Offensive Statement";
                case 5:
                        return "Spamming";
                case 6:
                        return "Illegal Advertising";
                case 7:
                        return "Off-Topic Public Statement";
                case 8:
                        return "Non-English Public Statement";
                case 9:
                        return "Inciting Rule Violation";
                case 10:
                        return "Bug Abuse";
                case 11:
                        return "Game Weakness Abuse";
                case 12:
                        return "Using Unofficial Software to Play";
                case 13:
                        return "Hacking";
                case 14:
                        return "Multi-Clienting";
                case 15:
                        return "Account Trading or Sharing";
                case 16:
                        return "Threatening Gamemaster";
                case 17:
                        return "Pretending to Have Influence on Rule Enforcement";
                case 18:
                        return "False Report to Gamemaster";
                case 19:
                        return "Destructive Behaviour";
                case 20:
                        return "Excessive Unjustified Player Killing";
                case 21:
                        return "Invalid Payment";
                case 22:
                        return "Spoiling Auction";
                default:
                        break;
        }
        return "Unknown Reason";
}

//################### DISPLAY FUNCTIONS #####################
function short_text($text, $chars_limit) {
	if (strlen($text) > $chars_limit) 
		return substr($text, 0, strrpos(substr($text, 0, $chars_limit), " ")).'...';
	else return $text;
}
function logo_monster() {
	return str_replace(" ", "", trim(mb_strtolower($GLOBALS['layout_ini']['logo_monster'])));
}


$statustimeout = 1;
foreach(explode("*", str_replace(" ", "", $config['server']['statusTimeout'])) as $status_var)
	if($status_var > 0)
		$statustimeout = $statustimeout * $status_var;
$statustimeout = $statustimeout / 1000;
$config['status'] = parse_ini_file('config/serverstatus');
if($config['status']['serverStatus_lastCheck']+$statustimeout < time())
{
	$config['status']['serverStatus_checkInterval'] = $statustimeout+3;
	$config['status']['serverStatus_lastCheck'] = time();
	$info = chr(6).chr(0).chr(255).chr(255).'info';
	$sock = @fsockopen("127.0.0.1", $config['server']['statusPort'], $errno, $errstr, 1);
	if ($sock)
	{
		fwrite($sock, $info); 
		$data=''; 
		while (!feof($sock))
			$data .= fgets($sock, 1024);
		fclose($sock);
		preg_match('/players online="(\d+)" max="(\d+)"/', $data, $matches);
		$config['status']['serverStatus_online'] = 1;
		$config['status']['serverStatus_players'] = $matches[1];
		$config['status']['serverStatus_playersMax'] = $matches[2];
		preg_match('/uptime="(\d+)"/', $data, $matches);
		$h = floor($matches[1] / 3600);
		$m = floor(($matches[1] - $h*3600) / 60);
		$config['status']['serverStatus_uptime'] = $h.'h '.$m.'m';
		preg_match('/monsters total="(\d+)"/', $data, $matches);
		$config['status']['serverStatus_monsters'] = $matches[1];
	}
	else
	{
		$config['status']['serverStatus_online'] = 0;
		$config['status']['serverStatus_players'] = 0;
		$config['status']['serverStatus_playersMax'] = 0;
	}
	$file = fopen("config/serverstatus", "w");
	foreach($config['status'] as $param => $data)
	{
$file_data .= $param.' = "'.str_replace('"', '', $data).'"
';
	}
	rewind($file);
	fwrite($file, $file_data);
	fclose($file);
}

$views_counter = "usercounter.dat";
if (file_exists($views_counter)) {
	$actie = fopen($views_counter, "r+"); 
	$page_views = fgets($actie, 9); 
	$page_views++; 
	rewind($actie); 
	fputs($actie, $page_views, 9); 
	fclose($actie); 
} else { 
	$actie = fopen($views_counter, "w"); 
	$page_views = 1; 
	fputs($actie, $page_views, 9); 
	fclose($actie); 
}
// Functions by Colandus
function makeOrder($arr, $order, $default) {
	$type = 'asc';
	if(isset($_GET['order'])) {
        	$v = explode('_', strrev($_GET['order']), 2);
        if(count($v) == 2)
		if($orderBy = $arr[strrev($v[1])])
			$default = $orderBy;
	$type = (strrev($v[0]) == 'asc' ? 'desc' : 'asc');
	}
return 'ORDER BY ' . $default . ' ' . $type;
}
function getOrder($arr, $order, $this) {
	$type = 'asc';
	if($orderBy = $arr[$this])
		if(isset($_GET[$order])) {
			$v = explode('_', strrev($_GET[$order]), 2);
			if(strrev($v[1]) == $this)
			$type = (strrev($v[0]) == 'asc' ? 'desc' : 'asc');
		}
	return $this . '_' . $type;
}  

?>