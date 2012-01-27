<?php
  require_once('includes/config.php');
  require_once('includes/Zaypay.class.php');
  require_once('includes/database.php');
  
  // Start session engine
  session_start();
  
  // Makesure this is not a guest
  if(!isset($_SESSION['account'])) {
	 die($message_to_guests);
  }

  $Zaypay = New Zaypay($price_setting_id, $price_setting_key);

  // Fourth step: check payment
  if (isset($_POST['action']) && $_POST['action'] == 'paid' && isset($_POST['paymentid'])) {
    $zaypay_info = $Zaypay->show_payment($_POST['paymentid']);
    
    $status = $zaypay_info['payment']['status'];
    
    if (isset($zaypay_info['payment']['verification-needed']) and $zaypay_info['payment']['verification-needed'] == 'true' and isset($_POST['verification_code'])) {    
      if ($zaypay_info = $Zaypay->verification_code($_POST['paymentid'], $_POST['verification_code'])) {      
        $status = $zaypay_info['payment']['status'];
      }
    }    

    if ($status == 'paid') {      
      include ('./pages/3-paid.php');
      
      $Zaypay->mark_payload_provided($_POST['paymentid']);      
    }
    elseif ($status == 'prepared' or $status == 'in_progress' or $status == 'paused') {      
      include ('./pages/2-pay.php');
    }
    else {
      echo "An error has occured [{$status}]";
    }
    
  }

  // Third step: Let consumer pay
  elseif (isset($_POST['action']) && $_POST['action'] == 'pay' && isset($_POST['locale']) && isset($_POST['paymentmethod'])) {
    if(!($zaypay_info = $Zaypay->create_payment($_POST['locale'], $_POST['paymentmethod']))){
      die ($Zaypay->getError());
    }
    
    // Here you could insert the payment information into your database. For Example:
    mysql_query("INSERT INTO VAPUS_payment (payID, account_id, status) VALUES ('{$Zaypay->getPaymentId()}', '{$_SESSION['account']}', 'prepared')");
    
    include ('./pages/2-pay.php');
  }
  
  // First step: Let consumer choose country and language
  else {
    if(!($locales = $Zaypay->list_locales())) {
      die($Zaypay->getError());
    }
    
    if (isset($_POST['locale_country']) and isset($_POST['locale_language'])) {    
      $Zaypay->setLocale($_POST['locale_language'] . '-' . $_POST['locale_country']);
    }
    else {
      $Zaypay->locale_for_ip($_SERVER['REMOTE_ADDR']);
    }
    
    if(!($payment_methods = $Zaypay->list_payment_methods($Zaypay->getLocale()))){
      die($Zaypay->getError());
    }
    
    include('./pages/1-choosemethod.php');
  }
  
?>
