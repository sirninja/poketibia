   <?PHP
    $main_content .= '<form method="post" action=""><table>';
    if(count($config['site']['worlds']) > 1)
    {
        if(isset($_POST['world']) and is_numeric($_POST['world']))
        {
            $wid = (int) $_POST['world'];
            $wid = '<option value='.$wid.'>'.$config['site']['worlds'][$wid].'</option>';
        }
        $select_w .= '<tr><td>Select World:</td><td><select name="world" onchange="submit()">'.$wid.'';
        $i=1;
        foreach($config['site']['worlds'] as $id => $world_n)
        {
            if($_POST['world'] != $id)
            {
                $worlds[$i] .= '<option value="'.$id.'">'.$world_n.'</option>';
            }
            if($id == (int) $_POST['world'])
            {
                $world_id = $id;
                $world_name = $world_n;
            }
            $i++;
        }

        $main_content .= ''.$select_w.'';
        for($i=0;$i <= count($config['site']['worlds']); $i++)
        {
            $main_content .= ''.$worlds[$i].'';
        }
        $main_content .= '</td></tr></select>';
    }

    if(!isset($world_id))
    {
        $world_id = 0;
        $world_name = $config['server']['serverName'];
    }

    if(count($towns_list) > 1)
    {
        if(isset($_POST['town']) and is_numeric($_POST['town']))
        {
            $pid = (int) $_POST['town'];
            $pid = '<option value='.$pid.'>'.$towns_list[$world_id][$pid].'</option>';
        }
        else
        {
            $pid = '<option value="all">[ALL]</option>';
            $all=true;
        }
        $select .= '<tr><td>Select City:</td><td><select name="town" onchange="submit()">'.$pid.'';
        $i=1;
        foreach($towns_list[$world_id] as $id => $town_n)
        {
            if($_POST['town'] != $id)
            {
                $towns[$i] .= '<option value="'.$id.'">'.$town_n.'</option>';
            }
            if($id == (int) $_POST['town'])
            {
                $town_id = $id;
                $town_name = $town_n;
            }
            $i++;
        }

        $main_content .= ''.$select.'';
        for($i=1;$i <= count($towns_list[$world_id]); $i++)
        {
            $main_content .= ''.$towns[$i].'';
        }
        if(!$all)
            $main_content .= '<option value="all">[ALL]</option>';

        $main_content .= '</td></tr></select>';
    }
    if(isset($town_id))
    {
        $a_status = array(1 => "Empty", "Rented", "[ALL]");

        if(isset($_POST['status']) and is_numeric($_POST['status']))
        {
            $sid = (int) $_POST['status'];
            $sid = '<option value='.$sid.'>'.$a_status[$sid].'</option>';
            if($_POST['status'] == 1)
                $s[1] = true;
            elseif($_POST['status'] == 2)
                $s[2] = true;
            elseif($_POST['status'] == 3)
                $s[3] = true;
        }
        $main_content .= '<tr><td>Select by status:</td><td><select name="status" onchange="submit()">'.$sid.'';
        if(!$s[3])
            $main_content .= '<option value="3">[ALL]</opyion>';
        if(!$s[2])
            $main_content .= '<option value="2">Rented</option>';
        if(!$s[1])
            $main_content .= '<option value="1">Empty</option>';
        $main_content .= '</td></tr></select>';

    }

    $main_content .= '</table></form>';

    if(isset($_POST['status']))
    {
        if($_POST['status'] == 1)
            $stat = "and `owner` = ''";
        elseif($_POST['status'] == 2)
            $stat = "and `owner` > 0";
    }

    if(!isset($town_id))
    {
        $houses_info = $SQL->query("SELECT * FROM `houses` WHERE `world_id` = ".$world_id." ORDER BY `town` , `name`");
        $towns_all = true;
    }

    $main_content .= '<h2>Houses on '.$config['site']['worlds'][(int) $_GET['world']].'</h2>';
    $main_content .= '<table><tr bgcolor="'.$config['site']['vdarkborder'].'"><td><font color="white"><b>Address</b></font></td><td><font color="white"><b>Size</b></font></td><td><font color="white"><b>Price</b></font></td><td><font color="white"><b>City</b></font></td><td><font color="white"><b>Status</b></font></td></tr>';
    $number_of_rows = 1;
    if(!$towns_all)
        $houses_info = $SQL->query("SELECT * FROM `houses` WHERE `world_id` = ".$world_id." and `town` = ".$town_id." ".$stat." ORDER BY `name`");
    $players_info = $SQL->query("SELECT `houses`.`id` AS `houseid` , `players`.`name` AS `ownername` , `accounts`.`premdays` AS `premdays` , `accounts`.`lastday` AS `lastlogin` FROM `houses` , `players` , `accounts` WHERE `players`.`id` = `houses`.`owner` AND `accounts`.`id` = `players`.`account_id`");
    $players = array();
    foreach($players_info->fetchAll() as $player)
        $players[$player['houseid']] = array('name' => $player['ownername'], 'days' => $player['premdays'], 'last' => $player['lastlogin']);
    foreach($houses_info->fetchAll() as $house)
    {
        $owner = $players[$house['id']];
        if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
        $main_content .= '<tr bgcolor="'.$bgcolor.'"><td>'.$house['name'].'</td><td align="right" width="35">'.$house['size'].'</td><td align="right" width="65">'.($house['price'] / 1000).'k gp</td><td>'.$towns_list[(int) $house['world_id']][(int) $house['town']].'</td><td>';
        if(!empty($owner['name']))
        {
            if($owner['deleted'] > 0)
                $status='<font color=red><b>[DELETED]</b></font>';

            if(isPremium($owner['days'], $owner['last']))
            {
                $main_content .= 'Rented by <a href="?subtopic=characters&name='.urlencode($owner['name']).'">'.$owner['name'].'</a>'.$status.'';
            }
            else
            {
                $main_content .= 'Rented by <a href="?subtopic=characters&name='.urlencode($owner['name']).'">'.$owner['name'].'</a>'.$status.' (FACC)';
            }
        }
        else
        {
            $main_content .= 'Empty';
        }
        $main_content .= '</td></tr>';
    }
    $main_content .= '</TABLE>';
?>
