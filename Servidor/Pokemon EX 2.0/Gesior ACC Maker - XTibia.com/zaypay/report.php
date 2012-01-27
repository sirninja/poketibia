<?php
/*-----------------------------------------------------------------------
  Name         : report.php
  Version      : 1.2-PHP5
  Description  : Retrieve payment information, when triggerd by Zaypay
  Date         : June 2009, Amsterdam, The Netherlands
  By           : Zaypay International B.V. 2008 - 2009 (RDF)
  Last changes : Made class easier to use and understand
  -----------------------------------------------------------------------*/
  
  require_once('includes/config.php');
  require_once('includes/Zaypay.class.php');
  require_once('includes/database.php');
  $Zaypay = New Zaypay($price_setting_id, $price_setting_key);
  
  if (isset($_GET['payment_id'])) {    
    $zaypay_info    = $Zaypay->show_payment($_GET['payment_id']);  
    
    $payment_id     = $zaypay_info['payment']['id'];
    $payment_status = $zaypay_info['payment']['status'];
    
    // Get the ID
	$result = mysql_query("SELECT * FROM zaypay_payment WHERE payID='{$payment_id}' LIMIT 1");
    $array = mysql_fetch_assoc($result);

	 // Get current amount of points
    $pp = mysql_query("SELECT premium_points FROM accounts WHERE accounts.id = '{$array['account_id']}'");
    $points = mysql_fetch_assoc($pp);
    $point = $points["premium_points"] + $points_to_give;

    // Update to new status in database
    mysql_query("UPDATE zaypay_payment SET status = '{$payment_status}' WHERE payID = '{$payment_id}'");
    
    // Only give points if the status is "paid"
    if ($payment_status == "paid" && $array["status"] != "paid") {
    	// Update points in account table
		mysql_query("UPDATE accounts SET premium_points = '$point' WHERE accounts.id = '{$array['account_id']}'");  
    }
}
  
  die ('*ok*');
  
?>
