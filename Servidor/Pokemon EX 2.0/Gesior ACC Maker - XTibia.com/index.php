<?PHP
session_start();
ob_start("ob_gzhandler");
//require('./exaBD.php');
function microtime_float() {
	list($usec, $sec) = explode(" ", microtime());
	return ((float)$usec + (float)$sec);
}
$time_start = microtime_float();

//##### CONFIG #####
include('config-and-functions.php');
$action = $_REQUEST['action'];

//##### LOGOUT #####
if($action == "logout") {
	unset($_SESSION['account']);
	unset($_SESSION['password']);
}

//##### LOGIN #####
$logged = FALSE;
if(isset($_SESSION['account'])) {
	$account_logged = $ots->createObject('Account');
	$account_logged->load($_SESSION['account']);
	if($account_logged->isLoaded() && $account_logged->getPassword() == $_SESSION['password']) {
		$logged = TRUE;
		$group_id_of_acc_logged = $account_logged->getPageAccess();
	} else {
		$logged = FALSE;
		unset($_SESSION['account']);
		unset($account_logged);
	}
}
$login_account = strtoupper(trim($_POST['account_login']));
$login_password = trim($_POST['password_login']);
if(!$logged && !empty($login_account) && !empty($login_password)) {
	$login_password = password_ency($login_password);
	$account_logged = $ots->createObject('Account');
	$account_logged->find($login_account);
	if($account_logged->isLoaded()) {
		if($login_password == $account_logged->getPassword()) {
			$_SESSION['account'] = $account_logged->getId();
			$_SESSION['password'] = $login_password;
			$logged = TRUE;
			$account_logged->setCustomField("page_lastday", time());
			$group_id_of_acc_logged = $account_logged->getPageAccess();
		} else
			$logged = FALSE;
	}
}

//#### LOAD PAGE ##########
if(empty($_REQUEST['subtopic'])) {
	$_REQUEST['subtopic'] = "latestnews";
	$subtopic = "latestnews";
}
switch($_REQUEST['subtopic']) {

        case "latestnews":
                $topic = "Latest News";
                $subtopic = "latestnews";
                include("latestnews.php");
        break;
       
        case "creatures";
                $topic = "Creatures";
                $subtopic = "creatures";
                include("creatures.php");
        break;
       
        case "spells";
                $topic = "Spells";
                $subtopic = "spells";
                include("spells.php");
        break;
       
 	case "bugtracker";
  	        $topic = "Bug Tracker";
 	        $subtopic = "bugtracker";
 	        include("bug.php");
	break;  

        case "experiencetable";
                $topic = "Experience Table";
                $subtopic = "experiencetable";
                include("experiencetable.php");
        break;
       
        case "signatures";
                $topic = "Signature Generator";
                $subtopic = "signatures";
                include("signatures.php");
        break;
       
        case "characters";
                $topic = "Characters";
                $subtopic = "characters";
                include("characters.php");
        break;
       
        case "whoisonline";
                $topic = "Who is online?";
                $subtopic = "whoisonline";
                include("whoisonline.php");
        break;
       
        case "highscores";
                $topic = "Highscores";
                $subtopic = "highscores";
                include("highscores.php");
        break;
       
        case "killstatistics";
                $topic = "Last Kills";
                $subtopic = "killstatistics";
                include("killstatistics.php");
        break;
       
        case "houses";
                $topic = "Houses";
                $subtopic = "houses";
                include("houses.php");
        break;
       
        case "guilds";
                $topic = "Guilds";
                $subtopic = "guilds";
                include("guilds.php");
        break;
       
        case "accountmanagement";
                $topic = "Account Management";
                $subtopic = "accountmanagement";
                include("accountmanagement.php");
        break;
       
        case "createaccount";
                $topic = "Create Account";
                $subtopic = "createaccount";
                include("createaccount.php");
        break;
       
        case "lostaccount";
                $topic = "Lost Account Interface";
                $subtopic = "lostaccount";
                include("lostaccount.php");
        break;

        case "tibiarules";
                $topic = "Server Rules";
                $subtopic = "tibiarules";
                include("tibiarules.php");
        break;

        case "adminpanel":
                $topic = "Admin Panel";
                $subtopic = "adminpanel";
                include("adminpanel.php");
        break;
       
        case "forum":
                $topic = "Forum";
                $subtopic = "forum";
                include("forum.php");
        break;
       
        case "team";
                $subtopic = "team";
                $topic = "Gamemasters List";
                include("team.php");
        break;

        case "downloads";
                $subtopic = "downloads";
                $topic = "Downloads";
                include("downloads.php");
        break;

        case "serverinfo";
                $subtopic = "serverinfo";
                $topic = "Server Info";
                include("serverinfo.php");
        break;

        case "shopsystem";
                $subtopic = "shopsystem";
                $topic = "Shop System";
                include("shopsystem.php");
        break;
       
        case "buypoints";
                $subtopic = "buypoints";
                $topic = "Buy Points";
                include("buypoints.php");
        break;

        case "gallery";
                $subtopic = "gallery";
                $topic = "Gallery";
                include("gallery.php");
        break;
       
        case "namelock";
                $subtopic = "namelock";
                $topic = "Namelock Manager";
                include("namelocks.php");
        break;
       
        case "archive";
                $subtopic = "archive";
                $topic = "News Archives";
                include("archive.php");
        break;
       
        case "mail";
                $subtopic = "mail";
                $topic = "Mass emails sender";
                include("mail.php");
        break;

	case "shopadmin";
		$subtopic = "shopadmin";
		$topic = "Shop Admin";
		include("shopadmin.php");
	break;

	case "records";
		$subtopic = "records";
		$topic = "Players Online Records";
		include("records.php");
	break;

	case "restarter";
		$subtopic = "restarter";
		$topic = "Restarter";
		include("restarter.php");
	break;
     
	case "bans";
		$subtopic = "bans";
		$topic = "Ban List";
		include("bans.php");
	break;

  	case "polls";
		$topic = "Polls";
		$subtopic = "polls";
		include("polls.php");
	break; 	

	case "changelog";
   		 $topic = "Changelog";
  		 $subtopic = "changelog";
  		 include("changelog.php");
	break; 
}

if(empty($topic)) {
	$title = $GLOBALS['config']['server']["serverName"]." - OTS";
	$main_content .= 'Invalid subtopic. Can\'t load page.';
} else {
	$title = $GLOBALS['config']['server']["serverName"]." - ".$topic;
}

//#####LAYOUT#####
$layout_header = '<script type=\'text/javascript\'>
function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}

function MouseOverBigButton(source)
{
  source.firstChild.style.visibility = "visible";
}
function MouseOutBigButton(source)
{
  source.firstChild.style.visibility = "hidden";
}
function BigButtonAction(path)
{
  window.location = path;
}
var';
if($logged) { $layout_header .= "loginStatus=1; loginStatus='true';"; } else { $layout_header .= "loginStatus=0; loginStatus='false';"; };
$layout_header .= " var activeSubmenuItem='".$subtopic."';</script>";
include($layout_name."/layout.php");
ob_end_flush();
?>