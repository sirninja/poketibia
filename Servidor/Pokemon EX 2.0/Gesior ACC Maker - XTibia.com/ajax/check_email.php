<?PHP
$ok = "/[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,4}/";
echo '<?xml version="1.0" encoding="utf-8" standalone="yes"?>';
$config['site_ini'] = parse_ini_file('../config/config.ini');
include('../config/config.php');
$email = trim($_REQUEST['email']);
if(empty($email))
{
	echo '<font color="red">Please enter an e-mail.</font>';
	exit;
}
if(strlen($email) < 255)
{
	if(preg_match($ok, $email))
	{
		if($config['site']['one_email'])
		{
			//connect to DB
			$server_config = parse_ini_file($config['site_ini']['server_path'].'config.lua');
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
				$ots->connect(POT::DB_SQLITE, array('database' => $config['site_ini']['server_path'].$sqlitefile));
			$email_db = new OTS_Account();
			$email_db->findByEMail($email);
			if($email_db->isLoaded())
				echo '<font color="red">Account with this e-mail already exist.</font>';
			else
				echo '<font color="green">Good e-mail.</font>';
		}
		else
			echo '<font color="green">Good e-mail.</font>';
	}
	else
		echo '<font color="red">Wrong e-mail format.</font>';
}
else
	echo '<font color="red">E-mail is too long (max. 255 chars).</font>';

?>