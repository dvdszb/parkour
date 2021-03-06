local roompw = {
	owner = nil,
	password = nil
}
local kill_cooldown = {}
local update_at = 0
local staff_people = {next_check = 0, texts = {}, to_send = {}, timeout = 0}
local open = {}
local powers_img = {}
local help_img = {}
local no_help = {}
local scrolldata = {
	players = {},
	texts = {}
}
local toggle_positions = {
	[1] = 107,
	[2] = 132,
	[3] = 157,
	[4] = 183,
	[5] = 209,
	[6] = 236,
	[7] = 262,
	[8] = 289
}
local community_images = {
	xx = "1651b327097.png",
	ar = "1651b32290a.png",
	bg = "1651b300203.png",
	br = "1651b3019c0.png",
	cn = "1651b3031bf.png",
	cz = "1651b304972.png",
	de = "1651b306152.png",
	ee = "1651b307973.png",
	en = "1723dc10ec2.png",
	e2 = "1723dc10ec2.png",
	es = "1651b309222.png",
	fi = "1651b30aa94.png",
	fr = "1651b30c284.png",
	gb = "1651b30da90.png",
	hr = "1651b30f25d.png",
	hu = "1651b310a3b.png",
	id = "1651b3121ec.png",
	il = "1651b3139ed.png",
	it = "1651b3151ac.png",
	jp = "1651b31696a.png",
	lt = "1651b31811c.png",
	lv = "1651b319906.png",
	nl = "1651b31b0dc.png",
	ph = "1651b31c891.png",
	pl = "1651b31e0cf.png",
	ro = "1651b31f950.png",
	ru = "1651b321113.png",
	tr = "1651b3240e8.png",
	vk = "1651b3258b3.png"
}

local function addButton(id, text, action, player, x, y, width, height, disabled, left)
	id = 2000 + id * 3
	if not disabled then
		text = "<a href='event:" .. action .. "'>" .. text .. "</a>"
	end
	if not left then
		text = "<p align='center'>" .. text .. "</p>"
	end
	local color = disabled and 0x2a424b or 0x314e57

	ui.addTextArea(id    , ""  , player, x-1, y-1, width, height, 0x7a8d93, 0x7a8d93, 1, true)
	ui.addTextArea(id + 1, ""  , player, x+1, y+1, width, height, 0x0e1619, 0x0e1619, 1, true)
	ui.addTextArea(id + 2, text, player, x  , y  , width, height, color   , color   , 1, true)
end

local function removeButton(id, player)
	for i = 2000 + id * 3, 2000 + id * 3 + 2 do
		ui.removeTextArea(i, player)
	end
end

local function scrollWindow(id, player, up, force)
	local data = scrolldata.players[player]
	if not data then return end

	local old = data[2]
	data[2] = up and math.max(data[2] - 1, 1) or math.min(data[2] + 1, data[3])
	if data[2] == old and not force then return end

	ui.addTextArea(1008 + id * 9, data[1][data[2]], player, data[4], data[5], data[6], data[7], 0, 0, 0, true)

	if not data.behind_img then
		data.behind_img = tfm.exec.addImage("1719e0e550a.png", "&1", data[8], data[9], player)
	end
	if data.img then
		tfm.exec.removeImage(data.img)
	end
	data.img = tfm.exec.addImage("1719e173ac6.png", "&2", data[8], data[9] + (125 / (data[3] - 1)) * (data[2] - 1), player)
end

