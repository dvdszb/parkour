translations.en = {
	-- Error messages
	corrupt_map = "<r>Corrupt map. Loading another.",
	corrupt_map_vanilla = "<r>[ERROR] <n>Can not get information of this map.",
	corrupt_map_mouse_start = "<r>[ERROR] <n>This map needs to have a start position (mouse spawn point).",
	corrupt_map_needing_chair = "<r>[ERROR] <n>The map needs to have the end chair.",
	corrupt_map_missing_checkpoints = "<r>[ERROR] <n>The map needs to have at least one checkpoint (yellow nail).",
	corrupt_data = "<r>Unfortunately, your data was corrupt and has been reset.",
	min_players = "<r>To save your data, there must be at least 4 unique players in the room. <bl>[%s/%s]",
	tribe_house = "<r>Data will not be saved in tribehouses.",
	invalid_syntax = "<r>Invalid syntax.",
	user_not_in_room = "<r>The user <n2>%s</n2> is not in the room.",
	arg_must_be_id = "<r>The argument must be a valid id.",
	cant_update = "<r>Can't update player ranks right now. Try again later.",
	cant_edit = "<r>You can't edit <n2>%s's</n2> ranks.",
	invalid_rank = "<r>Invalid rank: <n2>%s",
	code_error = "<r>An error appeared: <bl>%s-%s-%s %s",
	panic_mode = "<r>Module is now entering panic mode.",
	public_panic = "<r>Please wait until a bot arrives and restarts the module.",
	tribe_panic = "<r>Please type <n2>/module parkour</n2> to restart the module.",
	emergency_mode = "<r>Initiating emergency shutdown, no new players allowed. Please go to another #parkour room.",
	bot_requested = "<r>The bot has been requested. It should be arriving in a moment.",
	stream_failure = "<r>Internal stream channel failure. Can not transmit data.",
	maps_not_available = "<r>#parkour's 'maps' submode is only available in <n2>*#parkour0maps</n2>.",
	version_mismatch = "<r>Bot (<d>%s</d>) and lua (<d>%s</d>) versions do not match. Can't start the system.",
	missing_bot = "<r>Bot missing. Wait until the bot arrives or ping @Tocu#0018 on discord: <d>%s</d>",
	invalid_length = "<r>Your message must have between 10 and 100 characters. It has <n2>%s</n2> characters.",
	invalid_map = "<r>Invalid map.",
	map_does_not_exist = "<r>The given map does not exist or can't be loaded. Try again later.",
	invalid_map_perm = "<r>The given map is not P22 or P41.",
	invalid_map_perm_specific = "<r>The given map is not in P%s.",
	cant_use_this_map = "<r>The given map has a small bug and can't be used.",
	invalid_map_p41 = "<r>The given map is in P41, but is not in the module map list.",
	invalid_map_p22 = "<r>The given map is in P22, but is in the module map list.",
	map_already_voting = "<r>The given map already has an open votation.",
	not_enough_permissions = "<r>You don't have enough permissions to do this.",
	already_depermed = "<r>The given map is already depermed.",
	already_permed = "<r>The given map is already permed.",
	cant_perm_right_now = "<r>Can't change the perm of this map right now. Try again later.",

	-- Congratulation messages
	reached_level = "<d>Congratulations! You've reached level <vp>%s</vp>.",
	finished = "<d><o>%s</o> finished the parkour in <vp>%s</vp> seconds, <fc>congratulations!",
	unlocked_power = "<ce><d>%s</d> unlocked the <vp>%s</vp> power.",
	enjoy = "<d>Enjoy your new skills!",

	-- Information messages
	paused_events = "<cep><b>[Warning!]</b> <n>The module has reached it's critical limit and is being paused.",
	resumed_events = "<n2>The module has been resumed.",
	welcome = "<n>Welcome to <t>#parkour</t>!",
	discord = "<cs>Do you want to report bugs, make suggestions or just want to chat with other players? Join us on discord: <pt>%s</pt>",
	map_submissions = "<pt>Do you want to see your map in the module? Submit them here: <j>%s</j>",
	data_saved = "<vp>Data saved.",
	action_within_minute = "<vp>The action will be applied in a minute.",
	rank_save = "<n2>Type <d>!rank save</d> to apply the changes.",
	module_update = "<r><b>[Warning!]</b> <n>The module will update in <d>%02d:%02d</d>.",
	mapping_loaded = "<j>[INFO] <n>Mapping system <t>(v%s)</t> loaded.",
	mapper_joined = "<j>[INFO] <n><ce>%s</ce> <n2>(%s)</n2> has joined the room.",
	mapper_left = "<j>[INFO] <n><ce>%s</ce> <n2>(%s)</n2> has left the room.",
	mapper_loaded = "<j>[INFO] <n><ce>%s</ce> has loaded a map.",
	starting_perm_change = "<j>[INFO] <n>Starting perm change...",
	got_map_info = "<j>[INFO] <n>Retrieved map information. Trying to change the perm...",
	perm_changed = "<j>[INFO] <n>Successfully changed the perm of map <ch>@%s</ch> from <r>P%s</r> to <t>P%s</t>.",
	data_migration = "All the data needs to be migrated. This means, you currently don't have any completed maps. To restore your data, just go to room: <a href='event:migration'><b>*#drawbattle0migration</b></a>.",

	-- Miscellaneous
	important = "IMPORTANT",
	unknown = "Unknown",
	powers = "Powers",
	press = "<vp>Press %s",
	click = "<vp>Left click",
	completed_maps = "<p align='center'><BV><B>Completed maps: %s</B></p></BV>",
	leaderboard = "Leaderboard",
	position = "Position",
	username = "Username",
	community = "Community",
	completed = "Completed maps",
	not_permed = "not permed",
	permed = "permed",
	points = "%d points",
	conversation_info = "<j>%s <bl>- @%s <vp>(%s, %s) %s\n<n><font size='10'>Started by <d>%s</d>. Last comment by <d>%s</d>. <d>%s</d> comments, <d>%s</d> unread.",
	map_info = "<p align='center'>Map code: <bl>@%s</bl> <g>|</g> Map author: <j>%s</j> <g>|</g> Status: <vp>%s, %s</vp> <g>|</g> Points: <vp>%s</vp>",
	permed_maps = "Permed maps",
	ongoing_votations = "Ongoing votes",
	archived_votations = "Archived votes",
	open = "Open",
	not_archived = "not archived",
	archived = "archived",
	delete = "<r><a href='event:%s'>[delete]</a> ",
	see_restore = "<vp><a href='event:%s'>[see]</a> <a href='event:%s'>[restore]</a> ",
	no_comments = "No comments.",
	deleted_by = "<r>[Message deleted by %s]",
	dearchive = "unarchive", -- to dearchive
	archive = "archive", -- to archive
	deperm = "deperm", -- to deperm
	perm = "perm", -- to perm
	map_actions_staff = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Comment</j></a> <g>|</g> Your vote: %s <g>|</g> <vp><a href='event:%s'>[%s]</a> <a href='event:%s'>[%s]</a> <a href='event:%s'>[load]</a></p>",
	map_actions_user = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Comment</j></a></p>",
	load_from_thread = "<p align='center'><a href='event:load_custom'>Load custom map</a></p>",
	write_comment = "Write your comment down here",
	write_map = "Write the mapcode down here",

	-- Power names
	ballon = "Balloon",
	masterBallon = "Master Ballon",
	bubble = "Bubble",
	fly = "Fly",
	snowball = "Snowball",
	speed = "Speed",
	teleport = "Teleport",
	smallbox = "Small box",
	cloud = "Cloud",
	rip = "Tombstone",
	choco = "Chocoplank",
}
