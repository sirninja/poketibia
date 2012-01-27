<?PHP
$config['site']['worlds'] = array(0 => 'Server Name', 1 => 'Server Name 1', 2 => 'Server Name 2');
$config['site']['quests'] = array('Annihilator' => 5000,'Demon Helmet' => 2645,'Pits of Inferno' => 5550); // list of quests, 'questname' => storage-id,

// ACCOUNT config
$config['site']['one_email'] = 0; // one e-mail can be used only to create one account 0 / 1
$config['site']['verify_code'] = 1; // show verify code to block stupid scripts, set 0 if you have problems with image
$config['site']['email_days_to_change'] = 2; // how many days user need to change e-mail to account - block hackers
$config['site']['newaccount_premdays'] = 0; // how many days receive new account

// USE ONLY IF YOU CONFIGURED E-MAIL AND IT WORK
$config['site']['create_account_verify_mail'] = 0; // when create account player must use right e-mail, he will receive random password to account like on RL tibia, 1 = yes, 0 = no
$config['site']['generate_new_reckey'] = 0; // let player generate new recovery key, he will receive e-mail with new rec key (not display on page, hacker can't generate rec key)
$config['site']['generate_new_reckey_price'] = 5; // you can get some Premium Points for new rec key
$config['site']['send_mail_when_change_password'] = 0; // send e-mail with new password when change password to account, set 0 if someone abuse to send spam
$config['site']['send_mail_when_generate_reckey'] = 0; // send e-mail with rec key (key is displayed on page anyway when generate), set 0 if someone abuse to send spam
$config['site']['send_register_email'] = 0; // send e-mail when register account

// CHARACTER config, format: ID_of_vocation => 'Name of Character to copy', load vocation name from $vocation_name[0] (below)
$config['site']['newchar_vocations'][0] = array(1 => 'Sorcerer Sample', 2 => 'Druid Sample', 3 => 'Paladin Sample', 4 => 'Knight Sample');
$config['site']['newchar_vocations'][1] = array(1 => 'Sorcerer Sample', 2 => 'Druid Sample', 3 => 'Paladin Sample', 4 => 'Knight Sample');
// sample, if rook only:             $config['site']['newchar_vocations'][0] = array(0 => 'Rook Sample');
$config['site']['newchar_towns'][0] = array(2);
$config['site']['newchar_towns'][1] = array(1,2);
// sample, if all players should spawn in one city (city with ID 4): $config['site']['newchar_towns'] = array(4);

// list of vocations on ots (world 0)
$vocation_name[0][0] = array(0 => 'None', 1 => 'Sorcerer', 2 => 'Druid', 3 => 'Paladin', 4 => 'Knight'); // id => 'name' , $vocation_name[0] - promotion level 0, $vocation_name[0] - for world ID 0
$vocation_name[0][1] = array(1 => 'Master Sorcerer', 2 => 'Elder Druid', 3 => 'Royal Paladin', 4 => 'Elite Knight'); // id => 'name' , $vocation_name[1] - promotion level 1, $vocation_name[0] - for world ID 0
// list of vocations on ots (world 1)
$vocation_name[1][0] = array(0 => 'None', 1 => 'Sorcerer', 2 => 'Druid', 3 => 'Paladin', 4 => 'Knight'); // id => 'name' , $vocation_name[0] - promotion level 0, $vocation_name[1] - for world ID 1
$vocation_name[1][1] = array(1 => 'Master Sorcerer', 2 => 'Elder Druid', 3 => 'Royal Paladin', 4 => 'Elite Knight'); // id => 'name' , $vocation_name[1] - promotion level 1, $vocation_name[1] - for world ID 1

// list of towns on ots
$towns_list[0] = array(0 => 'Venore', 1 => 'Edron', 2 => 'Thais', 3 => 'Carlin'); // list of towns, id => 'name', $towns_list[0] - for world id 0
$towns_list[1] = array(0 => 'Venore', 1 => 'Edron', 2 => 'Thais', 3 => 'Carlin'); // list of towns, id => 'name', $towns_list[1] - for world id 1

