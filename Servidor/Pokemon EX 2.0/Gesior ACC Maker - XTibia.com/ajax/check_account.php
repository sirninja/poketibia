<?PHP
function check_account_name($name)//sprawdza name
{
  $temp = strspn("$name", "QWERTYUIOPASDFGHJKLZXCVBNM0123456789");
  if ($temp != strlen($name))
	return false;
  if(strlen($name) > 32)
	return false;
  else
  {
	$ok = "/[A-Z0-9]/";
	return (preg_match($ok, $name))? true: false;
  }
}

echo '<?xml version="1.0" encoding="utf-8" standalone="yes"?>';
$config_ini = parse_ini_file('../config/config.ini');
$account = strtoupper(trim($_REQUEST['account']));
if(empty($account))
{
	echo '<font color="red">Please enter an account number.</font>';
	exit;
}
	if(strlen($account) > 0 && strlen($account) < 32)
	{
		if(!check_account_name($account))
		{
			echo '<font color="red">Invalid account name format. Use only A-Z and numbers 0-9.</font>';
			exit;
		}
			//connect to DB
			$server_config = parse_ini_file($config_ini['server_path'].'config.lua');
			if(isset($server_config['mysqlHost']))
			{
				//new (0.2.6+) ots config.lua file
				$mysqlhost = $server_config['mysqlHost'];
				$mysqluser = $server_config['mysqlUser'];
				$mysqlpass = $server_config['mysqlPass'];
				$mysqldatabase = $server_config['mysqlDatabase'];
				$sqlitefile = $server_config['sqliteDatabase'];
			}
			elseif(isset($server_config['sqlHost']))
			{
				//old (0.2.4) ots config.lua file
				$mysqlhost = $server_config['sqlHost'];
				$mysqluser = $server_config['sqlUser'];
				$mysqlpass = $server_config['sqlPass'];
				$mysqldatabase = $server_config['sqlDatabase'];
				$sqlitefile = $server_config['sqliteDatabase'];
			}
			// loads #####POT mainfile#####
			include('../pot/OTS.php');
			// PDO and POT connects to database
			$ots = POT::getInstance();
			if($server_config['sqlType'] == "mysql")
				$ots->connect(POT::DB_MYSQL, array('host' => $mysqlhost, 'user' => $mysqluser, 'password' => $mysqlpass, 'database' => $mysqldatabase) );
			elseif($server_config['sqlType'] == "sqlite")
				$ots->connect(POT::DB_SQLITE, array('database' => $config_ini['server_path'].$sqlitefile));
			$account_db = new OTS_Account();
			$account_db->find($account);
			if($account_db->isLoaded())
				echo '<font color="red">Account with this name already exist.</font>';
			else
				echo '<font color="green">Good account name ( '.$account.' ). You can create account.</font>';
		
	}
	else
		echo '<font color="red">Account name is too long (max. 32 chars).</font>';

?>