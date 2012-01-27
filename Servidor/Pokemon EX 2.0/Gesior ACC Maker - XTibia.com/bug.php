   <?php
if($logged)
{
    // type (1 = question; 2 = answer)
    // status (1 = open; 2 = new message; 3 = closed;)
    
    $dark = $config['site']['darkborder'];
    $light = $config['site']['lightborder'];
    
    $tags = array(1 => "[MAP]", "[WEBSITE]", "[CLIENT]", "[MONSTER]", "[NPC]", "[OTHER]");
        
    if($group_id_of_acc_logged >= $config['site']['access_admin_panel'] and $_REQUEST['control'] == "true")
    {
        if(empty($_REQUEST['id']) and empty($_REQUEST['acc']) or !is_numeric($_REQUEST['acc']) or !is_numeric($_REQUEST['id']) )
            $bug[1] = $SQL->query('SELECT * FROM '.$SQL->tableName('z_bug_tracker').' where `type` = 1 order by `uid` desc');
        
        if(!empty($_REQUEST['id']) and is_numeric($_REQUEST['id']) and !empty($_REQUEST['acc']) and is_numeric($_REQUEST['acc']))
            $bug[2] = $SQL->query('SELECT * FROM '.$SQL->tableName('z_bug_tracker').' where `account` = '.$_REQUEST['acc'].' and `id` = '.$_REQUEST['id'].' and `type` = 1')->fetch();
        
        if(!empty($_REQUEST['id']) and is_numeric($_REQUEST['id']) and !empty($_REQUEST['acc']) and is_numeric($_REQUEST['acc']))
        {
            if(!empty($_REQUEST['reply']))
                $reply=true;
                
            $account = $ots->createObject('Account');
            $account->load($_REQUEST['acc']);
            $account->isLoaded();
            $players = $account->getPlayersList();
            
            if(!$reply)
            {
                if($bug[2]['status'] == 2)
                    $value = "<font color=green>[OPEN]</font>";
                elseif($bug[2]['status'] == 3)
                    $value = "<font color=red>[CLOSED]</font>";
                elseif($bug[2]['status'] == 1)
                    $value = "<font color=blue>[NEW ANSWER]</font>";
                    
                $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Bug Tracker</B></TD></TR>';                            
                $main_content .= '<TR BGCOLOR="'.$dark.'"><td width=40%><i><b>Subject</b></i></td><td>'.$tags[$bug[2]['tag']].' '.$bug[2]['subject'].' '.$value.'</td></tr>';    
                $main_content .= '<TR BGCOLOR="'.$light.'"><td><i><b>Posted by</b></i></td><td>';    
                
                foreach($players as $player)
                {
                    $main_content .= ''.$player->getName().'<br>';
                }
                
                $main_content .= '</td></tr>';
                $main_content .= '<TR BGCOLOR="'.$dark.'"><td colspan=2><i><b>Description</b></i></td></tr>';    
                $main_content .= '<TR BGCOLOR="'.$light.'"><td colspan=2>'.nl2br($bug[2]['text']).'</td></tr>';    
                $main_content .= '</TABLE>';
                
                $answers = $SQL->query('SELECT * FROM '.$SQL->tableName('z_bug_tracker').' where `account` = '.$_REQUEST['acc'].' and `id` = '.$_REQUEST['id'].' and `type` = 2 order by `reply`');
                foreach($answers as $answer)
                {
                    if($answer['who'] == 1)
                        $who = "<font color=red>[ADMIN]</font>";
                    else
                        $who = "<font color=green>[PLAYER]</font>";
                        
                    $main_content .= '<br><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Answer #'.$answer['reply'].'</B></TD></TR>';                            
                    $main_content .= '<TR BGCOLOR="'.$dark.'"><td width=70%><i><b>Posted by</b></i></td><td>'.$who.'</td></tr>';    
                    $main_content .= '<TR BGCOLOR="'.$light.'"><td colspan=2><i><b>Description</b></i></td></tr>';    
                    $main_content .= '<TR BGCOLOR="'.$dark.'"><td colspan=2>'.nl2br($answer['text']).'</td></tr>';    
                    $main_content .= '</TABLE>';
                }
                if($bug[2]['status'] != 3)
                    $main_content .= '<br><a href="index.php?subtopic=bugtracker&control=true&id='.$_REQUEST['id'].'&acc='.$_REQUEST['acc'].'&reply=true"><b>[REPLY]</b></a>';
            }
            else
            {
                if($bug[2]['status'] != 3)
                {
                    $reply = $SQL->query('SELECT MAX(reply) FROM `z_bug_tracker` where `account` = '.$_REQUEST['acc'].' and `id` = '.$_REQUEST['id'].' and `type` = 2')->fetch();
                    $reply = $reply[0] + 1;
                    $iswho = $SQL->query('SELECT * FROM `z_bug_tracker` where `account` = '.$_REQUEST['acc'].' and `id` = '.$_REQUEST['id'].' and `type` = 2 order by `reply` desc limit 1')->fetch();

                    if(isset($_POST['finish']))
                    {
                        if(empty($_POST['text']))
                            $error[] = "<font color=black><b>Description cannot be empty.</b></font>";
                        if($iswho['who'] == 1)
                            $error[] = "<font color=black><b>You must wait for User answer.</b></font>";
                        if(empty($_POST['status']))
                            $error[] = "<font color=black><b>Status cannot be empty.</b></font>";
                            
                        if(!empty($error))
                        {
                            foreach($error as $errors)
                                $main_content .= ''.$errors.'<br>';
                        }
                        else
                        {
                            $type = 2;
                            $INSERT = $SQL->query('INSERT INTO `z_bug_tracker` (`account`,`id`,`text`,`reply`,`type`, `who`) VALUES ('.$SQL->quote($_REQUEST['acc']).','.$SQL->quote($_REQUEST['id']).','.$SQL->quote($_POST['text']).','.$SQL->quote($reply).','.$SQL->quote($type).','.$SQL->quote(1).')');
                            $UPDATE = $SQL->query('UPDATE `z_bug_tracker` SET `status` = '.$_POST['status'].' where `account` = '.$_REQUEST['acc'].' and `id` = '.$_REQUEST['id'].'');
                            header('Location: index.php?subtopic=bugtracker&control=true&id='.$_REQUEST['id'].'&acc='.$_REQUEST['acc'].'');
                        }
                    }
                    $main_content .= '<br><form method="post" action=""><table><tr><td><i>Description</i></td><td><textarea name="text" rows="15" cols="35"></textarea></td></tr><tr><td>Status[OPEN]</td><td><input type=radio name=status value=2></td></tr><tr><td>Status[CLOSED]</td><td><input type=radio name=status value=3></td></tr></table><br><input type="submit" name="finish" value="Submit" class="input2"/></form>';
                }
                else
                {
                    $main_content .= "<br><font color=black><b>You can't add answer to closed bug thread.</b></font>";
                }
            }
            
            $post=true;
        }
        if(!$post)
        {
            $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD colspan=2 CLASS=white><B>Bug Tracker Admin</B></TD></TR>';            
            $i=1;
            foreach($bug[1] as $report)
            {
                if($report['status'] == 2)
                    $value = "<font color=green>[OPEN]</font>";
                elseif($report['status'] == 3)
                    $value = "<font color=red>[CLOSED]</font>";
                elseif($report['status'] == 1)
                    $value = "<font color=blue>[NEW ANSWER]</font>";
                            
                if(is_int($i / 2))
                {
                    $bgcolor = $dark;
                }
                else
                {
                    $bgcolor = $light;
                }

                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><td width=75%><a href="index.php?subtopic=bugtracker&control=true&id='.$report['id'].'&acc='.$report['account'].'">'.$tags[$report['tag']].' '.$report['subject'].'</a></td><td>'.$value.'</td></tr>';            
                        
                $showed=true;
                $i++;
            }
            $main_content .= '</TABLE>';
        }
    }
    else
    {        
        $acc = $account_logged->getId();
        $account_players = $account_logged->getPlayersList();
        
        foreach($account_players as $player)
        {
            $allow=true;
        }
        
        if(!empty($_REQUEST['id']))
            $id = addslashes(htmlspecialchars(trim($_REQUEST['id'])));
        
        if(empty($_REQUEST['id']))
            $bug[1] = $SQL->query('SELECT * FROM '.$SQL->tableName('z_bug_tracker').' where `account` = '.$account_logged->getId().' and `type` = 1 order by `id` desc');
        
        if(!empty($_REQUEST['id']) and is_numeric($_REQUEST['id']))
            $bug[2] = $SQL->query('SELECT * FROM '.$SQL->tableName('z_bug_tracker').' where `account` = '.$account_logged->getId().' and `id` = '.$id.' and `type` = 1')->fetch();
        else
            $bug[2] = NULL;
            
        if(!empty($_REQUEST['id']) and $bug[2] != NULL)
        {
            if(!empty($_REQUEST['reply']))
                $reply=true;
            
            if(!$reply)
            {
                if($bug[2]['status'] == 1)
                    $value = "<font color=green>[OPEN]</font>";
                elseif($bug[2]['status'] == 2)
                    $value = "<font color=blue>[NEW ANSWER]</font>";
                elseif($bug[2]['status'] == 3)
                    $value = "<font color=red>[CLOSED]</font>";
                    
                $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Bug Tracker</B></TD></TR>';                            
                $main_content .= '<TR BGCOLOR="'.$dark.'"><td width=40%><i><b>Subject</b></i></td><td>'.$tags[$bug[2]['tag']].' '.$bug[2]['subject'].' '.$value.'</td></tr>';    
                $main_content .= '<TR BGCOLOR="'.$light.'"><td colspan=2><i><b>Description</b></i></td></tr>';    
                $main_content .= '<TR BGCOLOR="'.$dark.'"><td colspan=2>'.nl2br($bug[2]['text']).'</td></tr>';    
                $main_content .= '</TABLE>';
                
                $answers = $SQL->query('SELECT * FROM '.$SQL->tableName('z_bug_tracker').' where `account` = '.$account_logged->getId().' and `id` = '.$id.' and `type` = 2 order by `reply`');
                foreach($answers as $answer)
                {
                    if($answer['who'] == 1)
                        $who = "<font color=red>[ADMIN]</font>";
                    else
                        $who = "<font color=green>[YOU]</font>";
                        
                    $main_content .= '<br><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Answer #'.$answer['reply'].'</B></TD></TR>';                            
                    $main_content .= '<TR BGCOLOR="'.$dark.'"><td width=70%><i><b>Posted by</b></i></td><td>'.$who.'</td></tr>';    
                    $main_content .= '<TR BGCOLOR="'.$light.'"><td colspan=2><i><b>Description</b></i></td></tr>';    
                    $main_content .= '<TR BGCOLOR="'.$dark.'"><td colspan=2>'.nl2br($answer['text']).'</td></tr>';    
                    $main_content .= '</TABLE>';
                }
                if($bug[2]['status'] != 3)
                    $main_content .= '<br><a href="index.php?subtopic=bugtracker&id='.$id.'&reply=true"><b>[REPLY]</b></a>';
            }
            else
            {
                if($bug[2]['status'] != 3)
                {
                    $reply = $SQL->query('SELECT MAX(reply) FROM `z_bug_tracker` where `account` = '.$acc.' and `id` = '.$id.' and `type` = 2')->fetch();
                    $reply = $reply[0] + 1;
                    $iswho = $SQL->query('SELECT * FROM `z_bug_tracker` where `account` = '.$acc.' and `id` = '.$id.' and `type` = 2 order by `reply` desc limit 1')->fetch();

                    if(isset($_POST['finish']))
                    {
                        if(empty($_POST['text']))
                            $error[] = "<font color=black><b>Description cannot be empty.</b></font>";
                        if($iswho['who'] == 0)
                            $error[] = "<font color=black><b>You must wait for Administrator answer.</b></font>";
                        if(!$allow)
                            $error[] = "<font color=black><b>You haven't any characters on account.</b></font>";
                            
                        if(!empty($error))
                        {
                            foreach($error as $errors)
                                $main_content .= ''.$errors.'<br>';
                        }
                        else
                        {
                            $type = 2;
                            $INSERT = $SQL->query('INSERT INTO `z_bug_tracker` (`account`,`id`,`text`,`reply`,`type`) VALUES ('.$SQL->quote($acc).','.$SQL->quote($id).','.$SQL->quote($_POST['text']).','.$SQL->quote($reply).','.$SQL->quote($type).')');
                            $UPDATE = $SQL->query('UPDATE `z_bug_tracker` SET `status` = 1 where `account` = '.$acc.' and `id` = '.$id.'');
                            header('Location: index.php?subtopic=bugtracker&id='.$id.'');
                        }
                    }
                    $main_content .= '<br><form method="post" action=""><table><tr><td><i>Description</i></td><td><textarea name="text" rows="15" cols="35"></textarea></td></tr></table><br><input type="submit" name="finish" value="Submit" class="input2"/></form>';
                }
                else
                {
                    $main_content .= "<br><font color=black><b>You can't add answer to closed bug thread.</b></font>";
                }
            }
            
            $post=true;
        }
        elseif(!empty($_REQUEST['id']) and $bug[2] == NULL)
        {
            $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD CLASS=white><B>Bug Tracker</B></TD></TR>';                            
            $main_content .= '<TR BGCOLOR="'.$dark.'"><td><i>Bug doesn\'t exist.</i></td></tr>';    
            $main_content .= '</TABLE>';
            $post=true;
        }
        
        if(!$post)
        {
            if($_REQUEST['add'] != TRUE)
            {
                $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD colspan=2 CLASS=white><B>Bug Tracker</B></TD></TR>';            
                foreach($bug[1] as $report)
                {
                    if($report['status'] == 1)
                        $value = "<font color=green>[OPEN]</font>";
                    elseif($report['status'] == 2)
                        $value = "<font color=blue>[NEW ANSWER]</font>";
                    elseif($report['status'] == 3)
                        $value = "<font color=red>[CLOSED]</font>";
                        
                    if(is_int($report['id'] / 2))
                    {
                        $bgcolor = $dark;
                    }
                    else
                    {
                        $bgcolor = $light;
                    }

                    $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><td width=75%><a href="index.php?subtopic=bugtracker&id='.$report['id'].'">'.$tags[$report['tag']].' '.$report['subject'].'</a></td><td>'.$value.'</td></tr>';            
                    
                    $showed=true;
                }
                
                if(!$showed)
                {
                    $main_content .= '<TR BGCOLOR="'.$dark.'"><td><i>You don\'t have reported any bugs.</i></td></tr>';    
                }
                $main_content .= '</TABLE>';
                
                $main_content .= '<br><a href="index.php?subtopic=bugtracker&add=true"><b>[ADD REPORT]</b></a>';
            }
            elseif($_REQUEST['add'] == TRUE)
            {
                $thread = $SQL->query('SELECT * FROM `z_bug_tracker` where `account` = '.$acc.' and `type` = 1 order by `id` desc')->fetch();
                $id_next = $SQL->query('SELECT MAX(id) FROM `z_bug_tracker` where `account` = '.$acc.' and `type` = 1')->fetch();
                $id_next = $id_next[0] + 1;
                
                if(empty($thread))
                    $thread['status'] = 3;
                    
                if(isset($_POST['submit']))
                {
                    if($thread['status'] != 3)
                        $error[] = "<font color=black><b>Can be only 1 open bug thread.</b></font>";
                    if(empty($_POST['subject']))
                        $error[] = "<font color=black><b>Subject cannot be empty.</b></font>";
                    if(empty($_POST['text']))
                        $error[] = "<font color=black><b>Description cannot be empty.</b></font>";
                    if(!$allow)
                        $error[] = "<font color=black><b>You haven't any characters on account.</b></font>";
                    if(empty($_POST['tags']))
                        $error[] = "<font color=black><b>Tag cannot be empty.</b></font>";
                        
                    if(!empty($error))
                    {
                        foreach($error as $errors)
                            $main_content .= ''.$errors.'<br>';
                    }
                    else
                    {
                        $type = 1;
                        $status = 1;
                        $INSERT = $SQL->query('INSERT INTO `z_bug_tracker` (`account`,`id`,`text`,`type`,`subject`,`status`,`tag`) VALUES ('.$SQL->quote($acc).','.$SQL->quote($id_next).','.$SQL->quote($_POST['text']).','.$SQL->quote($type).','.$SQL->quote($_POST['subject']).','.$SQL->quote($status).','.$SQL->quote($_POST['tags']).')');
                        header('Location: index.php?subtopic=bugtracker&id='.$id_next.'');
                    }
                        
                }
                $main_content .= '<br><form method="post" action=""><table><tr><td><i>Subject</i></td><td><input type=text name="subject"/></td></tr><tr><td><i>Description</i></td><td><textarea name="text" rows="15" cols="35"></textarea></td></tr><tr><td>TAG</td><td><select name="tags"><option value="">SELECT</option>';
                
                for($i = 1; $i <= count($tags); $i++)
                {
                    $main_content .= '<option value="' . $i . '">' . $tags[$i] . '</option>';
                }
                
                $main_content .= '</select></tr></tr></table><br><input type="submit" name="submit" value="Submit" class="input2"/></form>';
            }
        }
    }
    
    if($group_id_of_acc_logged >= $config['site']['access_admin_panel'] and empty($_REQUEST['control']))
    {
        $main_content .= '<br><br><a href="index.php?subtopic=bugtracker&control=true">[ADMIN PANEL]</a>';
    }
}
else
{
    $main_content .= 'Please enter your account name and your password.<br/><a href="?subtopic=createaccount" >Create an account</a> if you do not have one yet.<br/><br/><form action="?subtopic=bugtracker" method="post" ><div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Account Login</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td class="LabelV" ><span >Account Name:</span></td><td style="width:100%;" ><input type="password" name="account_login" SIZE="10" maxlength="10" ></td></tr><tr><td class="LabelV" ><span >Password:</span></td><td><input type="password" name="password_login" size="30" maxlength="29" ></td></tr>          </table>        </div>  </table></div></td></tr><br/><table width="100%" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=lostaccount" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Account lost?" alt="Account lost?" src="'.$layout_name.'/images/buttons/_sbutton_accountlost.gif" ></div></div></td></tr></form></table></td></tr></table>';
}
?> 