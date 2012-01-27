<?PHP
if(!$logged)
        if($action == "logout")
                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Logout Successful</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>You have logged out of your '.$config['server']['serverName'].' account. In order to view your account you need to <a href="?subtopic=accountmanagement" >log in</a> again.</td></tr>          </table>        </div>  </table></div></td></tr>';
        else
                $main_content .= 'Please enter your account name and your password.<br/><a href="?subtopic=createaccount" >Create an account</a> if you do not have one yet.<br/><br/><form action="?subtopic=accountmanagement" method="post" ><div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Account Login</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td class="LabelV" ><span >Account Name:</span></td><td style="width:100%;" ><input type="password" name="account_login" SIZE="10" maxlength="10" ></td></tr><tr><td class="LabelV" ><span >Password:</span></td><td><input type="password" name="password_login" size="30" maxlength="29" ></td></tr>          </table>        </div>  </table></div></td></tr><br/><table width="100%" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=lostaccount" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Account lost?" alt="Account lost?" src="'.$layout_name.'/images/buttons/_sbutton_accountlost.gif" ></div></div></td></tr></form></table></td></tr></table>';
else
{
        if($action == "")
        {
                $account_reckey = $account_logged->getRecoveryKey();
                if(!$account_logged->isPremium())
                        $account_status = '<b><font color="red">Free Account</font></b>';
                else
                        $account_status = '<b><font color="green">Premium Account, '.$account_logged->getPremDays().' days left</font></b>';
                if(empty($account_reckey))
                        $account_registred = '<b><font color="red">No</font></b>';
                else
                        if($config['site']['generate_new_reckey'] && $config['site']['send_emails'])
                                $account_registred = '<b><font color="green">Yes ( <a href="?subtopic=accountmanagement&action=newreckey"> Buy new Rec key </a> )</font></b>';
                        else
                                $account_registred = '<b><font color="green">Yes</font></b>';
                $account_created = $account_logged->getCreated();
                $account_email = $account_logged->getEMail();
                $account_email_new_time = $account_logged->getCustomField("email_new_time");
                if($account_email_new_time > 1)
                        $account_email_new = $account_logged->getCustomField("email_new");
                $account_rlname = $account_logged->getRLName();
                $account_location = $account_logged->getLocation();
                if($account_logged->isBanned())
                        if($account_logged->getBanTime() > 0)
                                $welcome_msg = '<font color="red">Your account is banished until '.date("j F Y, G:i:s", $account_logged->getBanTime()).'!</font>';
                        else
                                $welcome_msg = '<font color="red">Your account is banished FOREVER!</font>';
                else
                        $welcome_msg = 'Welcome to your account!';
                $main_content .= '<div class="SmallBox" >  <div class="MessageContainer" ><div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div><div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div><div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div><div class="Message" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div><div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div><table><td width="100%" align=center>';
if($config['site']['worldtransfer'] == 1)
$main_content .= '<a href="?subtopic=accountmanagement&action=charactertransfer">Character World Transfer</a>';
$main_content .= '</td><td width=50%><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=logout" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Logout" alt="Logout" src="'.$layout_name.'/images/buttons/_sbutton_logout.gif" ></div></div></td></tr></form></table></td></tr></table>    </div><div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/><center><table><tr><td><img src="'.$layout_name.'/images/content/headline-bracer-left.gif" /></td><td style="text-align:center;vertical-align:middle;horizontal-align:center;font-size:17px;font-weight:bold;" >'.$welcome_msg.'<br/></td><td><img src="'.$layout_name.'/images/content/headline-bracer-right.gif" /></td></tr></table><br/></center>';
                //if account dont have recovery key show hint
                if(empty($account_reckey))
                        $main_content .= '<div class="SmallBox" ><div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div><div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div><div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div><div class="Message" ><div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div><div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div><table><tr><td class="LabelV" >Hint:</td><td style="width:100%;" >You can register your account for increased protection. Click on "Register Account" and get your free recovery key today!</td></tr></table><div align="center" ><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=registeraccount" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Register Account" alt="Register Account" src="'.$layout_name.'/images/buttons/_sbutton_registeraccount.gif" ></div></div></td></tr></form></table></div></div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div><div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div><div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
                if($account_email_new_time > 1)
                        if($account_email_new_time < time())
                                $account_email_change = '<br>(You can accept <b>'.$account_email_new.'</b> as a new email.)';
                        else
                        {
                                $account_email_change = ' <br>You can accept <b>new e-mail after '.date("j F Y", $account_email_new_time).".</b>";
                                $main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="Message" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div><table><tr><td class="LabelV" >Note:</td><td style="width:100%;" >A request has been submitted to change the email address of this account to <b>'.$account_email_new.'</b>. After <b>'.date("j F Y, G:i:s", $account_email_new_time).'</b> you can accept the new email address and finish the process. Please cancel the request if you do not want your email address to be changed! Also cancel the request if you have no access to the new email address!</td></tr></table><div align="center" ><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=changeemail" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Edit" alt="Edit" src="'.$layout_name.'/images/buttons/_sbutton_edit.gif" ></div></div></td></tr></form></table></div>    </div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/><br/>';
                        }
                $main_content .= '<a name="General+Information" ></a><div class="TopButtonContainer" ><div class="TopButton" ><a href="#top" >  <image style="border:0px;" src="'.$layout_name.'/images/content/back-to-top.gif" /></a></div></div><div class="TableContainer" ><table class="Table3" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><div class="Text" >General Information</div><span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div>    </div><tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td><div class="TableShadowContainerRightTop" >  <div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div><div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" ><div class="TableContentContainer" >    <table class="TableContent" width="100%" ><tr style="background-color:'.$config['site']['darkborder'].';" ><td class="LabelV" >Email Address:</td><td style="width:90%;" >'.$account_email.''.$account_email_change.'</td></tr><tr style="background-color:'.$config['site']['lightborder'].';" ><td class="LabelV" >Created:</td><td>'.date("j F Y, G:i:s", $account_created).'</td></td><tr style="background-color:'.$config['site']['darkborder'].';" ><td class="LabelV" >Last Login:</td><td>'.date("j F Y, G:i:s", time()).'</td></tr><tr style="background-color:'.$config['site']['lightborder'].';" ><td class="LabelV" >Account Status:</td><td>'.$account_status.'</td></tr><tr style="background-color:'.$config['site']['darkborder'].';" ><td class="LabelV" >Registered:</td><td>'.$account_registred.'</td></tr></table></div></div><div class="TableShadowContainer" ><div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" ><div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div><div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div>  </div></div></td></tr><tr><td><table class="InnerTableButtonRow" cellpadding="0" cellspacing="0" ><tr><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=changepassword" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Change Password" alt="Change Password" src="'.$layout_name.'/images/buttons/_sbutton_changepassword.gif" ></div></div></td></tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=changeemail" method="post" ><tr><td style="border:0px;" ><input type="hidden" name=newemail value="" ><input type="hidden" name=newemaildate value=0 ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Change Email" alt="Change Email" src="'.$layout_name.'/images/buttons/_sbutton_changeemail.gif" ></div></div></td></tr></form>      </table></td><td width="100%"></td>';
                //show button "register account"
                if(empty($account_reckey))
                        $main_content .= '<td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=registeraccount" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Register Account" alt="Register Account" src="'.$layout_name.'/images/buttons/_sbutton_registeraccount.gif" ></div></div></td></tr></form></table></td>';
                $main_content .= '</tr></table></td></tr></table></div></table></div></td></tr><br/><a name="Public+Information" ></a><div class="TopButtonContainer" ><div class="TopButton" ><a href="#top" ><image style="border:0px;" src="'.$layout_name.'/images/content/back-to-top.gif" /></a></div></div><div class="TableContainer" >  <table class="Table5" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" ><span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><div class="Text" >Public Information</div><span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td><div class="TableShadowContainerRightTop" >  <div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div><div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" ><div class="TableContentContainer" >    <table class="TableContent" width="100%" ><tr><td><table style="width:100%;"><tr><td class="LabelV" >Real Name:</td><td style="width:90%;" >'.$account_rlname.'</td></tr><tr><td class="LabelV" >Location:</td><td style="width:90%;" >'.$account_location.'</td></tr></table></td><td align=right><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=changeinfo" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Edit" alt="Edit" src="'.$layout_name.'/images/buttons/_sbutton_edit.gif" ></div></div></td></tr></form></table></td></tr>    </table>  </div></div><div class="TableShadowContainer" >  <div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" >    <div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div>    <div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div>  </div></div></td></tr>          </table>        </div>  </table></div></td></tr><br/><br/>';
                $main_content .= '<a name="Characters" ></a><div class="TopButtonContainer" ><div class="TopButton" ><a href="#top" ><image style="border:0px;" src="'.$layout_name.'/images/content/back-to-top.gif" /></a></div></div><div class="TableContainer" >  <table class="Table3" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" ><div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><div class="Text" >Characters</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div>    </div>   <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td><div class="TableShadowContainerRightTop" ><div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div><div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" ><div class="TableContentContainer" >    <table class="TableContent" width="100%" ><tr class="LabelH" ><td style="width:65%" >Name</td><td style="width:15%" >Level</td><td style="width:7%">Status</td><td style="width:5%">&#160;</td></tr>';
                $account_players = $account_logged->getPlayersList();
                $account_players->orderBy('name');
                //show list of players on account
                foreach($account_players as $account_player)
                {
                        $player_number_counter++;
                        $main_content .= '<tr style="background-color:';
                        if(is_int($player_number_counter / 2))
                                $main_content .= $config['site']['darkborder'];
                        else
                                $main_content .= $config['site']['lightborder'];
                        $main_content .= ';" ><td><NOBR>'.$player_number_counter.'.&#160;'.$account_player->getName();
                        if($account_player->isDeleted())
                                $main_content .= '<font color="red"><b> [ DELETED ] </b> <a href="?subtopic=accountmanagement&action=undelete&name='.urlencode($account_player->getName()).'">>> UNDELETE <<</a></font>';
                        if($account_player->isNameLocked())
                                if($account_player->getOldName())
                                        $main_content .= '<font color="red"><b> [ NAMELOCK:</b> Wait for GM, new name: <b>'.$account_player->getOldName().' ]</b></font>';
                                else
                                        $main_content .= '<font color="red"><b> [ NAMELOCK: <form action="" method="GET"><input name="subtopic" type="hidden" value="accountmanagement" /><input name="action" type="hidden" value="newnick" /><input name="name" type="hidden" value="'.$account_player->getName().'" /><input name="name_new" type="text" value="Enter here new nick" size="16" /><input type="submit" value="Set new nick" /></form> ]</b></font>';
                        $main_content .= '</NOBR></td><td><NOBR>'.$account_player->getLevel().' '.$vocation_name[$account_player->getWorld()][$account_player->getPromotion()][$account_player->getVocation()].'</NOBR></td>';
                        if(!$account_player->isOnline())
                                $main_content .= '<td><font color="red"><b>Offline</b></font></td>';
                        else
                                $main_content .= '<td><font color="green"><b>Online</b></font></td>';
                        $main_content .= '<td>[<a href="?subtopic=accountmanagement&action=changecomment&name='.urlencode($account_player->getName()).'" >Edit</a>]</td></tr>';
                }
                $main_content .= '</table>  </div></div><div class="TableShadowContainer" >  <div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" >    <div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div>    <div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div>  </div></div></td></tr><tr><td><table class="InnerTableButtonRow" cellpadding="0" cellspacing="0" ><tr><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=createcharacter" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Create Character" alt="Create Character" src="'.$layout_name.'/images/buttons/_sbutton_createcharacter.gif" ></div></div></td></tr></form></table></td><td style="width:100%;" ></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=deletecharacter" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Delete Character" alt="Delete Character" src="'.$layout_name.'/images/buttons/_sbutton_deletecharacter.gif" ></div></div></td></tr></form></table></td></tr></table></td></tr>          </table>        </div>  </table></div></td></tr><br/><br/>';
        }
//########### CHANGE PASSWORD ##########
        if($action == "changepassword") {
                $new_password = trim($_POST['newpassword']);
                $new_password2 = trim($_POST['newpassword2']);
                $old_password = trim($_POST['oldpassword']);
                if(empty($new_password) && empty($new_password2) && empty($old_password)) {
                        $main_content .= 'Please enter your current password and a new password. For your security, please enter the new password twice.<br/><br/><form action="?subtopic=accountmanagement&action=changepassword" method="post" ><div class="TableContainer" ><table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" ><div class="CaptionInnerContainer" ><span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><div class="Text" >Change Password</div><span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td class="LabelV" ><span >New Password:</span></td><td style="width:90%;" ><input type="password" name="newpassword" size="30" maxlength="29" ></td></tr><tr><td class="LabelV" ><span >New Password Again:</span></td><td><input type="password" name="newpassword2" size="30" maxlength="29" ></td></tr><tr><td class="LabelV" ><span >Current Password:</span></td><td><input type="password" name="oldpassword" size="30" maxlength="29" ></td></tr></table>        </div>  </table></div></td></tr><br/><table style="width:100%;" ><tr align="center"><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                }
                else
                {
                        if(empty($new_password) || empty($new_password2) || empty($old_password)){
                                $show_msgs[] = "Please fill in form.";
                        }
                        if($new_password != $new_password2) {
                                $show_msgs[] = "The new passwords do not match!";
                        }
                        if(empty($show_msgs)) {
                                if(!check_password($new_password)) {
                                        $show_msgs[] = "New password contains illegal chars (a-z, A-Z and 0-9 only!) or lenght.";
                                }
                                $old_password = password_ency($old_password);
                                if($old_password != $account_logged->getPassword()) {
                                        $show_msgs[] = "Current password is incorrect!";
                                }
                        }
                        if(!empty($show_msgs)){
                                //show errors
                                $main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
                                foreach($show_msgs as $show_msg) {
                                        $main_content .= '<li>'.$show_msg;
                                }
                                $main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
                                //show form
                                $main_content .= 'Please enter your current password and a new password. For your security, please enter the new password twice.<br/><br/><form action="?subtopic=accountmanagement&action=changepassword" method="post" ><div class="TableContainer" ><table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" ><div class="CaptionInnerContainer" ><span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><div class="Text" >Change Password</div><span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td class="LabelV" ><span >New Password:</span></td><td style="width:90%;" ><input type="password" name="newpassword" size="30" maxlength="29" ></td></tr><tr><td class="LabelV" ><span >New Password Again:</span></td><td><input type="password" name="newpassword2" size="30" maxlength="29" ></td></tr><tr><td class="LabelV" ><span >Current Password:</span></td><td><input type="password" name="oldpassword" size="30" maxlength="29" ></td></tr></table>        </div>  </table></div></td></tr><br/><table style="width:100%;" ><tr align="center"><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                        }
                        else
                        {
                                $org_pass = $new_password;
                                $new_password = password_ency($new_password);
                                $account_logged->setPassword($new_password);
                                $account_logged->save();
                                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Password Changed</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>Your password has been changed.';
                                if($config['site']['send_emails'] && $config['site']['send_mail_when_change_password'])
                                {
                                        $mailBody = '<html>
                                        <body>
                                        <h3>Password to account changed!</h3>
                                        <p>You or someone else changed password to your account on server <a href="'.$config['server']['url'].'"><b>'.$config['server']['serverName'].'</b></a>.</p>
                                        <p>New password: <b>'.$org_pass.'</b></p>
                                        </body>
                                        </html>';
                                        require("phpmailer/class.phpmailer.php");
                                        $mail = new PHPMailer();
                                        if ($config['site']['smtp_enabled'] == "yes")
                                        {
                                                $mail->IsSMTP();
                                                $mail->Host = $config['site']['smtp_host'];
                                                $mail->Port = (int)$config['site']['smtp_port'];
                                                $mail->SMTPAuth = ($config['site']['smtp_auth'] ? true : false);
                                                $mail->Username = $config['site']['smtp_user'];
                                                $mail->Password = $config['site']['smtp_pass'];
                                        }
                                        else
                                                $mail->IsMail();
                                        $mail->IsHTML(true);
                                        $mail->From = $config['site']['mail_address'];
                                        $mail->AddAddress($account_logged->getEMail());
                                        $mail->Subject = $config['server']['serverName']." - Changed password";
                                        $mail->Body = $mailBody;
                                        if($mail->Send())
                                                $main_content .= '<br /><small>Your new password were send on email address <b>'.$account_logged->getEMail().'</b>.</small>';
                                        else
                                                $main_content .= '<br /><small>An error occorred while sending email with password!</small>';
                                }
                                $main_content .= '</td></tr>          </table>        </div>  </table></div></td></tr><br/><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                                $_SESSION['password'] = $new_password;
                        }
                }
        }

//############# CHANGE E-MAIL ###################
        if($action == "changeemail") {
        $account_email_new_time = $account_logged->getCustomField("email_new_time");
        if($account_email_new_time > 10) {$account_email_new = $account_logged->getCustomField("email_new"); }
        if($account_email_new_time < 10){
        if($_POST['changeemailsave'] == 1) {
                $account_email_new = trim($_POST['new_email']);
                $post_password = trim($_POST['password']);
                if(empty($account_email_new)) {
                        $change_email_errors[] = "Please enter your new email address.";
                }
                else
                {
                        if(!check_mail($account_email_new)) {
                                $change_email_errors[] = "E-mail address is not correct.";
                        }
                }
                if(empty($post_password)) {
                        $change_email_errors[] = "Please enter password to your account.";
                }
                else
                {
                        $post_password = password_ency($post_password);
                        if($post_password != $account_logged->getPassword()) {
                                $change_email_errors[] = "Wrong password to account.";
                        }
                }
                if(empty($change_email_errors)) {
                        $account_email_new_time = time() + $config['site']['email_days_to_change'] * 24 * 3600;
                        $account_logged->setCustomField("email_new", $account_email_new);
                        $account_logged->setCustomField("email_new_time", $account_email_new_time);
                        $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >New Email Address Requested</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>You have requested to change your email address to <b>'.$account_email_new.'</b>. The actual change will take place after <b>'.date("j F Y, G:i:s", $account_email_new_time).'</b>, during which you can cancel the request at any time.</td></tr>          </table>        </div>  </table></div></td></tr><br/><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                }
                else
                {
                        //show errors
                        $main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
                        foreach($change_email_errors as $change_email_error) {
                                $main_content .= '<li>'.$change_email_error;
                        }
                        $main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
                        //show form
                        $main_content .= 'Please enter your password and the new email address. Make sure that you enter a valid email address which you have access to. <b>For security reasons, the actual change will be finalised after a waiting period of '.$config['site']['email_days_to_change'].' days.</b><br/><br/><form action="?subtopic=accountmanagement&action=changeemail" method="post" ><div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Change Email Address</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ></tr><td class="LabelV" ><span >New Email Address:</span></td>  <td style="width:90%;" ><input name="new_email" value="'.$_POST['new_email'].'" size="30" maxlength="50" ></td><tr></tr><td class="LabelV" ><span >Password:</span></td>  <td><input type="password" name="password" size="30" maxlength="29" ></td></tr>          </table>        </div>  </table></div></td></tr><br/><table style="width:100%;" ><tr align="center"><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><input type="hidden" name=changeemailsave value=1 ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                }
        }
        else
        {
        $main_content .= 'Please enter your password and the new email address. Make sure that you enter a valid email address which you have access to. <b>For security reasons, the actual change will be finalised after a waiting period of '.$config['site']['email_days_to_change'].' days.</b><br/><br/><form action="?subtopic=accountmanagement&action=changeemail" method="post" ><div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Change Email Address</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ></tr><td class="LabelV" ><span >New Email Address:</span></td>  <td style="width:90%;" ><input name="new_email" value="'.$_POST['new_email'].'" size="30" maxlength="50" ></td><tr></tr><td class="LabelV" ><span >Password:</span></td>  <td><input type="password" name="password" size="30" maxlength="29" ></td></tr>          </table>        </div>  </table></div></td></tr><br/><table style="width:100%;" ><tr align="center"><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><input type="hidden" name=changeemailsave value=1 ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
        }
        }
        else
        {
                if($account_email_new_time < time()) {
                        if($_POST['changeemailsave'] == 1) {
                                $account_logged->setCustomField("email_new", "");
                                $account_logged->setCustomField("email_new_time", 0);
                                $account_logged->setEmail($account_email_new);
                                $account_logged->save();
                                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Email Address Change Accepted</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>You have accepted <b>'.$account_logged->getEmail().'</b> as your new email adress.</td></tr>          </table>        </div>  </table></div></td></tr><br/><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                        }
                        else
                        {
                                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Email Address Change Accepted</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>Do you accept <b>'.$account_email_new.'</b> as your new email adress?</td></tr>          </table>        </div>  </table></div></td></tr><br /><table width="100%"><tr><td width="30">&nbsp;</td><td align=left><form action="?subtopic=accountmanagement&action=changeemail" method="post"><input type="hidden" name="changeemailsave" value=1 ><INPUT TYPE=image NAME="I Agree" SRC="'.$layout_name.'/images/buttons/sbutton_iagree.gif" BORDER=0 WIDTH=120 HEIGHT=17></FORM></td><td align=left><form action="?subtopic=accountmanagement&action=changeemail" method="post"><input type="hidden" name="emailchangecancel" value=1 ><input type=image name="Cancel" src="'.$layout_name.'/images/buttons/sbutton_cancel.gif" BORDER=0 WIDTH=120 HEIGHT=17></form></td><td align=right><form action="?subtopic=accountmanagement" method="post" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form></td><td width="30">&nbsp;</td></tr></table>';
                        }
                }
                else
                {
                        $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Change of Email Address</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>A request has been submitted to change the email address of this account to <b>'.$account_email_new.'</b>.<br/>The actual change will take place on <b>'.date("j F Y, G:i:s", $account_email_new_time).'</b>.<br>If you do not want to change your email address, please click on "Cancel".</td></tr>          </table>        </div>  </table></div></td></tr><br/><table style="width:100%;" ><tr align="center"><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=changeemail" method="post" ><tr><td style="border:0px;" ><input type="hidden" name="emailchangecancel" value=1 ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Cancel" alt="Cancel" src="'.$layout_name.'/images/buttons/_sbutton_cancel.gif" ></div></div></td></tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                }
        }
        if($_POST['emailchangecancel'] == 1) {
                $account_logged->setCustomField("email_new", "");
                $account_logged->setCustomField("email_new_time", 0);
                $main_content = '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Email Address Change Cancelled</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>Your request to change the email address of your account has been cancelled. The email address will not be changed.</td></tr>          </table>        </div>  </table></div></td></tr><br/><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
        }
        }
       
//########### CHANGE PUBLIC INFORMATION (about account owner) ######################
        if($action == "changeinfo") {
                $new_rlname = htmlspecialchars(stripslashes(trim($_POST['info_rlname'])));
                $new_location = htmlspecialchars(stripslashes(trim($_POST['info_location'])));
                if($_POST['changeinfosave'] == 1) {
                //save data from form
                $account_logged->setRLName($new_rlname);
                $account_logged->setLocation($new_location);
                $account_logged->save();
                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Public Information Changed</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>Your public information has been changed.</td></tr>          </table>        </div>  </table></div></td></tr><br><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                }
                else
                {
                //show form
                        $account_rlname = $account_logged->getRLName();
                        $account_location = $account_logged->getLocation();
                        $main_content .= 'Here you can tell other players about yourself. This information will be displayed alongside the data of your characters. If you do not want to fill in a certain field, just leave it blank.<br/><br/><form action="?subtopic=accountmanagement&action=changeinfo" method=post><div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Change Public Information</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td class="LabelV" >Real Name:</td><td style="width:90%;" ><input name="info_rlname" value="'.$account_rlname.'" size="30" maxlength="50" ></td></tr><tr><td class="LabelV" >Location:</td><td><input name="info_location" value="'.$account_location.'" size="30" maxlength="50" ></td></tr></table>        </div>  </table></div></td></tr><br/><table width="100%"><tr align="center"><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><input type="hidden" name="changeinfosave" value="1" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                }
        }

//############## GENERATE RECOVERY KEY ###########
        if($action == "registeraccount")
        {
                $reg_password = password_ency(trim($_POST['reg_password']));
                $old_key = $account_logged->getRecoveryKey("key");
                if($_POST['registeraccountsave'] == "1")
                {
                        if($reg_password == $account_logged->getPassword())
                        {
                                if(empty($old_key))
                                {
                                        $dontshowtableagain = 1;
                                        $acceptedChars = 'ABCDEFGHIJKLMNPQRSTUVWXYZ123456789';
                                        $max = strlen($acceptedChars)-1;
                                        $new_rec_key = NULL;
                                        // 10 = number of chars in generated key
                                        for($i=0; $i < 10; $i++) {
                                                $cnum[$i] = $acceptedChars{mt_rand(0, $max)};
                                                $new_rec_key .= $cnum[$i];
                                        }
                                        $account_logged->setRecoveryKey($new_rec_key);
                                        $account_logged->save();
                                        $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Account Registered</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" >Thank you for registering your account! You can now recover your account if you have lost access to the assigned email address by using the following<br/><br/><font size="5">&nbsp;&nbsp;&nbsp;<b>Recovery Key: '.$new_rec_key.'</b></font><br/><br/><br/><b>Important:</b><ul><li>Write down this recovery key carefully.</li><li>Store it at a safe place!</li>';
                                        if($config['site']['send_emails'] && $config['site']['send_mail_when_generate_reckey'])
                                        {
                                                $mailBody = '<html>
                                                <body>
                                                <h3>New recovery key!</h3>
                                                <p>You or someone else generated recovery key to your account on server <a href="'.$config['server']['url'].'"><b>'.$config['server']['serverName'].'</b></a>.</p>
                                                <p>Recovery key: <b>'.$new_rec_key.'</b></p>
                                                </body>
                                                </html>';
                                                require("phpmailer/class.phpmailer.php");
                                                $mail = new PHPMailer();
                                                if ($config['site']['smtp_enabled'] == "yes")
                                                {
                                                        $mail->IsSMTP();
                                                        $mail->Host = $config['site']['smtp_host'];
                                                        $mail->Port = (int)$config['site']['smtp_port'];
                                                        $mail->SMTPAuth = ($config['site']['smtp_auth'] ? true : false);
                                                        $mail->Username = $config['site']['smtp_user'];
                                                        $mail->Password = $config['site']['smtp_pass'];
                                                }
                                                else
                                                        $mail->IsMail();
                                                $mail->IsHTML(true);
                                                $mail->From = $config['site']['mail_address'];
                                                $mail->AddAddress($account_logged->getEMail());
                                                $mail->Subject = $config['server']['serverName']." - recovery key";
                                                $mail->Body = $mailBody;
                                                if($mail->Send())
                                                        $main_content .= '<br /><small>Your recovery key were send on email address <b>'.$account_logged->getEMail().'</b>.</small>';
                                                else
                                                        $main_content .= '<br /><small>An error occorred while sending email with recovery key! You will not receive e-mail with this key.</small>';
                                        }
                                        $main_content .= '</ul>          </table>        </div>  </table></div></td></tr><br/><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                                }
                                else
                                        $reg_errors[] = 'Your account is already registred.';
                        }
                        else
                                $reg_errors[] = 'Wrong password to account.';
                }
                if($dontshowtableagain != 1)
                {
                        //show errors if not empty
                        if(!empty($reg_errors))
                        {
                                $main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
                                foreach($reg_errors as $reg_error)
                                        $main_content .= '<li>'.$reg_error;
                                $main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
                        }
                        //show form
                        $main_content .= 'To generate recovery key for your account please enter your password.<br/><br/><form action="?subtopic=accountmanagement&action=registeraccount" method="post" ><input type="hidden" name="registeraccountsave" value="1"><div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Generate recovery key</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td class="LabelV" ><span >Password:</td><td><input type="password" name="reg_password" size="30" maxlength="29" ></td></tr>          </table>        </div>  </table></div></td></tr><br/><table style="width:100%" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                }
        }

//############## GENERATE NEW RECOVERY KEY ###########
        if($action == "newreckey")
        {
                $reg_password = password_ency(trim($_POST['reg_password']));
                $reckey = $account_logged->getRecoveryKey();
                if((!$config['site']['generate_new_reckey'] || !$config['site']['send_emails']) || empty($reckey))
                        $main_content .= 'You cant get new rec key';
                else
                {
                        $points = $account_logged->getPremiumPoints();
                        if($_POST['registeraccountsave'] == "1")
                        {
                                if($reg_password == $account_logged->getPassword())
                                {
                                        if($points >= $config['site']['generate_new_reckey_price'])
                                        {
                                                        $dontshowtableagain = 1;
                                                        $acceptedChars = 'ABCDEFGHIJKLMNPQRSTUVWXYZ123456789';
                                                        $max = strlen($acceptedChars)-1;
                                                        $new_rec_key = NULL;
                                                        // 10 = number of chars in generated key
                                                        for($i=0; $i < 10; $i++) {
                                                                $cnum[$i] = $acceptedChars{mt_rand(0, $max)};
                                                                $new_rec_key .= $cnum[$i];
                                                        }
                                                        $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Account Registered</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><ul>';
                                                                $mailBody = '<html>
                                                                <body>
                                                                <h3>New recovery key!</h3>
                                                                <p>You or someone else generated recovery key to your account on server <a href="'.$config['server']['url'].'"><b>'.$config['server']['serverName'].'</b></a>.</p>
                                                                <p>Recovery key: <b>'.$new_rec_key.'</b></p>
                                                                </body>
                                                                </html>';
                                                                require("phpmailer/class.phpmailer.php");
                                                                $mail = new PHPMailer();
                                                                if ($config['site']['smtp_enabled'] == "yes")
                                                                {
                                                                        $mail->IsSMTP();
                                                                        $mail->Host = $config['site']['smtp_host'];
                                                                        $mail->Port = (int)$config['site']['smtp_port'];
                                                                        $mail->SMTPAuth = ($config['site']['smtp_auth'] ? true : false);
                                                                        $mail->Username = $config['site']['smtp_user'];
                                                                        $mail->Password = $config['site']['smtp_pass'];
                                                                }
                                                                else
                                                                        $mail->IsMail();
                                                                $mail->IsHTML(true);
                                                                $mail->From = $config['site']['mail_address'];
                                                                $mail->AddAddress($account_logged->getEMail());
                                                                $mail->Subject = $config['server']['serverName']." - new recovery key";
                                                                $mail->Body = $mailBody;
                                                                if($mail->Send())
                                                                {
                                                                        $account_logged->setRecoveryKey(new_rec_key);
                                                                        $account_logged->setPremiumPoints($account_logged->getPremiumPoints()-$config['site']['generate_new_reckey_price']);
                                                                        $account_logged->save();
                                                                        $main_content .= '<br />Your recovery key were send on email address <b>'.$account_logged->getEMail().'</b> for '.$config['site']['generate_new_reckey_price'].' premium points.';
                                                                }
                                                                else
                                                                        $main_content .= '<br />An error occorred while sending email ( <b>'.$account_logged->getEMail().'</b> ) with recovery key! Recovery key not changed. Try again.';
                                                        $main_content .= '</ul>          </table>        </div>  </table></div></td></tr><br/><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                                        }
                                        else
                                                $reg_errors[] = 'You need '.$config['site']['generate_new_reckey_price'].' premium points to generate new recovery key. You have <b>'.$points.'<b> premium points.';
                                }
                                else
                                        $reg_errors[] = 'Wrong password to account.';
                        }
                        if($dontshowtableagain != 1)
                        {
                                //show errors if not empty
                                if(!empty($reg_errors))
                                {
                                        $main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
                                        foreach($reg_errors as $reg_error)
                                                $main_content .= '<li>'.$reg_error;
                                        $main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
                                }
                                //show form
                                $main_content .= 'To generate NEW recovery key for your account please enter your password.<br/><font color="red"><b>New recovery key cost '.$config['site']['generate_new_reckey_price'].' Premium Points.</font> You have '.$points.' premium points. You will receive e-mail with this recovery key.</b><br/><form action="?subtopic=accountmanagement&action=newreckey" method="post" ><input type="hidden" name="registeraccountsave" value="1"><div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Generate recovery key</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td class="LabelV" ><span >Password:</td><td><input type="password" name="reg_password" size="30" maxlength="29" ></td></tr>          </table>        </div>  </table></div></td></tr><br/><table style="width:100%" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                        }
                }
        }

       
       
//###### CHANGE CHARACTER COMMENT ######
        if($action == "changecomment") {
                $player_name = stripslashes($_REQUEST['name']);
                $new_comment = htmlspecialchars(stripslashes(substr(trim($_POST['comment']),0,2000)));
                $new_hideacc = (int) $_POST['accountvisible'];
                if(check_name($player_name)) {
                        $player = $ots->createObject('Player');
                        $player->find($player_name);
                        if($player->isLoaded()) {
                                $player_account = $player->getAccount();
                                if($account_logged->getId() == $player_account->getId()) {
                                        if($_POST['changecommentsave'] == 1) {
						$player->setCustomField("hide_char", $new_hideacc);
						$player->setCustomField("comment", $new_comment);
                                                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Character Information Changed</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>The character information has been changed.</td></tr>          </table>        </div>  </table></div></td></tr><br><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                                        }
                                        else
                                        {
                                                $main_content .= 'Here you can see and edit the information about your character.<br/>If you do not want to specify a certain field, just leave it blank.<br/><br/><form action="?subtopic=accountmanagement&action=changecomment" method="post" ><div class="TableContainer" >  <table class="Table5" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Edit Character Information</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td><div class="TableShadowContainerRightTop" >  <div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div><div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" >  <div class="TableContentContainer" >    <table class="TableContent" width="100%" ><tr><td class="LabelV" >Name:</td><td style="width:80%;" >'.$player_name.'</td></tr><tr><td class="LabelV" >Hide Account:</td><td>';
                                                if($player->getHideChar() == 1) {
                                                        $main_content .= '<input type="checkbox" name="accountvisible"  value="1" checked="checked">';
                                                }
                                                else
                                                {
                                                        $main_content .= '<input type="checkbox" name="accountvisible"  value="1" >';
                                                }
                                                $main_content .= ' check to hide your account information</td></tr>    </table>  </div></div><div class="TableShadowContainer" >  <div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" >    <div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div>    <div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div>  </div></div></td></tr><tr><td><div class="TableShadowContainerRightTop" >  <div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div><div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" >  <div class="TableContentContainer" >    <table class="TableContent" width="100%" ><tr><td class="LabelV" ><span >Comment:</span></td><td style="width:80%;" ><textarea name="comment" rows="10" cols="50" wrap="virtual" >'.$player->getComment().'</textarea><br>[max. length: 2000 chars, 50 lines]</td></tr>    </table>  </div></div><div class="TableShadowContainer" >  <div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" ><div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div><div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div></div></div></td></tr></td></tr>          </table>        </div>  </table></div></td></tr><br/><table style="width:100%" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><input type="hidden" name="name" value="'.$player->getName().'"><input type="hidden" name="changecommentsave" value="1"><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                                        }
                                }
                                else
                                {
                                        $main_content .= "Error. Character <b>".$player_name."</b> is not on your account.";
                                }
                        }
                        else
                        {
                                $main_content .= "Error. Character with this name doesn't exist.";
                        }
                }
                else
                {
                        $main_content .= "Error. Name contain illegal characters.";
                }
        }

//### NEW NICK - set new nick proposition ###
        if($action == "newnick")
        {
                $name = $_GET['name'];
                $name_new = stripslashes(ucwords(strtolower(trim($_GET['name_new']))));
                if(!empty($name) && !empty($name_new))
                {
                        if(check_name_new_char($name_new))
                        {
                                $player = $ots->createObject('Player');
                                $player->find($name);
                                if($player->isLoaded() && $player->isNameLocked())
                                {
                                        $player_account = $player->getAccount();
                                        if($account_logged->getId() == $player_account->getId())
                                        {
                                                if(!$player->getOldName())
                                                        if(!$player->isOnline())
                                                        {
                                                                $player->setCustomField('old_name', $name_new);
                                                                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >New nick proposition</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>The character <b>'.$name.'</b> new nick proposition <b>'.$name_new.'</b> has been set. Now you must wait for acceptation from GM.</td></tr>          </table>        </div>  </table></div></td></tr>';
                                                        }
                                                        else
                                                                $main_content .= 'This character is online.';
                                                else
                                                        $main_content .= 'You already set new name for this character ( <b>'.$player->getOldName().'</b> ). You must wait until GM accept/reject your proposition.';
                                        }
                                        else
                                                $main_content .= 'Character <b>'.$player_name.'</b> is not on your account.';
                                }
                                else
                                        $main_content .= 'Character with this name doesn\'t exist or isn\'t name locked.';
                        }
                        else
                                $main_content .= 'Name contain illegal characters. Invalid format or lenght.';
                }
                else
                        $main_content .= 'Please enter new char name.';
                $main_content .= '<br><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
        }

//### DELETE character from account ###
        if($action == "deletecharacter") {
                $player_name = stripslashes(trim($_POST['delete_name']));
                $password_verify = trim($_POST['delete_password']);
                $password_verify = password_ency($password_verify);
                if($_POST['deletecharactersave'] == 1) {
                        if(!empty($player_name) && !empty($password_verify)) {
                                if(check_name($player_name)) {
                                        $player = $ots->createObject('Player');
                                        $player->find($player_name);
                                        if($player->isLoaded()) {
                                                $player_account = $player->getAccount();
                                                if($account_logged->getId() == $player_account->getId()) {
                                                        if($password_verify == $account_logged->getPassword()) {
                                                                if(!$player->isOnline())
                                                                {
                                                                //dont show table "delete character" again
                                                                $dontshowtableagain = 1;
                                                                //delete player
                                                                $player->setCustomField('deleted', 1);
                                                                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Character Deleted</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>The character <b>'.$player_name.'</b> has been deleted.</td></tr>          </table>        </div>  </table></div></td></tr><br><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                                                                }
                                                                else
                                                                        $delete_errors[] = 'This character is online.';
                                                        }
                                                        else
                                                        {
                                                                $delete_errors[] = 'Wrong password to account.';
                                                        }
                                                }
                                                else
                                                {
                                                        $delete_errors[] = 'Character <b>'.$player_name.'</b> is not on your account.';
                                                }
                                        }
                                        else
                                        {
                                                $delete_errors[] = 'Character with this name doesn\'t exist.';
                                        }
                                }
                                else
                                {
                                        $delete_errors[] = 'Name contain illegal characters.';
                                }
                        }
                        else
                        {
                        $delete_errors[] = 'Character name or/and password is empty. Please fill in form.';
                        }
                }
                if($dontshowtableagain != 1) {
                        if(!empty($delete_errors)) {
                                $main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
                                foreach($delete_errors as $delete_error) {
                                                $main_content .= '<li>'.$delete_error;
                                }
                                $main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
                        }
                        $main_content .= 'To delete a character enter the name of the character and your password.<br/><br/><form action="?subtopic=accountmanagement&action=deletecharacter" method="post" ><input type="hidden" name="deletecharactersave" value="1"><div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Delete Character</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td class="LabelV" ><span >Character Name:</td><td style="width:90%;" ><input name="delete_name" value="" size="30" maxlength="29" ></td></tr><tr><td class="LabelV" ><span >Password:</td><td><input type="password" name="delete_password" size="30" maxlength="29" ></td></tr>          </table>        </div>  </table></div></td></tr><br/><table style="width:100%" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                }
        }

       
//### UNDELETE character from account ###
        if($action == "undelete")
        {
                $player_name = stripslashes(trim($_GET['name']));
                if(!empty($player_name))
                {
                        if(check_name($player_name))
                        {
                                $player = $ots->createObject('Player');
                                $player->find($player_name);
                                if($player->isLoaded())
                                {
                                        $player_account = $player->getAccount();
                                        if($account_logged->getId() == $player_account->getId())
                                        {
                                                if(!$player->isOnline())
                                                {
                                                $player->setCustomField('deleted', 0);
                                                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Character Undeleted</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>The character <b>'.$player_name.'</b> has been undeleted.</td></tr>          </table>        </div>  </table></div></td></tr><br><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                                                }
                                                else
                                                        $delete_errors[] = 'This character is online.';
                                        }
                                        else
                                                $delete_errors[] = 'Character <b>'.$player_name.'</b> is not on your account.';
                                }
                                else
                                        $delete_errors[] = 'Character with this name doesn\'t exist.';
                        }
                        else
                                $delete_errors[] = 'Name contain illegal characters.';
                }
        }

//## Character World Transfer by Norix###
        if($config['site']['worldtransfer'] == 1) {
        if($action == "charactertransfer") {
                if(empty($_REQUEST['page'])) { $color1 = 'blue'; $color2 = 'green-blue'; $color3 = 'blue'; $color4 = 'blue'; $color5 = 'blue'; }
                if($_REQUEST['page'] == 'confirm') { $color1 = 'blue'; $color2 = 'green'; $color3 = 'green'; $color4 = 'green-blue'; $color5 = 'blue'; }
                if($_REQUEST['page'] == 'transfer') { $color1 = 'green'; $color2 = 'green'; $color3 = 'green'; $color4 = 'green'; $color5 = 'green'; }
                $main_content .= '<div id="ProgressBar" > <center><h2>Character World Transfer</h2></center><div id="MainContainer" ><div id="BackgroundContainer" ><img id="BackgroundContainerLeftEnd" src="images/worldtrade/stonebar-left-end.gif" /><div id="BackgroundContainerCenter">
                        <div id="BackgroundContainerCenterImage" style="background-image:url(images/worldtrade/stonebar-center.gif);" /></div></div><img id="BackgroundContainerRightEnd" src="images/worldtrade/stonebar-right-end.gif" /></div>
                        <img id="TubeLeftEnd" src="images/worldtrade/progress-bar-tube-left-green.gif" /><img id="TubeRightEnd" src="images/worldtrade/progress-bar-tube-right-'.$color1.'.gif" /><div id="FirstStep" class="Steps" ><div class="SingleStepContainer" >
                        <img class="StepIcon" src="images/worldtrade/progress-bar-icon-0-green.gif" /><div class="StepText" style="font-weight:bold;" >Select World</div></div></div><div id="StepsContainer1" ><div id="StepsContainer2" ><div class="Steps" style="width:50%" >
                        <div class="TubeContainer" ><img class="Tube" src="images/worldtrade/progress-bar-tube-'.$color2.'.gif" /></div><div class="SingleStepContainer" ><img class="StepIcon" src="images/worldtrade/progress-bar-icon-3-'.$color3.'.gif" /><div class="StepText" style="font-weight:normal;" >Confirm Data</div>
                        </div></div><div class="Steps" style="width:50%" ><div class="TubeContainer" ><img class="Tube" src="images/worldtrade/progress-bar-tube-'.$color4.'.gif" /></div><div class="SingleStepContainer" ><img class="StepIcon" src="images/worldtrade/progress-bar-icon-4-'.$color5.'.gif" />
                        <div class="StepText" style="font-weight:normal;" >Transfer Result</div></div></div></div></div></div></div>';
                $user_premium_points = $account_logged->getCustomField('premium_points');
                $playerid = stripslashes(trim($_REQUEST['player_id']));
                $world_id = stripslashes(trim($_REQUEST['new_world']));
                if(empty($_REQUEST['page'])) {
                        $player = $ots->createObject('Player');
                        $player->load($playerid);
                        $time = time();
                        $maxtranstime = ($config['site']['transfermonths']*30*24*60*60);
                        if(!empty($playerid)) {
                                $worldid = (int) $_REQUEST['newworld_'.$player->getId().''];
                                $house = $SQL->query('SELECT * FROM houses WHERE owner = '.$player->GetId().';')->fetch();
                                $transfertime = ($time-$player->getCustomField('worldtransfer'));
                                if($maxtranstime > $transfertime AND $player->getCustomField('worldtransfer') > 0) $time_img = no; else $time_img = yes;
                                if($house) $house_img = no; else $house_img = yes;
                                if($player->getVocation() < 1) $voc_img = no; else $voc_img = yes;
                                if($player->getMarriage() > 1) $mar_img = no; else $mar_img = yes;
                                if($user_premium_points < $config['site']['worldtransferprice']) $points_img = no; else $points_img = yes;
                                $main_content .= 'In order to transfer your character to another game world, you have to fulfil the following requirements:<br/><ul>
                                        <li style="list-style-image:url(images/worldtrade/'.$mar_img.'.gif)" >You must divorce your spouse first.</li>
                                        <li style="list-style-image:url(images/worldtrade/'.$house_img.'.gif)" >Character owns no house.</li>
                                        <li style="list-style-image:url(images/worldtrade/'.$voc_img.'.gif)" >Character has a vocation.</li>
                                        <li style="list-style-image:url(images/worldtrade/'.$time_img.'.gif)" >Have not done Character World Transfer the last '.$config['site']['transfermonths'].' months.</li>
                                        <li style="list-style-image:url(images/worldtrade/'.$points_img.'.gif)" >Have atleast '.$config['site']['worldtransferprice'].' premium points on your account.</li></ul>';
                        }
                        $main_content .= '<form action="" method="post"><input type="hidden" name="player_id" value="'.$playerid.'"/><div class="TableContainer" ><table class="Table3" cellpadding="0" cellspacing="0" ><div class="CaptionContainer" ><div class="CaptionInnerContainer" ><span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>
                                <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><div class="Text" >Character Data</div>
                                <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>
                                <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div></div><tr><td><div class="InnerTableContainer" ><table style="width:100%;" ><tr><td><div class="TableShadowContainerRightTop" ><div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div>
                                <div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" ><div class="TableContentContainer" ><table class="TableContent" width="100%" ><tr class="LabelH" style="background-color:#D4C0A1;" ><td></td><td>Name</td><td>Current World</td><td>Possible Target World</td><td>Requirement Status</td></tr>';
                        $account_players = $account_logged->getPlayersList();
                        $account_players->orderBy('name');
                        foreach($account_players as $account_player) {
                                if($account_player->getId() == $playerid) { $border = 'border-style: solid; border-color: #D4C0A1; border-width: 2px;'; $checked = ' checked=checked'; } else { $border = ''; $checked = ''; }
                                $main_content .= '<tr style="background-color:#F1E0C6;'.$border.'" ><td><input type="radio" name="player_id" value="'.$account_player->getId().'" '.$checked.' onClick="this.form.submit()"/></td><td>'.$account_player->getName().'</td><td>'.$config['site']['worlds'][$account_player->getWorld()].'</td><td><select name="newworld_'.$account_player->getId().'"><option value="" >(select your target game world)</option>';
                                foreach($config['site']['worlds'] as $id => $world_n) {
                                        if($account_player->getWorld() != $id) {
                                                $main_content .= '<option value="'.$id.'" onClick="this.form.submit()"';
                                                if($id == $worldid AND $playerid == $account_player->getId())
                                                $main_content .= ' selected="selected"';
                                                $main_content .= '>'.$world_n.'</option>';
                                        }
                                }
                                $main_content .= '</select>';
                                $house = $SQL->query('SELECT * FROM houses WHERE owner = '.$account_player->GetId().';')->fetch();
                                $transfertime = ($time-$account_player->getCustomField('worldtransfer'));
                                if(!$house AND $account_player->getVocation() >= 1 AND $account_player->getMarriage() <= 0 AND $user_premium_points >= $config['site']['worldtransferprice'] AND $transfertime >= $maxtranstime)
                                        $status = '<span class="green" >allowed</span>'; else $status = '<span class="red" >not allowed</span>';
                                $main_content .= '</td><td><b>'.$status.'</b></td></tr>';
                        }
                        $main_content .= '</form><form action="?subtopic=accountmanagement&action=charactertransfer&page=confirm" method="post" ><input type="hidden" name="new_world" value="'.$worldid.'"/><input type="hidden" name="player_id" value="'.$playerid.'"/></table></div></div><div class="TableShadowContainer" ><div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" >
                                <div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div><div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div></div></div></td></tr></table></div></table></div></td></tr><br/><table style="width:100%;" ><tr align="center" ><td width=50%>';
                        if(!empty($playerid))
                        $transfertime = ($time-$player->getCustomField('worldtransfer'));
                        if(!empty($playerid))
                        if(!$house AND $player->getVocation() >= 1 AND $player->getMarriage() <= 0 AND $user_premium_points >= $config['site']['worldtransferprice'] AND $transfertime >= $maxtranstime)
                       
                                $main_content .= '<div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div>';
                                $main_content .= '</form></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div>
                                <input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                }
                if ($_REQUEST['page'] == 'confirm') {
                        $player = $ots->createObject('Player');
                        $player->load($playerid);
                        $main_content .= '<form action="?subtopic=accountmanagement&action=charactertransfer&page=transfer" method="post" ><div class="TableContainer" ><table class="Table4" cellpadding="0" cellspacing="0" ><div class="CaptionContainer" ><div class="CaptionInnerContainer" ><span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>
                                <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>
                                <div class="Text" >Character Data</div><span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>
                                <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div></div><tr><td><div class="InnerTableContainer" ><table style="width:100%;" ><tr><td><tr><td><div class="TableShadowContainerRightTop" ><div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div>
                                <div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" ><div class="TableContentContainer" ><table class="TableContent" width="100%" ><tr><td colspan="2" >Do you really want to transfer your character <b>'.$player->getName().'</b>:<br/></td></tr><tr><td class="LabelV" width="150" >Current World:</td>
                                <td>'.$config['site']['worlds'][$player->getWorld()].'</td></tr><tr><td class="LabelV" >Target World:</td><td>'.$config['site']['worlds'][$world_id].'</td></tr></table></div></div><div class="TableShadowContainer" >  <div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" ><div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div>
                                <div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div></div></div></td></tr><tr><td><div class="TableShadowContainerRightTop" ><div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div><div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" >
                                <div class="TableContentContainer" ><table class="TableContent" width="100%" ><tr><td><b><span class="red" >Attention:</span></b><br/>If your character is successfully transferred to another game world, you cannot transfer it again within the next '.$config['site']['transfermonths'].' months !</td></tr></table></div></div><div class="TableShadowContainer" ><div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" >
                                <div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div><div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div></div></div></td></tr></td></tr></table></div></table></div></td></tr><br/><table style="width:100%;" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" >
                                <input type="hidden" name="player_id" value="'.$playerid.'" ><input type="hidden" name="new_world" value="'.$world_id.'" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div>
                                <input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td></tr></form></table><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement&action=charactertransfer" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" >
                                <div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></td></tr></table><div></div>';
                }
                if ($_REQUEST['page'] == 'transfer') {
                        $SQL->query('UPDATE `players` SET `world_id` = '.$world_id.', `worldtransfer` = '.$SQL->quote(time()).' WHERE `id` = '.$playerid.';');
                        $account_logged->setPremiumPoints($user_premium_points-$config['site']['worldtransferprice']);
                        $account_logged->save();
                        $main_content .= '<form action="?subtopic=accountmanagement&action=charactertransfer" method="post" ><div class="TableContainer" ><table class="Table4" cellpadding="0" cellspacing="0" ><div class="CaptionContainer" ><div class="CaptionInnerContainer" ><span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>
                                <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>
                                <div class="Text" >Character Data</div><span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>
                                <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div></div><tr><td><div class="InnerTableContainer" ><table style="width:100%;" ><tr><td><tr><td><div class="TableShadowContainerRightTop" >
                                <div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div><div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" ><div class="TableContentContainer" ><table class="TableContent" width="100%" ><tr><td colspan="2" >
                                <center><b>Character World Transfer successfully done.</b></td></tr></table></div></div><div class="TableShadowContainer" >  <div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" ><div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div>
                                <div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div></div></div></td></tr><tr><td><div class="TableShadowContainerRightTop" ><div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div>
                                <div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" ><div class="TableContentContainer" ><table class="TableContent" width="100%" ><tr><td><b><span class="red" >Attention:</span></b><br/>If your character is successfully transferred to another game world, you cannot transfer it again within the next '.$config['site']['transfermonths'].' months!</td></tr>
                                </table></div></div><div class="TableShadowContainer" ><div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bm.gif);" ><div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-bl.gif);" ></div><div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-br.gif);" ></div>
                                </div></div></td></tr></td></tr></table></div></table></div></td></tr><br/><table style="width:100%;" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" >
                                <div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table><div></div>';
                }
        }
        } else {
        $main_content .= '<br><center><b>Sorry, the World Transfer System is currently disabled by the admin. Please ask him for more information.</b></center>';
        }

//## CREATE CHARACTER on account ###
        if($action == "createcharacter")
        {
                if(count($config['site']['worlds']) > 1)
                {
                        if(isset($_REQUEST['world']))
                                $world_id = (int) $_REQUEST['world'];
                }
                else
                        $world_id = 0;
                if(!isset($world_id))
                {
                        $main_content .= 'Before you can create character you must select world: ';
                        foreach($config['site']['worlds'] as $id => $world_n)
                                $main_content .= '<br /><a href="?subtopic=accountmanagement&action=createcharacter&world='.$id.'">- '.$world_n.'</a>';
                        $main_content .= '<br /><h3><a href="?subtopic=accountmanagement">BACK</a></h3>';
                }
                else
                {
                        $main_content .= '<script type="text/javascript">
                        var nameHttp;

function checkName()
{
                if(document.getElementById("newcharname").value=="")
                {
                        document.getElementById("name_check").innerHTML = \'<b><font color="red">Please enter new character name.</font></b>\';
                        return;
                }
                nameHttp=GetXmlHttpObject();
                if (nameHttp==null)
                {
                        return;
                }
                var newcharname = document.getElementById("newcharname").value;
                var url="ajax/check_name.php?name=" + newcharname + "&uid="+Math.random();
                nameHttp.onreadystatechange=NameStateChanged;
                nameHttp.open("GET",url,true);
                nameHttp.send(null);
}

function NameStateChanged()
{
                if (nameHttp.readyState==4)
                {
                        document.getElementById("name_check").innerHTML=nameHttp.responseText;
                }
}
</script>';
                        $newchar_name = stripslashes(ucwords(strtolower(trim($_POST['newcharname']))));
                        $newchar_sex = $_POST['newcharsex'];
                        $newchar_vocation = $_POST['newcharvocation'];
                        $newchar_town = $_POST['newchartown'];
                        if($_POST['savecharacter'] != 1)
                        {
                                $main_content .= 'Please choose a name';
                                if(count($config['site']['newchar_vocations'][$world_id]) > 1)
                                        $main_content .= ', vocation';
                                $main_content .= ' and sex for your character. <br/>In any case the name must not violate the naming conventions stated in the <a href="?subtopic=tibiarules" target="_blank" >'.$config['server']['serverName'].' Rules</a>, or your character might get deleted or name locked.';
                                if($account_logged->getPlayersList()->count() >= $config['site']['max_players_per_account'])
                                        $main_content .= '<b><font color="red"> You have maximum number of characters per account on your account. Delete one before you make new.</font></b>';
                                $main_content .= '<br/><br/><form action="?subtopic=accountmanagement&action=createcharacter" method="post" ><input type="hidden" name="world" value="'.$world_id.'" ><input type="hidden" name=savecharacter value="1" ><div class="TableContainer" >  <table class="Table3" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" ><span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><div class="Text" >Create Character</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div>    </div><tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td><div class="TableShadowContainerRightTop" >  <div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div><div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" >  <div class="TableContentContainer" ><table class="TableContent" width="100%" ><tr class="LabelH" ><td style="width:50%;" ><span >Name</td><td><span >Sex</td></tr><tr class="Odd" ><td><input id="newcharname" name="newcharname" onkeyup="checkName();" value="'.$newchar_name.'" size="30" maxlength="29" ><BR><font size="1" face="verdana,arial,helvetica"><div id="name_check">Please enter your character name.</div></font></td><td>';
                                $main_content .= '<input type="radio" name="newcharsex" value="1" ';
                                if($newchar_sex == 1)
                                        $main_content .= 'checked="checked" ';
                                $main_content .= '>male<br/>';
                                $main_content .= '<input type="radio" name="newcharsex" value="0" ';
                                if($newchar_sex == "0")
                                        $main_content .= 'checked="checked" ';
                                $main_content .= '>female<br/></td></tr></table></div></div></table></div>';
                                if(count($config['site']['newchar_towns'][$world_id]) > 1 || count($config['site']['newchar_vocations'][$world_id]) > 1)
                                        $main_content .= '<div class="InnerTableContainer" >          <table style="width:100%;" ><tr>';
                                if(count($config['site']['newchar_vocations'][$world_id]) > 1)
                                {
                                        $main_content .= '<td><table class="TableContent" width="100%" ><tr class="Odd" valign="top"><td width="160"><br /><b>Select your vocation:</b></td><td><table class="TableContent" width="100%" >';
                                        foreach($config['site']['newchar_vocations'][$world_id] as $char_vocation_key => $sample_char)
                                        {
                                                $main_content .= '<tr><td><input type="radio" name="newcharvocation" value="'.$char_vocation_key.'" ';
                                                if($newchar_vocation == $char_vocation_key)
                                                        $main_content .= 'checked="checked" ';
                                                $main_content .= '>'.$vocation_name[$world_id][0][$char_vocation_key].'</td></tr>';
                                        }
                                        $main_content .= '</table></table></td>';
                                }
                                if(count($config['site']['newchar_towns'][$world_id]) > 1)
                                {
                                        $main_content .= '<td><table class="TableContent" width="100%" ><tr class="Odd" valign="top"><td width="160"><br /><b>Select your city:</b></td><td><table class="TableContent" width="100%" >';
                                        foreach($config['site']['newchar_towns'][$world_id] as $town_id)
                                        {
                                                $main_content .= '<tr><td><input type="radio" name="newchartown" value="'.$town_id.'" ';
                                                if($newchar_town == $town_id)
                                                        $main_content .= 'checked="checked" ';
                                                $main_content .= '>'.$towns_list[$world_id][$town_id].'</td></tr>';
                                        }
                                        $main_content .= '</table></table></td>';
                                }
                                if(count($config['site']['newchar_towns'][$world_id]) > 1 || count($config['site']['newchar_vocations'][$world_id]) > 1)
                                        $main_content .= '</tr></table></div>';
                                $main_content .= '</table></div></td></tr><br/><table style="width:100%;" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                        }
                        else
                        {      
                                if(empty($newchar_name))
                                        $newchar_errors[] = 'Please enter a name for your character!';
                                if(empty($newchar_sex) && $newchar_sex != "0")
                                        $newchar_errors[] = 'Please select the sex for your character!';
                                if(count($config['site']['newchar_vocations'][$world_id]) > 1)
                                {
                                        if(empty($newchar_vocation))
                                                $newchar_errors[] = 'Please select a vocation for your character.';
                                }
                                else
                                        $newchar_vocation = $config['site']['newchar_vocations'][$world_id][0];
                                if(count($config['site']['newchar_towns'][$world_id]) > 1)
                                {
                                        if(empty($newchar_town))
                                                $newchar_errors[] = 'Please select a town for your character.';
                                }
                                else
                                        $newchar_town = $config['site']['newchar_towns'][$world_id][0];
                                if(empty($newchar_errors))
                                {
                                        if(!check_name_new_char($newchar_name))
                                                $newchar_errors[] = 'This name contains invalid letters, words or format. Please use only a-Z, - , \' and space.';
                                        if($newchar_sex != 1 && $newchar_sex != "0")
                                                $newchar_errors[] = 'Sex must be equal <b>0 (female)</b> or <b>1 (male)</b>.';
                                        if(!in_array($newchar_town, $config['site']['newchar_towns'][$world_id]))
                                                $newchar_errors[] = 'Please select valid town.';
                                        if(count($config['site']['newchar_vocations'][$world_id]) > 1)
                                        {
                                                $newchar_vocation_check = FALSE;
                                                foreach($config['site']['newchar_vocations'][$world_id] as $char_vocation_key => $sample_char)
                                                        if($newchar_vocation == $char_vocation_key)
                                                                $newchar_vocation_check = TRUE;
                                                if(!$newchar_vocation_check)
                                                        $newchar_errors[] = 'Unknown vocation. Please fill in form again.';
                                        }
                                        else
                                                $newchar_vocation = 0;
                                }
                                if(empty($newchar_errors))
                                {
                                        $check_name_in_database = $ots->createObject('Player');
                                        $check_name_in_database->find($newchar_name);
                                        if($check_name_in_database->isLoaded())
                                                $newchar_errors[] .= 'This name is already used. Please choose another name!';
                                        $number_of_players_on_account = $account_logged->getPlayersList()->count();
                                        if($number_of_players_on_account >= $config['site']['max_players_per_account'])
                                                $newchar_errors[] .= 'You have too many characters on your account <b>('.$number_of_players_on_account.'/'.$config['site']['max_players_per_account'].')</b>!';
                                }
                                if(empty($newchar_errors))
                                {
                                        $char_to_copy_name = $config['site']['newchar_vocations'][$world_id][$newchar_vocation];
                                        $char_to_copy = new OTS_Player();
                                        $char_to_copy->find($char_to_copy_name);
                                        if(!$char_to_copy->isLoaded())
                                                $newchar_errors[] .= 'Wrong characters configuration. Try again or contact with admin. ADMIN: Edit file config/config.php and set valid characters to copy names. Character to copy'.$char_to_copy_name.'</b> doesn\'t exist.';
                                }
                                if(empty($newchar_errors))
                                {
                                        if($newchar_sex == "0")
                                                $char_to_copy->setLookType(136);
                                        $player = $ots->createObject('Player');
                                    $player->setName($newchar_name);
                                    $player->setAccount($account_logged);
                                    $player->setGroup($char_to_copy->getGroup());
                                    $player->setSex($newchar_sex);
                                    $player->setVocation($char_to_copy->getVocation());
                                    $player->setConditions($char_to_copy->getConditions());
                                    $player->setRank($char_to_copy->getRank());
                                    $player->setLookAddons($char_to_copy->getLookAddons());
                                    $player->setTownId($newchar_town);
                                    $player->setExperience($char_to_copy->getExperience());
                                    $player->setLevel($char_to_copy->getLevel());
                                    $player->setMagLevel($char_to_copy->getMagLevel());
                                    $player->setHealth($char_to_copy->getHealth());
                                    $player->setHealthMax($char_to_copy->getHealthMax());
                                    $player->setMana($char_to_copy->getMana());
                                    $player->setManaMax($char_to_copy->getManaMax());
                                    $player->setManaSpent($char_to_copy->getManaSpent());
                                    $player->setSoul($char_to_copy->getSoul());
                                    $player->setDirection($char_to_copy->getDirection());
                                    $player->setLookBody($char_to_copy->getLookBody());
                                    $player->setLookFeet($char_to_copy->getLookFeet());
                                    $player->setLookHead($char_to_copy->getLookHead());
                                    $player->setLookLegs($char_to_copy->getLookLegs());
                                    $player->setLookType($char_to_copy->getLookType());
                                    $player->setCap($char_to_copy->getCap());
                                        $player->setPosX(600);
                                        $player->setPosY(1149);
                                        $player->setPosZ(7);
                                    $player->setLossExperience($char_to_copy->getLossExperience());
                                    $player->setLossMana($char_to_copy->getLossMana());
                                    $player->setLossSkills($char_to_copy->getLossSkills());
                                        $player->setLossItems($char_to_copy->getLossItems());
                                        $player->save();
                                        unset($player);
                                        $player = $ots->createObject('Player');
                                        $player->find($newchar_name);
                                        if($player->isLoaded())
                                        {
						$player->setCustomField('world_id', (int) $world_id);
                                                $player->setSkill(0,$char_to_copy->getSkill(0));
                                                $player->setSkill(1,$char_to_copy->getSkill(1));
                                                $player->setSkill(2,$char_to_copy->getSkill(2));
                                                $player->setSkill(3,$char_to_copy->getSkill(3));
                                                $player->setSkill(4,$char_to_copy->getSkill(4));
                                                $player->setSkill(5,$char_to_copy->getSkill(5));
                                                $player->setSkill(6,$char_to_copy->getSkill(6));
                                                $player->save();
                                                $loaded_items_to_copy = $SQL->query("SELECT * FROM player_items WHERE player_id = ".$char_to_copy->getId()."");
                                                foreach($loaded_items_to_copy as $save_item)
                                                        $SQL->query("INSERT INTO `player_items` (`player_id` ,`pid` ,`sid` ,`itemtype`, `count`, `attributes`) VALUES ('".$player->getId()."', '".$save_item['pid']."', '".$save_item['sid']."', '".$save_item['itemtype']."', '".$save_item['count']."', '".$save_item['attributes']."');");
                                                $main_content .= '<div class="TableContainer" >  <table class="Table1" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" >        <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <div class="Text" >Character Created</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span>        <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span>        <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>        <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span>      </div>    </div>    <tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td>The character <b>'.$newchar_name.'</b> has been created.<br/>Please select the outfit when you log in for the first time.<br/><br/><b>See you on '.$config['server']['serverName'].'!</b></td></tr>          </table>        </div>  </table></div></td></tr><br/><center><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></center>';
                                        }
                                        else
                                        {
                                                echo "Error. Can\'t create character. Probably problem with database. Try again or contact with admin.";
                                                exit;
                                        }
                                }
                                else
                                {
                                        $main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
                                        foreach($newchar_errors as $newchar_error)
                                                $main_content .= '<li>'.$newchar_error;
                                        $main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
                                        $main_content .= 'Please choose a name';
                                        if(count($config['site']['newchar_vocations'][$world_id]) > 1)
                                                $main_content .= ', vocation';
                                        $main_content .= ' and sex for your character. <br/>In any case the name must not violate the naming conventions stated in the <a href="?subtopic=tibiarules" target="_blank" >'.$config['server']['serverName'].' Rules</a>, or your character might get deleted or name locked.<br/><br/><form action="?subtopic=accountmanagement&action=createcharacter" method="post" ><input type="hidden" name="world" value="'.$world_id.'" ><input type="hidden" name=savecharacter value="1" ><div class="TableContainer" >  <table class="Table3" cellpadding="0" cellspacing="0" >    <div class="CaptionContainer" >      <div class="CaptionInnerContainer" ><span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><div class="Text" >Create Character</div>        <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span><span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span><span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span><span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span></div>    </div><tr>      <td>        <div class="InnerTableContainer" >          <table style="width:100%;" ><tr><td><div class="TableShadowContainerRightTop" >  <div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/content/table-shadow-rt.gif);" ></div></div><div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/content/table-shadow-rm.gif);" >  <div class="TableContentContainer" ><table class="TableContent" width="100%" ><tr class="LabelH" ><td style="width:50%;" ><span >Name</td><td><span >Sex</td></tr><tr class="Odd" ><td><input id="newcharname" name="newcharname" onkeyup="checkName();" value="'.$newchar_name.'" size="30" maxlength="29" ><BR><font size="1" face="verdana,arial,helvetica"><div id="name_check">Please enter your character name.</div></font></td><td>';
                                        $main_content .= '<input type="radio" name="newcharsex" value="1" ';
                                        if($newchar_sex == 1)
                                                $main_content .= 'checked="checked" ';
                                        $main_content .= '>male<br/>';
                                        $main_content .= '<input type="radio" name="newcharsex" value="0" ';
                                        if($newchar_sex == "0")
                                                $main_content .= 'checked="checked" ';
                                        $main_content .= '>female<br/></td></tr></table></div></div></table></div>';
                                        if(count($config['site']['newchar_towns'][$world_id]) > 1 || count($config['site']['newchar_vocations'][$world_id]) > 1)
                                                $main_content .= '<div class="InnerTableContainer" >          <table style="width:100%;" ><tr>';
                                        if(count($config['site']['newchar_vocations'][$world_id]) > 1)
                                        {
                                                $main_content .= '<td><table class="TableContent" width="100%" ><tr class="Odd" valign="top"><td width="160"><br /><b>Select your vocation:</b></td><td><table class="TableContent" width="100%" >';
                                                foreach($config['site']['newchar_vocations'][$world_id] as $char_vocation_key => $sample_char)
                                                {
                                                        $main_content .= '<tr><td><input type="radio" name="newcharvocation" value="'.$char_vocation_key.'" ';
                                                        if($newchar_vocation == $char_vocation_key)
                                                                $main_content .= 'checked="checked" ';
                                                        $main_content .= '>'.$vocation_name[$world_id][0][$char_vocation_key].'</td></tr>';
                                                }
                                                $main_content .= '</table></table></td>';
                                        }
                                        if(count($config['site']['newchar_towns'][$world_id]) > 1)
                                        {
                                                $main_content .= '<td><table class="TableContent" width="100%" ><tr class="Odd" valign="top"><td width="160"><br /><b>Select your city:</b></td><td><table class="TableContent" width="100%" >';
                                                foreach($config['site']['newchar_towns'][$world_id] as $town_id)
                                                {
                                                        $main_content .= '<tr><td><input type="radio" name="newchartown" value="'.$town_id.'" ';
                                                        if($newchar_town == $town_id)
                                                                $main_content .= 'checked="checked" ';
                                                        $main_content .= '>'.$towns_list[$world_id][$town_id].'</td></tr>';
                                                }
                                                $main_content .= '</table></table></td>';
                                        }
                                        if(count($config['site']['newchar_towns'][$world_id]) > 1 || count($config['site']['newchar_vocations'][$world_id]) > 1)
                                                $main_content .= '</tr></table></div>';
                                        $main_content .= '</table></div></td></tr><br/><table style="width:100%;" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=accountmanagement" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></td></tr></form></table></td></tr></table>';
                                }
                        }
                }
        }
}
?>
