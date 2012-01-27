<?php
/*
	exaBotDefender 1.0
	http://www.web6.pl/exaBotDefender/
	Skrypt na licencji GPL

	Pomoc przy konfiguracji i administracji VPS: http://vps.web6.pl/
*/

# KONRFIGURACJA:

/**
	Miejsce zapisywania logow przez skrypt. Katalog ten wraz ze wszystkimi
	podkatalogami musi miec nadane uprawnienia do zapisu. Skrypt automatycznie
	czyści zawartość tego katalogu raz na 24 godziny.
*/
if(empty($bd_save_dir))
	$bd_save_dir = './bdsave/';

/** Maksymalna ilosc wywolan skryptu w czasie 30 sekund przez dane IP. */
$bd_xlimit['users'] = 20; // dla uzytkownikow przegladajacych strone

/** Czas blokady dostepu do strony w sekundach */
$bd_lock_time = 300;
/** Komunikat blokady */
$bd_page_blocked = 'exaBotDefender. Access to site blocked for 5 minutes for your IP address.';

#  KONIEC KONFIGURACJI

#####################################

// jezeli ktos szuka include buga blokujemy dzialanie skryptu
if(!empty($_SERVER['REQUEST_URI']) && strstr($_SERVER['REQUEST_URI'], 'http://') !== false)
	die('exaBotDefender. STOP');


// dla potencjalnych botow google, yahoo i msn - przenioslem to tu, bo nie ma sensu zmieniac tej wartosci
$bd_xlimit['searchbots'] = 40;
// czas zbierania danych (domyslnie 30 sekund)
$bd_check_interval = 5;
// ilosc katalogow - uwaga, kolejne kataogi nalezy najpierw utworzyc recznie
$bd_dirs = 10;

$ip_part = (int)($_SERVER['REMOTE_ADDR']{0}.$_SERVER['REMOTE_ADDR']{1});
$UA = !empty($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : false;
// proba google || yahoo || msn
if($ip_part > 62 && $ip_part < 75 && $UA && (
	strstr($UA, 'Google') !== false || strstr($UA, 'Yahoo') !== false || strstr($UA, 'msnbot') !== false
)){
	$bd_limit = $bd_xlimit['searchbots'];
}
else{
	$bd_limit = $bd_xlimit['users'];
}

$now = time();
$bd_lock_stop = false;
$bd_subdir = (abs(ip2long($_SERVER['REMOTE_ADDR']))%$bd_dirs + 1) . '/';
$bd_chckfile = $bd_save_dir.$bd_subdir.$_SERVER['REMOTE_ADDR'];
if(file_exists($bd_chckfile.'.lock')){
	$f_time = (int)file_get_contents($bd_chckfile.'.lock');
	// jezeli limit wygasl
	if($now > $f_time){
		@ unlink($bd_chckfile.'.lock');
		@ unlink($bd_chckfile);
	}
	else
		$bd_lock_stop = true;
}

if(!$bd_lock_stop){
	$TimeToLimit = $bd_check_interval / $bd_limit;
	$new_file = true;

	if(file_exists($bd_chckfile)){
		$fdata = explode(',',file_get_contents($bd_chckfile));
		$f_count = (int)$fdata[0] + 1;
		$f_time = (int)$fdata[1];
		$f_last_time = (int)$fdata[2];
		$new_file = false;

		// jezeli przekroczono limi wejsc oraz stosunek czas/wejsc jest za maly (<$TimeToLimit)
		if($f_count > $bd_limit && (($now - $f_time)/$f_count < $TimeToLimit)) {
			// zalozenie locka
			if(($fp = @fopen($bd_chckfile.'.lock', 'w')) && flock($fp, LOCK_EX)){ // do an exclusive lock
				fwrite($fp, ($now + $bd_lock_time));
				flock($fp, LOCK_UN); // release the lock
				fclose($fp);

				// log zapisujacy fakt zablokowania bota
				if(($fp = @fopen($bd_save_dir.'locklog.txt', 'a')) && flock($fp, LOCK_EX)){ // do an exclusive lock
					fwrite($fp, date('Y-m-d H:i:s') . ' ' . $_SERVER['REMOTE_ADDR'] . "\n");
					flock($fp, LOCK_UN); // release the lock
					fclose($fp);
				}
			}

			$bd_lock_stop = true;
		}
		// zerujemy limit
		elseif(($f_last_time + $bd_check_interval) < $now){
			$new_file = true;
		}
		// zapisujemy zmiany do pliku
		else{
			if(($fp = @fopen($bd_chckfile, 'w')) && flock($fp, LOCK_EX)){ // do an exclusive lock
				fwrite($fp, $f_count.','.$f_time.','.$now);
				flock($fp, LOCK_UN); // release the lock
				fclose($fp);
			}
		}
	}

	if($new_file){
		if(($fp = @fopen($bd_chckfile, 'w')) && flock($fp, LOCK_EX)){ // do an exclusive lock
			fwrite($fp, '1,'.$now.','.$now);
			flock($fp, LOCK_UN); // release the lock
			fclose($fp);
		}
		elseif(!is_writable($bd_save_dir.$bd_subdir))
			die('exaBotDefender blad: nadaj uprawnienia zapisu dla' . $bd_save_dir.$bd_subdir);
	}
}

if($bd_lock_stop === true)
	die($bd_page_blocked);

// Czyszczenie wszystkich statystyk raz na 24 godzny
if($f = @ fopen($bd_save_dir.'day.dat', 'r')){
	$f_date = chop(fgets($f, 5));
	fclose($f);
}
else
	$f_date = 0;
$today = date('d');

// warunek wykona sie raz na 24 godziny
if($f_date != $today){
	for($i = 1; $i <= $bd_dirs; $i++){
		$dir = $bd_save_dir.$i.'/';
		if($dh = opendir($dir)){
			while(($file = readdir($dh)) !== false)
				if($file{0} != '.')
					@ unlink($dir.$file);
			closedir($dh);
      }
   }

	if($f = @ fopen($bd_save_dir.'day.dat', 'w')){
		fputs($f, $today);
		fclose($f);
	}
	else
		die('exaBotDefender blad: nadaj uprawnienia zapisu dla' . $bd_save_dir);
}

?>