// list of monsters on ots - names blocked, you can generate list of your monsters in acc. maker admin panel ( Reload Monsters )
$config['site']['monsters'] = array("amazon","valkyrie","carrion worm","rotworm","rotworm queen","cockroach","kongra","merlkin","sibang","crystal spider","giant spider","poison spider","scorpion","spider","tarantula","achad","axeitus headbanger","bloodpaw","bovinus","colerian the barbarian","cursed gladiator","frostfur","orcus the cruel","rocky","the hairy one","avalanche","drasilla","grimgor guteater","kreebosh the exile","slim","spirit of earth","spirit of fire","spirit of water","the dark dancer","the hag","darakan the executioner","deathbringer","fallen mooh'tah master ghar","gnorre chyllson","norgle glacierbeard","svoren the mad","the masked marauder","the obliverator","the pit lord","webster","barbarian bloodwalker","barbarian brutetamer","barbarian headsplitter","barbarian skullhunter","bear","panda","polar bear","braindeath","beholder","elder beholder","gazer","chicken","dire penguin","flamingo","parrot","penguin","seagull","terror bird","bazir","infernatil","thul","munster","son of verminor","xenia","zoralurk","big boss trolliver","foreman kneebiter","mad technomancer","man in the cave","lord of the elements","the count","the plasmother","dracola","the abomination","the handmaiden","mr. punish","the countess sorrow","the imperor","massacre","apocalypse","brutus bloodbeard","deadeye devious","demodras","dharalion","fernfang","ferumbras","general murius","ghazbaran","grorlam","lethal lissy","morgaroth","necropharus","orshabaal","ron the ripper","the evil eye","the horned fox","the old widow","tiquandas revenge","apprentice sheng","dog","hellhound","war wolf","winter wolf","wolf","chakoya toolshaper","chakoya tribewarden","chakoya windcaller","blood crab","crab","frost giant","frost giantess","ice golem","yeti","acolyte of the cult","adept of the cult","enlightened of the cult","novice of the cult","ungreez","dark torturer","demon","destroyer","diabolic imp","fire devil","fury","hand of cursed fate","juggernaut","nightmare","plaguesmith","blue djinn","efreet","green djinn","marid","frost dragon","wyrm","sea serpent","dragon lord","dragon","hydra","dragon hatchling","dragon lord hatchling","frost dragon hatchling","dwarf geomancer","dwarf guard","dwarf soldier","dwarf","dworc fleshhunter","dworc venomsniper","dworc voodoomaster","elephant","mammoth","elf arcanist","elf scout","elf","charged energy elemental","energy elemental","massive energy elemental","overcharged energy elemental","energy overlord","cat","lion","tiger","azure frog","coral frog","crimson frog","green frog","orchid frog","toad","jagged earth elemental","muddy earth elemental","earth elemental","massive earth elemental","earth overlord","gargoyle","stone golem","ghost","phantasm","phantasm","pirate ghost","spectre","cyclops smith","cyclops drone","behemoth","cyclops","slick water elemental","roaring water elemental","ice overlord","water elemental","massive water elemental","ancient scarab","butterfly","bug","centipede","exp bug","larva","scarab","wasp","lizard sentinel","lizard snakecharmer","lizard templar","minotaur archer","minotaur guard","minotaur mage","minotaur","squirrel","goblin demon","badger","bat","deer","the halloween hare","hyaena","pig","rabbit","silver rabbit","skunk","wisp","dark monk","monk","tha exp carrier","necromancer","priestess","orc berserker","orc leader","orc rider","orc shaman","orc spearman","orc warlord","orc warrior","orc","goblin leader","goblin scavenger","goblin","goblin assassin","assasin","bandit","black knight","hero","hunter","nomad","smuggler","stalker","poacher","wild warrior","ashmunrah","dipthrah","mahrdis","morguthis","omruc","rahemos","thalas","vashresamun","pirate buccaneer","pirate corsair","pirate cutthroat","pirate marauder","carniphila","spit nettle","fire overlord","massive fire elemental","blistering fire elemental","blazing fire elemental","fire elemental","hellfire fighter","quara constrictor scout","quara hydromancer scout","quara mantassin scout","quara pincher scout","quara predator scout","quara constrictor","quara hydromancer","quara mantassin","quara pincher","quara predator","cave rat","rat","cobra","crocodile","serpent spawn","snake","wyvern","black sheep","sheep","mimic","betrayed wraith","bonebeast","demon skeleton","lost soul","pirate skeleton","skeleton","skeleton warrior","undead dragon","defiler","slime2","slime","bog raider","ice witch","warlock","witch","bones","fluffy","grynch clan goblin","hacker","minishabaal","primitive","tibia bug","undead minion","annihilon","hellgorak","latrivan","madareth","zugurosh","ushuriel","golgordan","thornback tortoise","tortoise","eye of the seven","deathslicer","flamethrower","magicthrower","plaguethrower","poisonthrower","shredderthrower","troll champion","frost troll","island troll","swamp troll","troll","banshee","blightwalker","crypt shambler","ghoul","lich","mummy","vampire","grim reaper","trainer","forest dragon","knight","paladin","druid","sorcerer","guard","mercenary","thief","toxiros","pyramo","lazarus","zathroth","goshnar","durin","demora","orc champion","lumenia","dracula","alezzo","prince almirith","elf warlord","random noob","magebomb");
// list of NPCs on ots - names blocked
$config['site']['npc'] = array('alice', 'oarkhal', 'equer', 'parkhal', 'leoric', 'sarkhal', 'pallo', 'riona', 'her miona', 'varkhal', 'eura', 'blitz', 'markhal', 'wengo', 'larkhal');
$config['site']['max_players_per_account'] = 35; // max. number of characters on account


