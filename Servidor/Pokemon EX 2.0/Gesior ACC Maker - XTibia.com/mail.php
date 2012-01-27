<?PHP
if($group_id_of_acc_logged >= $config['site']['access_admin_panel']) {
$email = $SQL->query('SELECT * FROM '.$SQL->tableName('accounts').' WHERE email != "";');
$mail_content = stripslashes(trim($_POST['mail_content']));
$subject = stripslashes(ucwords(strtolower(trim($_REQUEST['subject']))));
if(empty($mail_content)) {
$main_content .= '<form action="" method="post"><b>Subject Title:</b><input type="textbox" name="subject"><br>
<b>Mail Content:</b><textarea name="mail_content" rows="3" cols="45"></textarea><br><input type="submit" value="Send emails">
</form>';
} else {
require("phpmailer/class.phpmailer.php");
$mail = new PHPMailer();
foreach($email  as $emails) {
if ($config['site']['smtp_enabled'] == "yes") {
$mail->IsSMTP();
$mail->Host = $config['site']['smtp_host'];
$mail->Port = (int)$config['site']['smtp_port'];
$mail->SMTPAuth = ($config['site']['smtp_auth'] ? true : false);
$mail->Username = $config['site']['smtp_user'];
$mail->Password = $config['site']['smtp_pass'];
} else
$mail->IsMail();
$mail->IsHTML(true);
$mail->From = $config['site']['mail_address'];
$mail->AddAddress($emails['email']);
$mail->Subject = $subject;
$mail->Body = $mail_content;
}
if($mail->Send())
{
$main_content .= '<br />Mass emails has been sent.';
} else {
$main_content .= '<br />An error occorred while sending email! Try again or contact with admin.';
}
}
}
else
$main_content .= 'Sorry, you have not the rights to access this page.';
?>
