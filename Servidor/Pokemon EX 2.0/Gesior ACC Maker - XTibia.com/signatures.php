<?PHP
$imagename = array(0 => 'blue', 1 => 'red', 2 => 'green');
$name = stripslashes(ucwords(strtolower(trim($_REQUEST['character']))));
$img = (int) $_REQUEST['image'];
if(empty($name)) {
	$main_content .= '<p></p><center><form action="" method="post"><B>Enter Character Name:</B><input type="textbox" name="character"><br/><br/><B><h3><u>Select Signature:</u></B></h3><select name=image><option value="">(Select Image)</option>';
	foreach($imagename as $id => $image_n) {
	$main_content .= '<option value="'.$id.'" onClick="this.form.submit()"';
		if($id == $img)
		$main_content .= ' selected="selected"';
	$main_content .= '>'.$image_n.'</option>';
	}
	$main_content .= '</select><br><br>
			 <img src="signatures/'.$imagename[$img].'.png" width="350"/><br/><br>
			  <input type="submit" value="Create Signature"></form></center>';
		} else {
	$main_content .= '<br><TABLE BORDER=0><TR><TD></TD></TR></TABLE><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Signature</B></TD></TR>';
	$main_content .= "<TR BGCOLOR=".$config['site']['darkborder']."><TD WIDTH=20%>Forum Link:</TD><TD><input type='text' size='75' onclick='this.select();' value='[url=http://" . $_SERVER['HTTP_HOST'] . "/?subtopic=characters&name=" .urlencode($name) . "][IMG]http://" . $_SERVER['HTTP_HOST'] . "/signature.php?character=" .urlencode($name) . "&image=" . $img . "[/IMG][/url]' /></TD></TR>";
	$main_content .= "<TR BGCOLOR=".$config['site']['lightborder']."><TD WIDTH=20%>Direct Link:</TD><TD><input type='text' size='60' onclick='this.select();' value='http://" . $_SERVER['HTTP_HOST'] . "/signature.php?character=" .urlencode($name) . "&image=" . $img . "' /></TD></TR>";
	$main_content .= "<TR BGCOLOR=".$config['site']['darkborder']."><TD COLSPAN='2' style='text-align: center;'><a href='http://" . $_SERVER['HTTP_HOST'] . "/?subtopic=characters&name=" .urlencode($name) . "'><img src='signature.php?character=" .urlencode($name) . "&image=" . $img . "' /></a></TD></TR>";
	$main_content .= '</TD></TR></TABLE>';
}
?>