local function addWindow(id, text, player, x, y, width, height, isHelp)
	if width < 0 or height and height < 0 then
		return
	elseif not height then
		height = width/2
	end
	local _id = id
	id = 1000 + id * 9

	ui.addTextArea(id    , "", player, x              , y               , width+100   , height+70, 0x78462b, 0x78462b, 1, true)
	ui.addTextArea(id + 1, "", player, x              , y+(height+140)/4, width+100   , height/2 , 0x9d7043, 0x9d7043, 1, true)
	ui.addTextArea(id + 2, "", player, x+(width+180)/4, y               , (width+10)/2, height+70, 0x9d7043, 0x9d7043, 1, true)
	ui.addTextArea(id + 3, "", player, x              , y               , 20          , 20       , 0xbeb17d, 0xbeb17d, 1, true)
	ui.addTextArea(id + 4, "", player, x+width+80     , y               , 20          , 20       , 0xbeb17d, 0xbeb17d, 1, true)
	ui.addTextArea(id + 5, "", player, x              , y+height+50     , 20          , 20       , 0xbeb17d, 0xbeb17d, 1, true)
	ui.addTextArea(id + 6, "", player, x+width+80     , y+height+50     , 20          , 20       , 0xbeb17d, 0xbeb17d, 1, true)

	if text[1] then -- it is a table
		if scrolldata.players[player] and scrolldata.players[player].img then
			tfm.exec.removeImage(scrolldata.players[player].img)
			tfm.exec.removeImage(scrolldata.players[player].behind_img)
		end
		scrolldata.players[player] = {text, 1, #text, x+3, y+40, width+70, height, x+width+85, y+40, _id}
		ui.addTextArea(id + 7, "", player, x+3, y+3, width+94, height+64, 0x1c3a3e, 0x232a35, 1, true)
		scrollWindow(_id, player, true, true)
	else
		ui.addTextArea(id + 7, (isHelp and "\n\n\n" or "") .. text, player, x+3, y+3, width+94, height+64, 0x1c3a3e, 0x232a35, 1, true)
	end
end

local function removeWindow(id, player)
	if scrolldata.players[player] and scrolldata.players[player].img then
		tfm.exec.removeImage(scrolldata.players[player].img)
		tfm.exec.removeImage(scrolldata.players[player].behind_img)
	end
	scrolldata.players[player] = nil
	for i = 1000 + id * 9, 1000 + id * 9 + 8 do
		ui.removeTextArea(i, player)
	end
end

local function addToggle(id, player, state)
	local x, y = 603, toggle_positions[id]
	local _id = id
	id = 6000 + id * 3

	ui.addTextArea(id, "", player, x, y, 20, 7, 0x232a35, 0x232a35, 1, true)
	if not state then
		ui.addTextArea(id + 1, "", player, x + 3, y + 3, 1, 1, 0x78462b, 0x78462b, 1, true)
	else
		ui.addTextArea(id + 1, "", player, x + 16, y + 3, 1, 1, 0xbeb17d, 0xbeb17d, 1, true)
	end
	ui.addTextArea(id + 2, "<a href='event:toggle:" .. _id .. ":" .. (state and "0" or "1") .. "'>\n\n\n", player, x - 7, y - 7, 30, 20, 1, 1, 0, true)
end

local function removeToggle(id, player)
	for i = 6000 + id * 3, 6000 + id * 3 + 2 do
		ui.removeTextArea(i, player)
	end
end

local function sendStaffList(player)
	text = "<v>[#]<n> <d>Online parkour staff:</d>"

	local sent = {}
	local any_online = false
	for i = 1, #ranks_order do
		for player in next, ranks[ranks_order[i]] do
			if staff_people.texts[player] and online[player] and not sent[player] then
				text = text .. staff_people.texts[player]
				sent[player] = true
				any_online = true
			end
		end
	end

	if any_online then
		tfm.exec.chatMessage(text, player)
	else
		tfm.exec.chatMessage("<v>[#] <r>No parkour staff is online right now.", player)
	end
end

local function closeLeaderboard(player)
	if not open[player].leaderboard then return end

	removeWindow(1, player)
	removeButton(1, player)
	removeButton(2, player)
	removeButton(3, player)
	removeButton(4, player)
	for id = 1, 8 do
		ui.removeTextArea(id, player)
	end

	local images = open[player].images
	for index = 1, images._count do
		tfm.exec.removeImage(images[index])
	end
	images._count = 0

	open[player].leaderboard = false
end

local function closePowers(player)
	if not open[player].powers then return end

	removeWindow(1, player)
	removeButton(1, player)
	removeButton(2, player)
	ui.removeTextArea(1, player)
	ui.removeTextArea(2, player)

	local images = open[player].images
	for index = 1, images._count do
		tfm.exec.removeImage(images[index])
	end
	images._count = 0

	for index = 3000, 2999 + #powers do
		ui.removeTextArea(index, player)
	end

	open[player].powers = false
end

local function removeOptionsMenu(player)
	if not open[player].options then return end

	removeWindow(6, player)
	removeButton(6, player)

	for toggle = 1, 8 do
		removeToggle(toggle, player)
	end

	savePlayerData(player)

	open[player].options = nil
end

local function removeHelpMenu(player)
	if not open[player].help then return end

	removeWindow(7, player)

	for index = 10000, 10002 do
		ui.removeTextArea(index, player)
	end

	for button = 7, 12 do
		removeButton(button, player)
	end

	open[player].help = nil
end

local function showOptionsMenu(player)
	if open[player].leaderboard then
		closeLeaderboard(player)
	elseif open[player].powers then
		closePowers(player)
	elseif open[player].help then
		removeHelpMenu(player)
	end
	open[player].options = true

	addWindow(6, translatedMessage("options", player), player, 168, 46, 365, 260)
	addButton(6, "Close", "close_options", player, 185, 346, 426, 20, false)

	addToggle(1, player, players_file[player].parkour.ckpart == 1) -- particles for checkpoints
	addToggle(2, player, players_file[player].parkour.keyboard == 1) -- qwerty keyboard
	addToggle(3, player, players_file[player].parkour.mort == 1) -- M or DEL hotkey
	addToggle(4, player, players_file[player].parkour.pcool == 1) -- power cooldowns
	addToggle(5, player, players_file[player].parkour.pbut == 1) -- powers button
	addToggle(6, player, players_file[player].parkour.hbut == 1) -- help button
	addToggle(7, player, players_file[player].parkour.congrats == 1) -- congratulations message
	addToggle(8, player, players_file[player].parkour.help == 1) -- no help indicator
end

local function showHelpMenu(player, tab)
	if open[player].leaderboard then
		closeLeaderboard(player)
	elseif open[player].powers then
		closePowers(player)
	elseif open[player].options then
		removeOptionsMenu(player)
	end
	open[player].help = true

	if scrolldata.players[player] and scrolldata.players[player].img then
		tfm.exec.removeImage(scrolldata.players[player].img)
		tfm.exec.removeImage(scrolldata.players[player].behind_img)
	end
	scrolldata.players[player] = nil

	addWindow(7, scrolldata.texts[player_langs[player].name .. "_help_" .. tab], player, 100, 50, 500, 260, true)

	ui.addTextArea(10000, "", player, 155, 55, 490, 30, 0x1c3a3e, 0x1c3a3e, 1, true)
	ui.addTextArea(10001, "", player, 155, 358, 490, 17, 0x1c3a3e, 0x1c3a3e, 1, true)

	addButton(7, translatedMessage("help", player), "help:help", player, 160, 60, 80, 18, tab == "help")
	addButton(8, translatedMessage("staff", player), "help:staff", player, 260, 60, 80, 18, tab == "staff")
	addButton(9, translatedMessage("rules", player), "help:rules", player, 360, 60, 80, 18, tab == "rules")
	addButton(10, translatedMessage("contribute", player), "help:contribute", player, 460, 60, 80, 18, tab == "contribute")
	addButton(11, translatedMessage("changelog", player), "help:changelog", player, 560, 60, 80, 18, tab == "changelog")

	addButton(12, "", "close_help", player, 160, 362, 480, 10, false)
	ui.addTextArea(10002, "<a href='event:close_help'><p align='center'>Close\n", player, 160, 358, 480, 15, 0, 0, 0, true)
end

local function capitalize(str)
	local first = string.sub(str, 1, 1)
	if first == "+" then
		return "+" .. string.upper(string.sub(str, 2, 2)) .. string.lower(string.sub(str, 3))
	else
		return string.upper(first) .. string.lower(string.sub(str, 2))
	end
end

local function setNameColor(player)
	tfm.exec.setNameColor(
		player,

		victory[player] and 0xFEFF00 -- has won
		or (ranks.admin[player] or ranks.bot[player]) and 0xE7342A -- admin / bot
		or ranks.manager[player] and 0xD0A9F0 -- manager
		or (ranks.mod[player] or ranks.trainee[player]) and 0xFFAAAA -- moderator
		or ranks.mapper[player] and 0x25C059 -- mapper
		or ranks.translator[player] and 0xE0B856 -- translator
		or (room.xmlMapInfo and player == room.xmlMapInfo.author) and 0x10FFF3 -- author of the map
		or 0x148DE6 -- default
	)
end

local function showLeaderboard(player, page, week)
	if open[player].powers then
		closePowers(player)
	elseif open[player].options then
		removeOptionsMenu(player)
	elseif open[player].help then
		removeHelpMenu(player)
	end
	open[player].leaderboard = true

	local images = open[player].images
	for index = 1, images._count do
		tfm.exec.removeImage(images[index])
	end
	images._count = 0

	local max_pages = week and max_weekleaderboard_pages or max_leaderboard_pages
	if not page or page < 0 then
		page = 0
	elseif page > max_pages then
		page = max_pages
	end

	addWindow(
		1,
		string.format(
			"<p align='center'><font size='28'><B><D>%s</D></B></font>\n<font color='#32585E'>%s</font></p>",
			translatedMessage("leaderboard", player),
			string.rep("¯", 50)
		),
		player,
		168, 46, 365, 260
	)
	ui.addTextArea(1, '<V><p align="center">' .. translatedMessage("position", player), player, 180, 100, 50, 20, 1, 1, 0, true)
	ui.addTextArea(2, '<V><p align="center">' .. translatedMessage("username", player), player, 246, 100, 176, 20, 1, 1, 0, true)
	ui.addTextArea(3, '<V><p align="center">' .. translatedMessage("community", player), player, 435, 100, 70, 20, 1, 1, 0, true)
	ui.addTextArea(4, '<V><p align="center">' .. translatedMessage("completed", player), player, 518, 100, 105, 20, 1, 1, 0, true)

	ui.addTextArea(7, "", player, 435, 130, 70, 235, 0x203F43, 0x193E46, 1, true)
	default_leaderboard_user[2] = translatedMessage("unknown", player)
	local positions, names, completed = "", "", ""
	local position, row
	for index = page * 14, page * 14 + 13 do
		position = index + 1
		if position > (week and max_weekleaderboard_rows or max_leaderboard_rows) then break end
		positions = positions .. "#" .. position .. "\n"
		row = (week and weekleaderboard or leaderboard)[position] or default_leaderboard_user

		if position == 1 then
			names = names .. "<cs>" .. row[2] .. "</cs>\n"
		elseif position == 2 then
			names = names .. "<n>" .. row[2] .. "</n>\n"
		elseif position == 3 then
			names = names .. "<ce>" .. row[2] .. "</ce>\n"
		else
			names = names .. row[2] .. "\n"
		end

		completed = completed .. row[3] .. "\n"

		images._count = images._count + 1
		images[images._count] = tfm.exec.addImage(
			community_images[row[4]] or community_images["xx"],
			"&1",
			460,
			134 + 14 * (index - page * 14),
			player
		)
	end
	ui.addTextArea(5, "<font size='12'><p align='center'><v>" .. positions , player, 183, 130, 50 , 235, 0x203F43, 0x193E46, 1, true)
	ui.addTextArea(6, "<font size='12'><p align='center'><t>" .. names     , player, 246, 130, 176, 235, 0x203F43, 0x193E46, 1, true)
	ui.addTextArea(8, "<font size='12'><p align='center'><vp>" .. completed, player, 518, 130, 100, 235, 0x203F43, 0x193E46, 1, true)

	local lb_type = week and 2 or 1
	addButton(1, "&lt;\n", "leaderboard_p:".. lb_type .. ":" .. page - 1, player, 185, 346, 40, 20, not (page > 0)        )
	addButton(2, "&gt;\n", "leaderboard_p:".. lb_type .. ":" .. page + 1, player, 580, 346, 40, 20, not (page < max_pages))

	addButton(3, translatedMessage("overall_lb", player) .. "\n", "leaderboard_t:1", player, 240, 346, 155, 20, not week)
	addButton(4, translatedMessage("weekly_lb" , player) .. "\n", "leaderboard_t:2", player, 410, 346, 155, 20, week    )
end

local function showPowers(player, page)
	if not players_file[player] then return end

	if open[player].leaderboard then
		closeLeaderboard(player)
	elseif open[player].options then
		removeOptionsMenu(player)
	elseif open[player].help then
		removeHelpMenu(player)
	end
	open[player].powers = true

	local images = open[player].images
	for index = 1, images._count do
		tfm.exec.removeImage(images[index])
	end
	images._count = 0

	addWindow(1, "<p align='center'><font size='40'><b>" .. translatedMessage("powers", player), player, 150, 76, 400, 200)
	ui.addTextArea(1, "", player, 160, 140, 480, 195, 0x1D464F, 0x193E46, 1, true)

	local completed = players_file[player].parkour.c
	local player_pos = leaderboard[player] or max_leaderboard_rows + 1
	local power, canUse
	for index = page * 3, page * 3 + 2 do
		power = powers[index + 1]
		if power then
			if power.ranking then
				canUse = player_pos <= power.ranking
			else
				canUse = completed >= power.maps
			end
			ui.addTextArea(
				3000 + index,
				string.format(
					"<p align='center'><b><d>%s\n\n\n\n\n\n\n\n<n>%s",
					power.name and translatedMessage(power.name, player) or "undefined",
					canUse and (
						power.click and
						translatedMessage("click", player) or
						translatedMessage("press", player, player_keys[player][power])
					) or (
						power.ranking and
						translatedMessage("ranking_pos", player, power.ranking) or
						completed .. "/" .. power.maps
					)
				),
				player,
				170 + (index - page * 3) * 160,
				150,
				140,
				125,
				0x1c3a3e,
				0x193e46,
				1,
				true
			)
			images._count = images._count + 1
			images[images._count] = tfm.exec.addImage(
				power.image.url,
				"&1",
				power.image.x + 170 + (index - page * 3) * 160,
				power.image.y + 150,
				player
			)
		else
			ui.removeTextArea(3000 + index, player)
		end
	end

	ui.addTextArea(2, translatedMessage("completed_maps", player, completed), player, 230, 300, 340, 20, 0x1c3a3e, 0x193E46, 1, true)

	addButton(1, "&lt;   ", "power:" .. page - 1, player, 170, 300, 40, 20, not (page > 0)          )
	addButton(2, "&gt;   ", "power:" .. page + 1, player, 590, 300, 40, 20, not powers[page * 3 + 3])
end

local function toggleLeaderboard(player)
	if open[player].leaderboard then
		closeLeaderboard(player)
	else
		showLeaderboard(player, 0)
	end
end

local function showPowersButton(player)
	powers_img[player] = tfm.exec.addImage("17136ef539e.png", ":1", 744, 32, player)
	ui.addTextArea(0, "<a href='event:powers'><font size='50'>  </font></a>", player, 739, 32, 30, 32, 0, 0, 0, true)
end

local function showHelpButton(player, x)
	help_img[player] = tfm.exec.addImage("17136f9eefd.png", ":1", x, 32, player)
	ui.addTextArea(-2, "<a href='event:help_button'><font size='50'>  </font></a>", player, x - 5, 32, 30, 32, 0, 0, 0, true)
end

local function removePowersButton(player)
	tfm.exec.removeImage(powers_img[player])
	ui.removeTextArea(0, player)
end

local function removeHelpButton(player)
	tfm.exec.removeImage(help_img[player])
	ui.removeTextArea(-2, player)
end

onEvent("TextAreaCallback", function(id, player, callback)
	local position = string.find(callback, ":", 1, true)
	local action, args
	if not position then
		action = callback
	else
		action = string.sub(callback, 1, position - 1)
		args = string.sub(callback, position + 1)
	end

	if action == "powers" then
		if open[player].powers then
			closePowers(player)
		else
			showPowers(player, 0)
		end
	elseif action == "help_button" then
		if open[player].help then
			removeHelpMenu(player)
		else
			showHelpMenu(player, "help")
		end
	elseif action == "leaderboard" then
		if open[player].leaderboard then
			closeLeaderboard(player)
		else
			showLeaderboard(player, 0)
		end
	elseif action == "power" then
		showPowers(player, tonumber(args) or 0)
	elseif action == "leaderboard_p" then
		local lb_type, page = string.match(args, "([12]):(%d+)")
		showLeaderboard(player, tonumber(page) or 0, lb_type == "2")
	elseif action == "leaderboard_t" then
		showLeaderboard(player, 0, args == "2")
	elseif action == "settings" then
		if open[player].options then
			removeOptionsMenu(player)
		else
			showOptionsMenu(player)
		end
	elseif action == "close_options" then
		removeOptionsMenu(player)
	elseif action == "close_help" then
		removeHelpMenu(player)
	elseif action == "help" then
		if args ~= "help" and args ~= "staff" and args ~= "rules" and args ~= "contribute" and args ~= "changelog" then return end
		showHelpMenu(player, args)
	elseif action == "discord" then
		tfm.exec.chatMessage("<rose>" .. links.discord, player)
	elseif action == "map_submission" then
		tfm.exec.chatMessage("<rose>" .. links.maps, player)
	elseif action == "donate" then
		tfm.exec.chatMessage("<rose>" .. links.donation, player)
	elseif action == "github" then
		tfm.exec.chatMessage("<rose>" .. links.github, player)
	elseif action == "toggle" then
		local t_id, state = string.match(args, "^(%d+):([01])$")
		if not t_id then return end
		state = state == "1"

		if t_id == "1" then -- particles for checkpoints
			players_file[player].parkour.ckpart = state and 1 or 0
			ck.particles[player] = state

			if state then
				if ck.images[player] then
					tfm.exec.removeImage(ck.images[player])
				end
			else
				addCheckpointImage(player)
			end

		elseif t_id == "2" then -- qwerty keyboard
			players_file[player].parkour.keyboard = state and 1 or 0

			if victory[player] then
				unbind(player)
			end
			player_keys[player] = state and keyPowers.qwerty or keyPowers.azerty
			if victory[player] and not no_powers[player] then
				bindNecessary(player)
			end

		elseif t_id == "3" then -- M or DEL hotkey
			players_file[player].parkour.mort = state and 1 or 0

			if state then
				system.bindKeyboard(player, 77, true, true)
				system.bindKeyboard(player, 46, true, false)
			else
				system.bindKeyboard(player, 77, true, false)
				system.bindKeyboard(player, 46, true, true)
			end
		elseif t_id == "4" then -- power cooldowns
			players_file[player].parkour.pcool = state and 1 or 0

		elseif t_id == "5" then -- powers button
			players_file[player].parkour.pbut = state and 1 or 0

			if state then
				showPowersButton(player)
				if players_file[player].parkour.hbut == 1 then
					removeHelpButton(player)
					showHelpButton(player, 714)
				end
			else
				removePowersButton(player)
				if players_file[player].parkour.hbut == 1 then
					removeHelpButton(player)
					showHelpButton(player, 744)
				end
			end

		elseif t_id == "6" then -- help button
			players_file[player].parkour.hbut = state and 1 or 0

			if state then
				showHelpButton(player, players_file[player].parkour.pbut == 1 and 714 or 744)
			else
				removeHelpButton(player)
			end

		elseif t_id == "7" then -- congratulations message
			players_file[player].parkour.congrats = state and 1 or 0

		elseif t_id == "8" then -- no help indicator
			players_file[player].parkour.help = state and 1 or 0

			if not state then
				if no_help[player] then
					tfm.exec.removeImage(no_help[player])
					no_help[player] = nil
				end
			else
				no_help[player] = tfm.exec.addImage("1722eeef19f.png", "$" .. player, -10, -35)
			end
		end

		addToggle(tonumber(t_id), player, state)
	end
end)

onEvent("GameDataLoaded", function(data)
	if data.banned then
		bans = {[0] = true}
		for id, value in next, data.banned do
			if value == 1 or os.time() < value then
				bans[tonumber(id)] = true
			end
		end

		local id, ban
		for player, pdata in next, players_file do
			if room.playerList[player] and in_room[player] then
				id = room.playerList[player].id
				ban = data.banned[tostring(id)]

				if ban then
					if ban == 1 then
						pdata.banned = 2
					else
						pdata.banned = ban
					end
					savePlayerData(player)
					sendPacket(2, id .. "\000" .. ban)
				end

				if pdata.banned and (pdata.banned == 2 or os.time() < pdata.banned) then
					bans[id] = true

					if pdata.banned == 2 then
						translatedChatMessage("permbanned", player)
					else
						local minutes = math.floor((pdata.banned - os.time()) / 1000 / 60)
						translatedChatMessage("tempbanned", player, minutes)
					end
				end
			end
		end

		for player, data in next, room.playerList do
			if in_room[player] and bans[data.id] and not spec_mode[player] then
				spec_mode[player] = true
				tfm.exec.killPlayer(player)

				player_count = player_count - 1
				if victory[player] then
					victory_count = victory_count - 1
				elseif player_count == victory_count and not less_time then
					tfm.exec.setGameTime(20)
					less_time = true
				end
			end
		end
	end
end)

onEvent("PlayerRespawn", function(player)
	setNameColor(player)
	if no_help[player] then
		no_help[player] = tfm.exec.addImage("1722eeef19f.png", "$" .. player, -10, -35)
	end
end)

onEvent("NewGame", function()
	no_help = {}

	for player in next, in_room do
		if players_file[player] and players_file[player].parkour.help == 1 then
			no_help[player] = tfm.exec.addImage("1722eeef19f.png", "$" .. player, -10, -35)
		end
		setNameColor(player)
	end

	if is_tribe then
		translatedChatMessage("tribe_house")
	elseif room.uniquePlayers < min_save then
		translatedChatMessage("min_players", nil, room.uniquePlayers, min_save)
	end
end)

onEvent("NewPlayer", function(player)
	tfm.exec.lowerSyncDelay(player)

	translatedChatMessage("welcome", player)
	translatedChatMessage("staff_power", player)
	translatedChatMessage("no_help", player)

	system.bindKeyboard(player, 38, true, true)
	system.bindKeyboard(player, 40, true, true)
	system.bindKeyboard(player, 76, true, true)
	system.bindKeyboard(player, 79, true, true)
	system.bindKeyboard(player, 72, true, true)
	system.bindKeyboard(player, 80, true, true)

	tfm.exec.addImage("1713705576b.png", ":1", 772, 32, player)
	ui.addTextArea(-1, "<a href='event:settings'><font size='50'>  </font></a>", player, 767, 32, 30, 32, 0, 0, 0, true)

	for _player, img in next, no_help do
		tfm.exec.removeImage(img)
		no_help[_player] = tfm.exec.addImage("1722eeef19f.png", "$" .. _player, -10, -35)
	end

	if levels then
		if is_tribe then
			translatedChatMessage("tribe_house", player)
		elseif room.uniquePlayers < min_save then
			translatedChatMessage("min_players", player, room.uniquePlayers, min_save)
		end
	end

	open[player] = {
		images = {_count = 0}
	}
	kill_cooldown[player] = 0

	for _player in next, in_room do
		setNameColor(_player)
	end
end)

onEvent("PlayerDataParsed", function(player, data)
	system.bindKeyboard(player, data.parkour.mort == 1 and 77 or 46, true, true)
	if data.parkour.pbut == 1 then
		showPowersButton(player)
	end
	if data.parkour.hbut == 1 then
		showHelpButton(player, data.parkour.pbut == 1 and 714 or 744)
	end
	if data.parkour.help == 1 then
		no_help[player] = tfm.exec.addImage("1722eeef19f.png", "$" .. player, -10, -35)
	end

	if data.banned and (data.banned == 2 or os.time() < data.banned) then
		bans[room.playerList[player].id] = true

		if not spec_mode[player] then
			spec_mode[player] = true
			tfm.exec.killPlayer(player)

			player_count = player_count - 1
			if victory[player] then
				victory_count = victory_count - 1
			elseif player_count == victory_count and not less_time then
				tfm.exec.setGameTime(20)
				less_time = true
			end
		end

		if data.banned == 2 then
			translatedChatMessage("permbanned", player)
		else
			local minutes = math.floor((data.banned - os.time()) / 1000 / 60)
			translatedChatMessage("tempbanned", player, minutes)
		end
	end
end)

onEvent("PlayerWon", function(player)
	local id = room.playerList[player].id
	if bans[id] then return end

	-- If the player joined the room after the map started,
	-- eventPlayerWon's time is wrong. Also, eventPlayerWon's time sometimes bug.
	local taken = (os.time() - (generated_at[player] or map_start)) / 1000

	if count_stats and taken <= 45 and not review_mode and not is_tribe then
		sendPacket(1, room.name .. "\000" .. player .. "\000" .. id .. "\000" .. room.currentMap .. "\000" .. taken)
	end

	if players_file[player].parkour.congrats == 0 then
		translatedChatMessage("finished", player, player, taken)
	end

	for _player in next, in_room do
		if players_file[_player] and players_file[_player].parkour.congrats == 1 then
			translatedChatMessage("finished", _player, player, taken)
		end
	end

	if is_tribe then
		translatedChatMessage("tribe_house", player)
	elseif room.uniquePlayers < min_save then
		translatedChatMessage("min_players", player, room.uniquePlayers, min_save)
	else
		local power
		for index = 1, #powers do
			power = powers[index]

			if players_file[player].parkour.c == power.maps then
				for _player in next, in_room do
					translatedChatMessage("unlocked_power", _player, player, translatedMessage(power.name, _player))
				end
				break
			end
		end
	end
end)

onEvent("Loop", function()
	local now = os.time()
	if update_at >= now then
		local minutes = math.floor((update_at - now) / 60000)
		local seconds = math.floor((update_at - now) / 1000) % 60
		for player in next, in_room do
			ui.addTextArea(100000, translatedMessage("module_update", player, minutes, seconds), player, 0, 380, 800, 20, 1, 1, 0.7, true)
		end
	end
	if staff_people.timeout > 0 and now >= staff_people.timeout then
		for index = 1, #staff_people.to_send do
			sendStaffList(staff_people.to_send[index])
		end
		staff_people.timeout = 0
	end
end)

onEvent("ChatCommand", function(player, msg)
	local cmd, args, pointer = "", {}, -1
	for slice in string.gmatch(msg, "%S+") do
		pointer = pointer + 1
		if pointer == 0 then
			cmd = string.lower(slice)
		else
			args[pointer] = slice
		end
	end

	if cmd == "lb" then
		toggleLeaderboard(player)

	elseif cmd == "donate" then
		tfm.exec.chatMessage("<rose>" .. links.donation, player)

	elseif cmd == "help" then
		showHelpMenu(player, "help")

	elseif cmd == "review" then
		local tribe_cond = is_tribe and room.playerList[player].tribeName == string.sub(room.name, 3)
		local normal_cond = perms[player] and perms[player].enable_review and (string.find(room.name, "review") or ranks.admin[player])
		if not tribe_cond and not normal_cond then
			return tfm.exec.chatMessage("<v>[#] <r>You can't toggle review mode in this room.", player)
		end

		review_mode = not review_mode
		if review_mode then
			tfm.exec.chatMessage("<v>[#] <d>Review mode enabled by " .. player .. ".")
		else
			tfm.exec.chatMessage("<v>[#] <d>Review mode disabled by " .. player .. ".")
		end

	elseif cmd == "pw" then
		if not perms[player] or not perms[player].enable_review then return end

		if not review_mode and not ranks.admin[player] then
			return tfm.exec.chatMessage("<v>[#] <r>You can't set the password of a room without review mode.", player)
		end
		if roompw.owner and roompw.owner ~= player and not ranks.admin[player] then
			return tfm.exec.chatMessage("<v>[#] <r>You can't set the password of this room. Ask " .. roompw.owner .. " to do so.", player)
		end

		local password = table.concat(args, " ")
		tfm.exec.setRoomPassword(password)

		if password == "" then
			roompw.owner = nil
			roompw.password = nil
			return tfm.exec.chatMessage("<v>[#] <d>Room password disabled by " .. player .. ".")
		end
		tfm.exec.chatMessage("<v>[#] <d>Room password changed by " .. player .. ".")
		tfm.exec.chatMessage("<v>[#] <d>You set the room password to: " .. password, player)

		if not roompw.owner then
			roompw.owner = player
		end
		roompw.password = password

	elseif cmd == "roomlimit" then
		if not ranks.admin[player] then return end

		local limit = tonumber(args[1])
		if not limit then
			return translatedChatMessage("invalid_syntax", player)
		end

		tfm.exec.setRoomMaxPlayers(limit)
		tfm.exec.chatMessage("<v>[#] <d>Set room max players to " .. limit .. ".", player)

	elseif cmd == "langue" then
		if pointer == 0 then
			tfm.exec.chatMessage("<v>[#] <d>Available languages:", player)
			for name, data in next, translations do
				if name ~= "pt" then
					tfm.exec.chatMessage("<d>" .. name .. " - " .. data.fullname, player)
				end
			end
			tfm.exec.chatMessage("<d>Type <b>!langue ID</b> to switch your language.", player)
		else
			local lang = string.lower(args[1])
			if translations[lang] then
				player_langs[player] = translations[lang]
				translatedChatMessage("new_lang", player)
			else
				tfm.exec.chatMessage("<v>[#] <r>Unknown language: <b>" .. lang .. "</b>", player)
			end
		end

	elseif cmd == "cp" then
		if not review_mode then return end

		local checkpoint = tonumber(args[1])
		if not checkpoint then
			return translatedChatMessage("invalid_syntax", player)
		end

		if not levels[checkpoint] then return end

		players_level[player] = checkpoint
		tfm.exec.setPlayerScore(player, checkpoint, false)
		tfm.exec.killPlayer(player)

		if ck.particles[player] == false then
			tfm.exec.removeImage(ck.images[player])
			local next_level = levels[checkpoint + 1]
			if next_level then
				addCheckpointImage(player, next_level.x, next_level.y)
			end
		end

	elseif cmd == "staff" then
		local now = os.time()
		if now >= staff_people.next_check then
			staff_people.timeout = now + 1000
			staff_people.next_check = now + 61000
			staff_people.to_send = {player}
			staff_people.texts = {}

			local texts = staff_people.texts
			local text, first
			for player, ranks in next, player_ranks do
				text = "\n- <v>" .. player .. "</v> ("
				first = true
				for rank in next, ranks do
					if not hidden_ranks[rank] then
						rank = rank == "trainee" and "mod trainee" or rank
						if first then
							text = text .. rank
							first = false
						else
							text = text .. ", " .. rank
						end
					end
				end
				if not first then
					texts[player] = text .. ")"
				end
			end

			online = {}
			for player in next, texts do
				if in_room[player] then
					online[player] = true
				else
					system.loadPlayerData(player)
				end
			end
		elseif now < staff_people.timeout then
			staff_people.to_send[#staff_people.to_send + 1] = player
		else
			sendStaffList(player)
		end

	elseif cmd == "map" then
		if not perms[player] or not perms[player].change_map then return end

		if pointer > 0 then
			count_stats = false
			tfm.exec.newGame(args[1])
		elseif os.time() < map_change_cd and not review_mode then
			tfm.exec.chatMessage("<v>[#] <r>You need to wait a few seconds before changing the map.", player)
		else
			newMap()
		end

	elseif cmd == "forcestats" then
		if not ranks.admin[player] then return end

		count_stats = true
		tfm.exec.chatMessage("<v>[#] <d>count_stats set to true", player)

	elseif cmd == "spec" then
		if not perms[player] or not perms[player].spectate then return end

		if not spec_mode[player] then
			spec_mode[player] = true
			tfm.exec.killPlayer(player)

			player_count = player_count - 1
			if victory[player] then
				victory_count = victory_count - 1
			elseif player_count == victory_count and not less_time then
				tfm.exec.setGameTime(20)
				less_time = true
			end
		else
			spec_mode[player] = nil

			if (not levels) or (not players_level[player]) then return end

			local level = levels[ players_level[player] ]

			tfm.exec.respawnPlayer(player)
			tfm.exec.movePlayer(player, level.x, level.y)

			player_count = player_count + 1
			if victory[player] then
				victory_count = victory_count + 1
			end
		end

	elseif cmd == "room" then
		if not perms[player] or not perms[player].get_player_room then return end

		if pointer == 0 then
			return translatedChatMessage("invalid_syntax", player)
		end

		local fetching = capitalize(args[1])
		fetching_player_room[fetching] = {player, os.time() + 1000}
		system.loadPlayerData(fetching)

	elseif cmd == "op" then
		showOptionsMenu(player)
	end
end)

onEvent("Keyboard", function(player, key)
	if key == 38 or key == 40 then
		if open[player].help then
			scrollWindow(7, player, key == 38)
		end
	elseif key == 76 then
		if loaded_leaderboard then
			toggleLeaderboard(player)
		else
			return translatedChatMessage("leaderboard_not_loaded", player)
		end
	elseif key == 77 or key == 46 then
		local now = os.time()
		if now >= (kill_cooldown[player] or os.time()) then
			tfm.exec.killPlayer(player)
			kill_cooldown[player] = now + 1000
		end
	elseif key == 79 then
		if open[player].options then
			removeOptionsMenu(player)
		else
			showOptionsMenu(player)
		end
	elseif key == 72 then
		if open[player].help then
			removeHelpMenu(player)
		else
			showHelpMenu(player, "help")
		end
	elseif key == 80 then
		if open[player].powers then
			closePowers(player)
		else
			showPowers(player, 0)
		end
	end
end)

onEvent("GameStart", function()
	local help_texts = {"help_help", "help_staff", "help_rules", "help_contribute", "help_changelog"}

	local count, page, newline, key, text
	for name, translation in next, translations do
		for index = 1, #help_texts do
			key = name .. "_" .. help_texts[index]
			text = translation[help_texts[index]]
			count = 0
			scrolldata.texts[key] = {}
			text = "\n" .. text
			for slice = 1, #text, (help_texts[index] == "help_staff" and 700 or 800) + (name == "ru" and 250 or 0) do
				page = string.sub(text, slice)
				newline = string.find(page, "\n")
				if newline then
					page = string.sub(page, newline)
					while string.sub(page, 1, 1) == "\n" do
						page = string.sub(page, 2)
					end
					count = count + 1
					scrolldata.texts[key][count] = page
				else
					break
				end
			end
			if #text < 1100 or help_texts[index] == "help_help" or help_texts[index] == "help_contribute" then
				scrolldata.texts[key] = string.sub(text, 2)
			end
		end
	end

	tfm.exec.disableMinimalistMode(true)
	system.disableChatCommandDisplay("lb", true)
	system.disableChatCommandDisplay("map", true)
	system.disableChatCommandDisplay("spec", true)
	system.disableChatCommandDisplay("op", true)
	system.disableChatCommandDisplay("donate", true)
	system.disableChatCommandDisplay("help", true)
	system.disableChatCommandDisplay("staff", true)
	system.disableChatCommandDisplay("room", true)
	system.disableChatCommandDisplay("review", true)
	system.disableChatCommandDisplay("pw", true)
	system.disableChatCommandDisplay("cp", true)
	system.disableChatCommandDisplay("forcestats", true)
	system.disableChatCommandDisplay("roomlimit", true)
	system.disableChatCommandDisplay("langue", true)
end)

onEvent("PacketReceived", function(packet_id, packet)
	if packet_id == 1 then -- game update
		update_at = os.time() + 60000
	elseif packet_id == 2 then -- !kill
		local player = string.match(packet, "^([^\000]+)\000[^\000]+$")
		if in_room[player] then
			system.loadPlayerData(player)
		end
	elseif packet_id == 3 then -- !ban
		local player, val = string.match(packet, "^([^\000]+)\000[^\000]+\000([^\000]+)$")
		local file, data = players_file[player], room.playerList[player]
		if in_room[player] and data and file then
			file.banned = val == "1" and 2 or tonumber(val)
			bans[data.id] = file.banned == 2 or os.time() < file.banned

			if bans[data.id] then
				if not spec_mode[player] then
					spec_mode[player] = true
					tfm.exec.killPlayer(player)

					player_count = player_count - 1
					if victory[player] then
						victory_count = victory_count - 1
					elseif player_count == victory_count and not less_time then
						tfm.exec.setGameTime(20)
						less_time = true
					end
				end

				if file.banned == 2 then
					translatedChatMessage("permbanned", player)
				else
					local minutes = math.floor((file.banned - os.time()) / 1000 / 60)
					translatedChatMessage("tempbanned", player, minutes)
				end

			else
				if spec_mode[player] then
					spec_mode[player] = nil

					if levels and players_level[player] then
						local level = levels[ players_level[player] ]

						tfm.exec.respawnPlayer(player)
						tfm.exec.movePlayer(player, level.x, level.y)

						player_count = player_count + 1
						if victory[player] then
							victory_count = victory_count + 1
						end
					end
				end
			end

			savePlayerData(player)
			sendPacket(2, data.id .. "\000" .. val)
		end
	elseif packet_id == 4 then -- !announce
		tfm.exec.chatMessage("<vi>[#parkour] <d>" .. packet)
	elseif packet_id == 5 then -- !cannounce
		local commu, msg = string.match(packet, "^([^\000]+)\000(.+)$")
		if commu == room.community then
			tfm.exec.chatMessage("<vi>[" .. commu .. "] [#parkour] <d>" .. msg)
		end
	elseif packet_id == 6 then -- pw request
		if packet == room.name then
			if roompw.password then
				sendPacket(5, room.name .. "\000" .. roompw.password .. "\000" .. roompw.owner)
			else
				sendPacket(5, room.name .. "\000")
			end
		end
	end
end)