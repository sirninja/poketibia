<?php
$news_DB = $SQL->query("SELECT `post_topic`, `post_date`, `id` FROM `z_forum` WHERE `section` = '1' AND `z_forum`.`id` = `first_post` ORDER BY `post_date` DESC LIMIT 25");
{
	$main_content .= '<table border=0 cellspacing=1 cellpadding=4 width=100%>
	<tr bgcolor="'.$config['site']['vdarkborder'].'">
	<TD COLSPAN=3 CLASS=white><B>Archive</B></TD></TR>';
	foreach($news_DB as $news)
	{
		if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			$main_content .= '<tr BGCOLOR='.$bgcolor.'><td width=4%><center><img src="'.$layout_name.'/images/news/icon_1.gif"></center></td><td>'.date("j.n.Y", $news['post_date']).'</td><td><b><a href="?subtopic=forum&action=show_thread&id='.$news['id'].'">'.stripslashes($news['post_topic']).'</a></b></td></tr>';
	}
	$main_content .= '</table>';
}

?>

