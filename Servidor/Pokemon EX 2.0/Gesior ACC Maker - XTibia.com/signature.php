<?PHP

	class signature
    {
    	
    	# v-- CONFIGURATION BELOW --v #
    	var $config = array
	    (
	        'database'    => array ( "localhost" , "user" , "password" , "database" ),
	        'vocations'   => array ( "No Vocation" , "Sorcerer" , "Druid" , "Paladin" , "Knight" , "Master Sorcerer" , "Elder Druid" , "Royal Paladin" , "Elite Knight" ),
	        'towns'       => array ( 1 => 'Shaldoria', 2 => "Akrehmion", 3 => "Junglus City", 4 => 'Svargrond', 5 => 'Rising Isle', 6 => 'Yalahar', 7 => 'Kraza', 8 => 'Karama' ),
	        'groups'      => array ( 2 => "Tutor" , 3 => "Senior Tutor" , 4 => "Gamemaster" , 5 => "Community Manager" , 6 => "God" ),
	        'hidechars'   => array ( 'Account Manager' , 'Rook Sample' , 'Sorcerer Sample' , 'Druid Sample' , 'Paladin Sample' , 'Knight Sample' ),
	        'backgrounds' => array ( 'signatures/blue' , 'signatures/red' , 'signatures/green' ),
	        'color'       => "#FFFFFF",
	        'statuscolor' => array ( "#358f0d" /* online */ , "#c40808" /* offline */ ),
	        'font'        => "signatures/arial.ttf",
	        'size'        => array ( 2 /* without font */ , 8 /* with font */ )
	    );
    	# ^-- CONFIGURATION ABOVE --^ #
	    
        
        
        
        
        // Database functions.
        function connectDatabase ( $database ) { @mysql_connect ( $database[0] , $database[1] , $database[2] ); @mysql_select_db ( $database[3] ); }
        function query ( $query ) { return @mysql_query ( $query ); }
        function fetchArray ( $query ) { return @mysql_fetch_array ( $query ); }
        function secure ( $query ) { return @mysql_real_escape_string ( $query ); }
        function numRows ( $query ) { return @mysql_num_rows ( $query ); }
		
		
        function convertHex ( $hex )
		{
			
			$hex   = ereg_replace ( "#" , "" , $hex );
			$color = array();
		
			if ( strlen ( $hex ) == 6 ):
			
				$color['r'] = hexdec ( substr ( $hex , 0 , 2 ) );
				$color['g'] = hexdec ( substr ( $hex , 2 , 2 ) );
				$color['b'] = hexdec ( substr ( $hex , 4 , 2 ) );
			
			endif;
			
			return $color;
			
		}


        // Signature functions.
        function character ( $character )
        {
            
            // Define presets.
            $query     = "SELECT `id` , `account_id` , `group_id` , `name` , `sex` , `promotion` , `vocation` , `town_id` , `rank_id` , `online` , `level` , `lastlogin` FROM `players` WHERE `name` = '{$character}'";
            $fetchRow  = $this -> fetchArray ( $this -> query ( $query ) );
            $numRows   = $this -> numRows    ( $this -> query ( $query ) );
            $rank      = $this -> fetchArray ( $this -> query ( "SELECT `guild_id` , `name` FROM `guild_ranks` WHERE `id` = '{$fetchRow[rank_id]}'" ) );
            $guild     = $this -> fetchArray ( $this -> query ( "SELECT `name` FROM `guilds` WHERE `id` = '{$rank[guild_id]}'" ) );
            $premium   = $this -> fetchArray ( $this -> query ( "SELECT `premdays` FROM `accounts` WHERE `id` = '{$fetchRow[account_id]}'" ) );
            
            // Define certain arrays into one variable.
            $arrays['status']   = ( $fetchRow['online'] == 1 ? ' ONLINE' : 'OFFLINE' );
            $arrays['gender']   = ( $fetchRow['sex'] == 1 ? 'Male' : 'Female' );
            $arrays['vocation'] = ( $fetchRow['group_id'] < 2 ) ? "Profession: " . ( $fetchRow['promotion'] != 0 ? $this -> config['vocations'][$fetchRow['vocation'] + ( 4 * $fetchRow['promotion'] )] : $this -> config['vocations'][$fetchRow['vocation']] ) . "\q" : NULL;
            $arrays['guild']    = ( ( $fetchRow['rank_id'] > 0 and $fetchRow['group_id'] < 2 ) ? "Guild: " . ( $fetchRow['sex'] == 1 ? 'He' : 'She' ) . " is " . $rank['name'] . " of the " . $guild['name'] . "\q" : NULL );
            $arrays['position'] = ( $fetchRow['group_id'] > 1 ? "Position: " . $this -> config['groups'][$fetchRow['group_id']] . "\q" : NULL );
			$arrays['lastlogin']= ( $fetchRow['lastlogin'] != 0 ? date ( "M d Y, H:i:s" , $fetchRow['lastlogin'] ) : 'Never logged in' );
			$arrays['premium']  = ( ( $fetchRow['group_id'] < 2 ) ? $premium['premdays'] > 0 ? '(Premium Account)' : '(Free Account)' : NULL );
            $arrays['level']    = ( $fetchRow['group_id'] < 2 ? "Level: " . $fetchRow['level'] . "\q" : NULL );
            
            // Showable fields (\q equals new line, had to create my own shortcut as I clear all whitespaces further down in the script).
            $return = "
				Name: 		{$fetchRow[name]} 	{$arrays[premium]}			\q
				Sex: 		{$arrays[gender]}								\q
							{$arrays[level]}
							{$arrays[vocation]}
				Residence: 	{$this -> config[towns][$fetchRow[town_id]]}	\q
							{$arrays[guild]}
							{$arrays[position]}
				Last Login: {$arrays[lastlogin]}
			";
			
			// Make certain fields bold.
			$bolds = "Name: \nSex: \n" . ( $fetchRow['group_id'] < 2 ? "Level: \n" : NULL ) . ( ( $fetchRow['group_id'] < 2 ) ? "Profession: \n" : NULL ) . "Residence: \n" . ( ( $fetchRow['rank_id'] > 0 and $fetchRow['group_id'] < 2 ) ? "Guild: \n" : NULL ) . ( $fetchRow['group_id'] > 1 ? "Position: \n" : NULL ) . "Last Login:";
			
			// Return output.
            if ( $numRows == 1 and !in_array ( $fetchRow['name'] , $this -> config['hidechars'] ) )
                return $return . "|||" . $bolds . "|||" . $arrays['status'];
            else
                return "A character with that name does not exist.";
            
        }
        
        // Create a function to generate the signature.
        function generate ( $character , $background )
        {
            
	    	// Connect to the database.
	    	$this -> connectDatabase ( $this -> config['database'] );
	        $split = explode ( "|||" , $this -> character ( $this -> secure ( $character ) ) );
	        
	        if ( strtolower ( substr ( $split[2] , -5 , 1 ) ) == 'n' )
	        	$statuscolor = $this -> convertHex ( $this -> config['statuscolor'][0] );
	        else
	        	$statuscolor = $this -> convertHex ( $this -> config['statuscolor'][1] );
	    
	    	header ( "Content-type: image/png" );
	        
	        // Check if the background exists, if not - create one.
	        if ( file_exists ( "{$this -> config[backgrounds][$background]}.png" ) != 1 ):
			                  
	            $image = imagecreatetruecolor ( 500 , 120 );
	            imagefilledrectangle ( $image , 0 , 0 , 500 , 120 , imagecolorallocate ( $image , 255 , 255 , 255 ) );
	            $color = imagecolorallocate ( $image , 0 , 0 , 0 );
	            imagesetthickness ( $image , 1 );
	            imagerectangle ( $image , 0 , 0 , 499 , 119 , $color );
	            $split[0] = "The requested image does not exist.";
	            $split[1] = NULL;
	            
	        else:
	        
	            $image = imagecreatefrompng ( $this -> config['backgrounds'][$background] . ".png" );
	        	$color	 = $this -> convertHex ( $this -> config['color'] );
	           	
	        endif;
	        
	        $content = explode ( "\q" , str_replace ( array ( "\n" , "\r" , "\t" , "\o" , "\xOB" ) , '' , $split[0] ) );
	        $bolds   = explode ( "\n" , str_replace ( array ( "\r" , "\t" , "\o" , "\xOB" ) , '' , $split[1] ) );
	        
	        // Print text.
	        if ( $this -> config['font'] != "" ):
		        for ( $i = 0; $i <= count ( $content ); $i++ ):
		        	$o = ( $i == 0 ) ? 2.4 : $i + 2.4;
		        	imagettftext ( $image , $this -> config['size'][1] , 0 , 7, 12 * $o , imagecolorallocate ( $image , $color['r'] , $color['g'] , $color['b'] ) , "./{$this -> config[font]}" , "    " . $content[$i] );
				endfor;
				for ( $i = 0; $i <= count ( $bolds ); $i++ ):
		        	$o = ( $i == 0 ) ? 2.4 : $i + 2.4;
		        	imagettftext ( $image , $this -> config['size'][1] , 0 , 8, 12 * $o , imagecolorallocate ( $image , $color['r'] , $color['g'] , $color['b'] ) , "./{$this -> config[font]}" , "    " . $bolds[$i] );
				endfor;
				if ( $split[0] != "The requested image does not exist." ):
					imagettftext ( $image , $this -> config['size'][1] , 0 , 250 , 10+round ( ( imagesy ( $image ) / 2 ) - ( imagefontheight ( $this -> config['size'][1] ) / 2 ) ) , imagecolorallocate ( $image , 0 , 0 , 0 ) , "./{$this -> config[font]}" , $split[2] );
					imagettftext ( $image , $this -> config['size'][1] , 0 , 249 , 10+round ( ( imagesy ( $image ) / 2 ) - ( imagefontheight ( $this -> config['size'][1] ) / 2 ) )-1 , imagecolorallocate ( $image , $statuscolor['r'] , $statuscolor['g'] , $statuscolor['b'] ) , "./{$this -> config[font]}" , $split[2] );
				endif;
			else:
				for ( $i = 0; $i <= count ( $content ); $i++ ):
					$o = ( $i == 0 ) ? 1.5 : $i + 1.5;
					imagestring ( $image, $this -> config['size'][0] , -4, 12 * $o, "    " . $content[$i], imagecolorallocate ( $image , $color['r'] , $color['g'] , $color['b'] ) );
				endfor;
				for ( $i = 0; $i <= count ( $bolds ); $i++ ):
					$o = ( $i == 0 ) ? 1.5 : $i + 1.5;
					imagestring ( $image, $this -> config['size'][0] , -3, 12 * $o, "    " . $bolds[$i], imagecolorallocate ( $image , $color['r'] , $color['g'] , $color['b'] ) );
				endfor;
				if ( $split[0] != "The requested image does not exist." ):
					imagestring ( $image, $this -> config['size'][0] , 250, round ( ( imagesy ( $image ) / 2 ) - ( imagefontheight ( $this -> config['size'][1] ) / 2 ) )-1, $split[2], imagecolorallocate ( $image , 0 , 0 , 0 ) );
		        	imagestring ( $image, $this -> config['size'][0] , 249, round ( ( imagesy ( $image ) / 2 ) - ( imagefontheight ( $this -> config['size'][1] ) / 2 ) )-2, $split[2], imagecolorallocate ( $image , $statuscolor['r'] , $statuscolor['g'] , $statuscolor['b'] ) );
				endif;
			endif;
	            
	        imagepng ( $image );
	        imagedestroy ( $image );
        	
        }
        
    }
    
    
    
    
    $signature = new signature();
    
	if ( !empty ( $_GET ) ):
	
		$signature -> generate ( $_GET['character'] , $_GET['image'] );
		
	endif;
	
?> 