// GUILDS config
$config['site']['guild_need_level'] = 8; // minimum level to create guild
$config['site']['guild_need_pacc'] = 0; // guild need pacc 0 / 1
$config['site']['guild_image_size_kb'] = 50; // maximum size of image in KB
$config['site']['guild_description_chars_limit'] = 1000; // limit of guild description
$config['site']['guild_description_lines_limit'] = 6; // limit of lines, if description has more lines it will be showed as long text, without 'enters'
$config['site']['guild_motd_chars_limit'] = 150; // limit of MOTD (show in game?)


// E-MAIL config
$config['site']['send_emails'] = 0; // is acc. maker configured to send e-mails?
$config['site']['mail_address'] = "YOUREMAIL@gmail.com"; // e-mail address
$config['site']['smtp_enabled'] = "yes"; // send by smtp or mail function (set 0 if use mail function)
$config['site']['smtp_host'] = "smtp.gmail.com"; // address
$config['site']['smtp_port'] = 465; // port
$config['site']['smtp_auth'] = "yes"; // need authorization? (set 0 if not need auth)
$config['site']['smtp_user'] = "login"; // login
$config['site']['smtp_pass'] = "password"; // password

// ACC MAKER OPTIONS config
$config['site']['access_news'] = 2; // access level needed to edit news
$config['site']['access_admin_panel'] = 3; // access level needed to open admin panel
$config['site']['news_big_limit'] = 3; // limit of news on latest news page
$config['site']['news_ticks_limit'] = 5; // limit of ticker news on latest news page
$config['site']['show_creationdate'] = 1; // show date of character creation 1 = yes, 0 = no (when use Search Player)
$config['site']['last_deaths_limit'] = 40; // max. number of death on last death page
$config['site']['players_group_id_block'] = 4; // don't show in statistics players with group ID higher (or equal) then (show tutors, senior tutors and normal players)
$config['site']['support_group_id'] = 2; // on game masters list show players with group id 2 or higher
$config['site']['shop_system'] = 1; // show server shop page? 1 = yes, 0 = no, use only if you installed LUA scripts of shop
$config['site']['download_page'] = 1; // show download page? 1 = yes, 0 = no
$config['site']['serverinfo_page'] = 1; // show server info page? 1 = yes, 0 = no
$config['site']['verify_code_shop'] = 0; // show verify code when player try to check premium code
$config['site']['gallery_page'] = 1; // show gallery page? 1 = yes, 0 = no
$config['site']['email_lai_sec_interval'] = 180; // time in seconds between e-mails to one account from lost account interface, block spam
$config['site']['show_marriage_info'] = 0; // show marriage, 1 = yes, 0 = no
$config['site']['show_skills_info'] = 1;//show players skills, 1 = yes, 0 = no
$config['site']['show_vip_status'] = 1;// show vip status, 1 = yes, 0 = no
$config['site']['show_vip_storage'] = 0;// the storage of vip
$config['site']['show_outfit'] = 1;// show outfit, 1 = yes, 0 = no
$config['site']['show_signature'] = 1;// show signature, 1 = yes, 0 = no
$config['site']['screenoftheday'] = 1;// show screenshot of the day
$config['site']['worldtransfer'] = 1;//1-Enable/0-Disable Character World Transfer
$config['site']['worldtransferprice'] = 10;//Price for Character World Transfer
$config['site']['transfermonths'] = 6;//Months for which you cannot make World Transfer with a character

// layout, available layouts: rasta,tibiacom,darkritual
$config['site']['layout'] = "tibiacom"; // layout name
?>
