<?PHP
####################       CONFIG      ###################################################
#aktywacja dotpay oraz dostepych systemow platnosci, wartosci: true / false
$config['paypal_active'] = true; #active paypal system?
$config['zaypay_active'] = true; #active zaypay system?
$config['dotpay'] = array();
$config['dotpay_active'] = false; #active dotpay system?
$config['dotpay_active_sms'] = true; #active dotpay system?
$config['dotpay_active_transfer'] = true; #active dotpay system?
# przykladowy konfig dla SMS
$config['dotpay'][0]['id'] = 21468;       # numer ID zarejestrowanego klienta
$config['dotpay'][0]['code'] = "DEB3"; # identyfikator uslug SMS
$config['dotpay'][0]['type'] = "sms";   # typ konta: C1 - 8 znakowy kod bezobslugowy, sms - dla sprawdzania SMSow
$config['dotpay'][0]['addpoints'] = 100; # ile premium punktow daje dany sms
$config['dotpay'][0]['sms_number'] = 73068; # numer na jaki nalezy wyslac kod
$config['dotpay'][0]['sms_text'] = "AP.DEB3"; # tresc jaka ma byc w SMSie
$config['dotpay'][0]['sms_cost'] = "3.66 zl brutto"; # cena za wyslanie sms
# przykladowy konfig dla przelewu bankowego/karty kredytowej
$config['dotpay'][1]['id'] = 21468;       # numer ID zarejestrowanego klienta
$config['dotpay'][1]['code'] = "DEBT"; # identyfikator uslug SMS
$config['dotpay'][1]['type'] = "C1";   # typ konta: C1 - 8 znakowy kod bezobslugowy, sms - dla sprawdzania SMSow
$config['dotpay'][1]['addpoints'] = 400; # ile premium punktow daje dany sms
$config['dotpay'][1]['sms_number'] = ""; # numer na jaki nalezy wyslac kod
$config['dotpay'][1]['sms_text'] = "DEBT"; # tresc jaka ma byc w SMSie
$config['dotpay'][1]['sms_cost'] = "5 zl brutto"; # cena za wyslanie sms
# activation of DaoPay system
$config['daopay'] = array();
$config['daopay_active'] = true; #active daopay system?
# example config for daopay
$config['daopay'][0]['appcode'] = 46870; #
$config['daopay'][0]['prodcode'] = 'DEB2'; #
$config['daopay'][0]['addpoints'] = '100'; #
$config['daopay'][0]['cost'] = "1 euro inc. VAT"; #
$config['daopay'][1]['appcode'] = 46870; #
$config['daopay'][1]['prodcode'] = 'DEB3'; #
$config['daopay'][1]['addpoints'] = '200'; #
$config['daopay'][1]['cost'] = "2 euro inc. VAT"; #
#################################################################################
function save_trans($file, $acc, $code)
{
	$hak = fopen($file, "a");
	fwrite($hak, $code.'='.$acc.'
');
	fclose($hak);
}

function check_code_daopay($appcode, $prodcode, $pin)
{
	$handle = fopen("https://daopay.com/svc/pincheck?appcode=".$appcode."&prodcode=".$prodcode."&pin=".$pin, 'r'); 
	if ($handle)
	{
	    $status = fgets($handle, 128);
		fclose($handle);
		if($status[0] == 'o' && $status[1] == 'k')
			$return = 1;
		else
			$return = 2;
	}
	else
		$return = 3;
	return $return;
}

function check_code_dotpay($code, $posted_code, $user_id, $type)
{
	$handle = fopen("http://dotpay.pl/check_code.php?id=".$user_id."&code=".$code."&check=".$posted_code."&type=".$type."&del=0", 'r');
    $status = fgets($handle, 8);
    $czas_zycia = fgets($handle, 24);
    fclose($handle);
    $czas_zycia = rtrim($czas_zycia);
	return array($status, $czas_zycia);
}

function delete_code_dotpay($code, $posted_code, $user_id, $type)
{
	$handle = fopen("http://dotpay.pl/check_code.php?id=".$user_id."&code=".$code."&check=".$posted_code."&type=".$type."&del=1", 'r');
    fclose($handle);
}

function add_points(OTS_Account $account, $number_of_points)
{
	if($account->isLoaded())
	{
		$account->setCustomField('premium_points', ($account->getCustomField('premium_points')+$number_of_points));
		return true;
	}
	else
		return false;
}
if ($_REQUEST['system'] == 'paypal' && $config['paypal_active']) {
$content = file_get_contents("paypal/paypal.htm");
	$main_content .= $content;
}
elseif ($_REQUEST['system'] == 'zaypay' && $config['zaypay_active']) {
if(!$logged)
	$main_content .= '<center><b>Please login first to donate via ZayPay.</B></center>';
if($logged)
	$main_content .= '<iframe src="'.$REMOTE_ADDR.'/zaypay/pay.php" frameborder="no" width="98%" height="350px;">
	<p>Need IFRAME support, please download Opera,Firefox or Chrome</p></iframe><br>';
}
elseif ($_REQUEST['system'] == 'daopay' && $config['daopay_active'])
{
#################################################################################
$offer_id = (int) $_POST['offer_id'];
$posted_pincode = trim($_POST['pincode']);
$to_user = trim($_POST['to_user']);
$verify_code = trim($_POST['verify_code']);
#################################################################################
if(!empty($to_user))
{
	if(is_numeric($to_user))
	{
		$account = new OTS_Account();
		$account->find($to_user);
	}
	else
	{
		$player = new OTS_Player();
		$player->find($to_user);
		if($player->isLoaded())
			$account = $player->getAccount();
		else
			$account = new OTS_Account();
	}
	
	if(empty($posted_pincode))
		$errors[] = 'Please enter your PIN code.';
		
	if(!$account->isLoaded())
		$errors[] = 'Account/account of player with this name doesn\'t exist.';
	if(count($errors) == 0)
	{
		if($config['site']['verify_code_shop'])
		{
			//check verification code
			$string = strtoupper($_SESSION['string']);
			$userstring = strtoupper($verify_code);
			$_SESSION['string'] = mt_rand(1,99999);
			if(empty($string))
				$errors[] = "Code from verification image in session is empty, try again.";
			else
			{
				if(empty($userstring))
					$errors[] = "Please enter code from verification image.";
				else
				{
					if($string != $userstring)
						$errors[] = "Code from verification image is wrong.";
				}
			}
		}
		
		if(count($errors) == 0)
		{
			$code_info = check_code_daopay($config['daopay'][$offer_id]['appcode'], $config['daopay'][$offer_id]['prodcode'], $posted_pincode);
			if($code_info == 3)
				$errors[] = 'Server has problem with connection to daopay.com, can\'t verify PIN code.';
			elseif($code_info == 2)
				$errors[] = 'Wrong PIN code, try to enter code again.';
			elseif($code_info == 1)
			{
				if(add_points($account, $config['daopay'][$offer_id]['addpoints']))
				{
					save_trans('config/daopay.log', $account->getId(), $posted_pincode);
					$main_content .= '<h2><font color="red">Good PIN code. Added '.$config['daopay'][$offer_id]['addpoints'].' Premium Points to account of: '.$to_user.' !</font></h2>';
				}
				else
					$errors[] = 'Error occured, try again.';
			}
		}
	}
}
if(count($errors) > 0)
{
	$main_content .= '<font color="red"><b>Errors occured:</b></font>';
	foreach($errors as $error)
		$main_content .= '<br />* '.$error;
	$main_content .= '<hr /><hr />';
}
$main_content .= 'Buy Premium Points. For this points you can buy pacc/items in Shop. To buy points:<br />
1. Visit one of our pages and donate us (send SMS/call special number).<br />
2. After donate daopay.com will show you PIN code.<br />
3. Save somewhere this PIN code and open this page again.<br />
4. Enter your character name or account and your PIN code in form below.<br />
5. Select donation cost from list and press "Check Code".<br />
6. If account and PIN code is valid you get premium points.<br />
7. Open "Shop Offer" and buy items/pacc :)<br />
<h2><font color="red"><b>Our pages:</b></h2></font>';
foreach($config['daopay'] as $offer) {
  $order++;
	$main_content .= '<b><h3>'.$order.'. Address: <font color="red"><a href="http://daopay.com/payment/?appcode='.urlencode($offer['appcode']).'&prodcode='.urlencode($offer['prodcode']).'">Buy '.$offer['addpoints'].' Shop points for '.$offer['cost'].'</a></font><br></h3>';
}
$main_content .= '<hr /><form action="?subtopic=buypoints&system=daopay" method="POST"><table>';
$main_content .= '<tr><td><b>Player name or account name: </b></td><td><input type="text" size="20" value="'.$to_user.'" name="to_user" /></td></tr>
<tr><td><b>PIN code: </b></td<td><input type="text" size="20" value="'.$posted_pincode.'" name="pincode" /></td></tr><tr><td><b>Offer type: </b></td><td><select name="offer_id">';
foreach($config['daopay'] as $id => $offer)
	$main_content .= '<option value="'.$id.'">'.$offer['prodcode'].' - cost '.$offer['cost'].' - points '.$offer['addpoints'].'</option>';
$main_content .= '</select></td></tr>';
if($config['site']['verify_code_shop'])
		$main_content .= '<tr><td><B>Verify code: </B></td><td><img src="imgverification/imagebuilder.php?image_refresher='.mt_rand(1,99999).'" border="0" alt=""></td></tr>
						  <tr><td><B>Enter verify code: </B></td><td><INPUT id="verify" NAME="verify_code" VALUE="" SIZE=30></td></tr>';
$main_content .= '<tr><td></td><td><input type="submit" value="Check Code" /></td></tr></table></form>';
}
elseif ($_REQUEST['system'] == 'dotpay' && $config['dotpay_active'])
{
#################################################################################
$sms_type = (int) $_POST['sms_type'];
$posted_code = trim($_POST['code']);
$to_user = trim($_POST['to_user']);
$verify_code = trim($_POST['verify_code']);
#################################################################################
if(!empty($to_user))
{
	if(is_numeric($to_user))
	{
		$account = new OTS_Account();
		$account->find($to_user);
	}
	else
	{
		$player = new OTS_Player();
		$player->find($to_user);
		if($player->isLoaded())
			$account = $player->getAccount();
		else
			$account = new OTS_Account();
	}
	
	if(empty($posted_code))
		$errors[] = 'Prosze wpisac kod z SMSa/przelewu.';
		
	if(!$account->isLoaded())
		$errors[] = 'Konto/konto postaci o podanym nicku nie istnieje.';
		
	if(count($errors) == 0)
	{
		if($config['site']['verify_code_shop'])
		{
			//check verification code
			$string = strtoupper($_SESSION['string']);
			$userstring = strtoupper($verify_code);
			$_SESSION['string'] = mt_rand(1,99999);
			if(empty($string))
				$errors[] = "Kod z obrazka weryfikacyjnego w sesji jest pusty, sproboj ponownie.";
			else
			{
				if(empty($userstring))
					$errors[] = "Prosze wpisac kod z obrazka weryfikacyjnego.";
				else
				{
					if($string != $userstring)
						$errors[] = "Kod z obrazka weryfikacyjnego jest niepoprawny.";
				}
			}
		}
		
		if(count($errors) == 0)
		{
			$code_info = check_code_dotpay($config['dotpay'][$sms_type]['code'], $posted_code, $config['dotpay'][$sms_type]['id'], $config['dotpay'][$sms_type]['type']);
			if($code_info[0] == 0)
				$errors[] = 'Podany kod z SMSa/przelewu jest niepoprawny lub wybrano zla opcje SMSa/przelewu.';
			else
			{
				if(add_points($account, $config['dotpay'][$sms_type]['addpoints']))
				{
					save_trans('config/dotpay.log', $account->getId(), $posted_code);
					$code_info = delete_code_dotpay($config['dotpay'][$sms_type]['code'], $posted_code, $config['dotpay'][$sms_type]['id'], $config['dotpay'][$sms_type]['type']);
					$main_content .= '<h1><font color="red">Dodano '.$config['dotpay'][$sms_type]['addpoints'].' punktow premium do konta: '.$to_user.' !</font></h1>';
				}
				else
					$errors[] = 'Wystapil blad podczas dodawania punktow do konta, sproboj ponownie.';
			}
		}
	}
}
if(count($errors) > 0)
{
	$main_content .= 'Wystapily bledy:';
	foreach($errors as $error)
		$main_content .= '<br />* '.$error;
	$main_content .= '<hr /><hr />';
}
if($config['dotpay_active_sms'])
{
	$main_content .= '<h2>SMS</h2>Kup punkty premium, mozesz je wymienic w sklepie OTSa na PACC/przedmioty w grze, aby zakupic punkty premium wyslij SMSa:';
	foreach($config['dotpay'] as $sms)
		if($sms['type'] == 'sms')
			$main_content .= '<br /><b>* Na numer <font color="red">'.$sms['sms_number'].'</font> o tresci <font color="red"><b>'.$sms['sms_text'].'</b></font> za <font color="red"><b>'.$sms['sms_cost'].'</b></font>, a za kod dostaniesz <font color="red"><b>'.$sms['addpoints'].'</b></font> punktow premium.</b>';
	$main_content .= '<br />W SMSie zwrotnym otrzymasz specjalny kod. Wpisz ten kod w formularzu wraz z nickiem postaci lub numerem konta osoby ktora ma otrzymac punkty.<br />
	Serwis SMS obslugiwany przez <a href="http://www.dotpay.pl" target="_blank">Dotpay.pl</a><br />
	Regulamin: <a href="http://www.dotpay.pl/regulaminsms" target="_blank">http://www.dotpay.pl/regulaminsms</a><br />
	Usluga dostepna w sieciach: Orange, Plus GSM, Era.<br />
	<b>'.$config['server']['serverName'].'</b> nie odpowieda za zle wpisane tresci SMS.<hr />';
}
if($config['dotpay_active_transfer'])
{
	$main_content .= '<h2>Przelew/karta kredytowa</h2>Kup punkty premium, mozesz je wymienic w sklepie OTSa na PACC/przedmioty w grze, aby zakupic punkty premium wejdz na jeden z adresow i wypelnij formularz:';
	foreach($config['dotpay'] as $przelew)
		if($przelew['type'] == 'C1')
			$main_content .= '<br /><b>* Adres - <a href="https://ssl.allpay.pl/?id='.$przelew['id'].'&code='.$przelew['code'].'"><font color="red">https://ssl.allpay.pl/?id='.$przelew['id'].'&code='.$przelew['code'].'</font></a> - koszt <font color="red"><b>'.$przelew['sms_cost'].'</b></font>, a za kod dostaniesz <font color="red"><b>'.$przelew['addpoints'].'</b></font> punktow premium.</b>';
	$main_content .= 'Kiedy Twoj przelew dojdzie (z kart kredytowych i bankow internetowych z listy jest to kwestia paru sekund) na e-mail ktory podales w formularzu otrzymasz kod. Kod ten mozesz wymienic na tej stronie na punkty premium w formularzu ponizej.<hr />';
}
$main_content .= '<form action="?subtopic=buypoints&system=dotpay" method="POST"><table>';
$main_content .= '<tr><td><b>Nick postaci lub numer konta: </b></td><td><input type="text" size="20" value="'.$to_user.'" name="to_user" /></td></tr>
<tr><td><b>Kod z SMSa: </b></td<td><input type="text" size="20" value="'.$posted_code.'" name="code" /></td></tr><tr><td><b>Typ wyslanego SMSa: </b></td><td><select name="sms_type">';
foreach($config['dotpay'] as $id => $sms)
	if($sms['type'] == 'sms')
		$main_content .= '<option value="'.$id.'">numer '.$sms['sms_number'].' - kod '.$sms['sms_text'].' - SMS za '.$sms['sms_cost'].'</option>';
	elseif($przelew['type'] == 'C1')
		$main_content .= '<option value="'.$id.'">przelew - kod '.$sms['sms_text'].' - za '.$sms['sms_cost'].'</option>';
$main_content .= '</select></td></tr>';
if($config['site']['verify_code_shop'])
		$main_content .= '<tr><td><B>Kod weryfikacji: </B></td><td><img src="imgverification/imagebuilder.php?image_refresher='.mt_rand(1,99999).'" border="0" alt=""></td></tr>
						  <tr><td><B>Wpisz kod weryfikacji: </B></td><td><INPUT id="verify" NAME="verify_code" VALUE="" SIZE=30></td></tr>';
$main_content .= '<tr><td></td><td><input type="submit" value="Sprawdz" /></td></tr></table></form>';

}
else
{
	if($config['dotpay_active'])
		$main_content .= '<br /><br /><a href="?subtopic=buypoints&system=dotpay"><h2>For users from Poland - LINK</h2></a><h3>Zaplac SMS, karta kredytowa lub przelewem bankowym.</h3>';
	if($config['daopay_active'])
		$main_content .= '<br /><br /><a href="?subtopic=buypoints&system=daopay"><h2>Donate via Daopay</h2></a><h3>Send SMS (not for all countries) or call special number to donate and get points.</h3>';
	if($config['zaypay_active'])
		$main_content .= '<br /><br /><a href="?subtopic=buypoints&system=zaypay"><h2>Donate via Zaypay</h2></a><h3>Send SMS (not for all countries) or call special number to donate and get points.</h3>';
	if($config['paypal_active'])
		$main_content .= '<br /><br /><a href="?subtopic=buypoints&system=paypal"><h2>Donate via Paypal</h2></a><h3>Donate via Paypal to get 12 shop points.</h3>';
}
?>