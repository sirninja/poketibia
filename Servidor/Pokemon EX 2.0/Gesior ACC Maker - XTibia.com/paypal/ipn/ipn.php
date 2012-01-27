<?  
$mysql_host = 'localhost'; //Leave at localhost  
$mysql_user = 'root'; //DB User  
$mysql_pass = ''; //DB Pass  
$mysql_db = ''; //DB Name  
$file = 'paypal.log'; //Paypal Log Name will be placed in the same location as your ipn.php file 

$custom = stripslashes(ucwords(strtolower(trim($_REQUEST['custom']))));  
$receiver_email = $_REQUEST['receiver_email'];  
$payment_status = $_REQUEST['payment_status'];  
$mc_gross = $_REQUEST['mc_gross'];  
$payer_email = $_REQUEST['payer_email']; 

$somecode = "'$custom' '$payer_email' '$mc_gross'"; 

// connect db  

$db = mysql_connect($mysql_host, $mysql_user, $mysql_pass);  
mysql_select_db($mysql_db, $db);  
if ($payment_status == "Completed" & $receiver_email == "YOUREMAIL@hotmail.com" & $mc_gross == "##.##") {  

$query = "SELECT premium_points FROM accounts WHERE accounts.name = '$custom'";  

$result = mysql_query($query);  

$prem = mysql_fetch_array($result);  

$points = $prem['premium_points'] + 12;  
// $points = mysql_query($prem)  
$qry2 = "UPDATE accounts SET premium_points = '$points' WHERE accounts.name = '$custom'";  
// Log Paypal Transaction 
$hak = fopen($file, "a"); 
fwrite($hak, $somecode); 
fclose($hak); 

$result2 = mysql_query($qry2);  
}  
else  
 {   
 echo("Error.");  
 }  
?>
