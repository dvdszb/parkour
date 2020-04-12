translations.es = {
	-- Error messages
	corrupt_map = "<r>Mapa corrupto. Cargando otro.",
	corrupt_map_vanilla = "<r>[ERROR] <n>No se pudo obtener información de este mapa.",
	corrupt_map_mouse_start = "<r>[ERROR] <n>El mapa tiene que tener un punto de inicio de los ratones.",
	corrupt_map_needing_chair = "<r>[ERROR] <n>El mapa tiene que tener el sillón del final.",
	corrupt_map_missing_checkpoints = "<r>[ERROR] <n>El mapa tiene que tener al menos un checkpoint (anclaje amarillo).",
	corrupt_data = "<r>Tristemente, tus datos estaban corruptos. Se han reiniciado.",
	min_players = "<r>Para guardar datos, deben haber al menos 4 jugadores únicos en la sala. <bl>[%s/%s]",
	tribe_house = "<r>Para guardar datos, debes jugar fuera de una casa de tribu.",
	invalid_syntax = "<r>Sintaxis inválida.",
	user_not_in_room = "<r>El usario <n2>%s</n2> no está en la sala.",
	arg_must_be_id = "<r>El argumento debe ser una id válida.",
	cant_update = "<r>No se pueden actualizar los rangos del jugador. Inténtalo más tarde.",
	cant_edit = "<r>No puedes editar los rangos del jugador <n2>%s</n2>.",
	invalid_rank = "<r>Rango inválido: <n2>%s",
	code_error = "<r>Apareció un error: <bl>%s-%s-%s %s",
	panic_mode = "<r>El módulo entró en modo pánico.",
	public_panic = "<r>Espera un minuto mientras viene un bot y reinicia el módulo.",
	tribe_panic = "<r>Por favor, escribe <n2>/module parkour</n2> para reiniciar el módulo.",
	emergency_mode = "<r>Empezando apagado de emergencia, no se admiten más jugadores. Por favor ve a otra sala #parkour.",
	bot_requested = "<r>El bot ha sido alertado. Debería venir en unos segundos.",
	stream_failure = "<r>Fallo interno del canal de transmisión. No se pueden transmitir datos.",
	maps_not_available = "<r>El submodo 'maps' de #parkour solo está disponible en la sala <n2>*#parkour0maps</n2>.",
	version_mismatch = "<r>Las versiones del bot (<d>%s</d>) y de lua (<d>%s</d>) no coinciden. No se puede iniciar el sistema.",
	missing_bot = "<r>Falta el bot. Espera un minuto o menciona a @Tocu#0018 en discord: <d>%s</d>",
	invalid_length = "<r>Tu mensaje debe tener entre 10 y 100 caracteres. Tiene <n2>%s</n2>.",
	invalid_map = "<r>Mapa inválido.",
	map_does_not_exist = "<r>El mapa no existe o no puede ser cargado. Inténtalo más tarde.",
	invalid_map_perm = "<r>El mapa no está en P22 ni en P41.",
	invalid_map_perm_specific = "<r>El mapa no está en P%s.",
	cant_use_this_map = "<r>El mapa tiene un pequeño bug y no puede ser usado.",
	invalid_map_p41 = "<r>El mapa está en P41, pero no está en la lista de mapas del módulo.",
	invalid_map_p22 = "<r>El mapa está en P22, pero está en la lista de mapas del módulo.",
	map_already_voting = "<r>El mapa ya tiene una discusión abierta.",
	not_enough_permissions = "<r>No tienes permisos suficientes para hacer eso.",
	already_depermed = "<r>El mapa ya está descategorizado.",
	already_permed = "<r>El mapa ya está categorizado.",
	cant_perm_right_now = "<r>No se puede cambiar la categoría de este mapa ahora mismo. Inténtalo más tarde.",
	already_killed = "<r>El jugador %s ya fue asesinado.",
	leaderboard_not_loaded = "<r>La tabla de clasificación aun no ha sido cargada. Espera un minuto.",

	-- Help window
	help = "Ayuda",
	staff = "Staff",
	rules = "Reglas",
	contribute = "Contribuir",
	help_help = "<p align = 'center'><font size = '14'>¡Bienvenido a <T>#parkour!</T></font>\n\n<font size = '12'><J>Tu objetivo es alcanzar todos los puntos de control hasta que completes el mapa.</J></font></p>\n\n<font size = '11'><N>• Presiona la tecla <O>O</O>, escribe <O>!op</O> o clickea el <O>botón de configuración</O> para abrir el <T>menú de opciones</T>.\n• Presiona la tecla <O>P</O> o clickea el <O>ícono de la mano</O> arriba a la derecha para abrir el <T>menú de poderes</T>.\n• Presiona la tecla <O>L</O> o escribe <O>!lb</O> para abrir el <T>ranking</T>.\n• Presiona la tecla <O>M</O> o <O>Delete</O> como atajo para <T>/mort</T>, podes alternarlas en el menú de <J>Opciones</J>.\n• Para conocer más acerca de nuestro <O>staff</O> y las <O>reglas de parkour</O>, clickea en las pestañas de <T>Staff</T> y <T>Reglas</T>.</font>\n\n<p align = 'center'><font size = '13'><T>¡Las contribuciones están abiertas! Para más detalles, ¡clickea en la pestaña <O>Contribuir</O>!</T></font></p>",
	help_staff = "<p align = 'center'><font size = '13'><r>NOTA: El staff de Parkour NO ES staff de Transformice y NO TIENEN ningún poder en el juego, sólamente dentro del módulo.</r>\nEl staff de Parkour se asegura de que el módulo corra bien con la menor cantidad de problemas, y siempre están disponibles para ayudar a los jugadores cuando sea necesario.</font></p>\nPuedes escribir <D>!staff</D> en el chat para ver la lista de staff.\n\n<font color = '#E7342A'>Administradores:</font> Son los responsables de mantener el módulo añadiendo nuevas actualizaciones y arreglando bugs.\n\n<font color = '#843DA4'>Lideres de Equipos:</font> Ellos supervisan los equipos de Moderadores y Mappers, asegurándose de que hagan un buen trabajo. También son los responsables de reclutar nuevos miembros al staff.\n\n<font color = '#FFAAAA'>Moderadores:</font> Son los responsables de ejercer las reglas del módulo y sancionar a quienes no las sigan.\n\n<font color = '#25C059'>Mappers:</font> Son los responsables de revisar, añadir y quitar mapas en el módulo para asegurarse de que tengas un buen gameplay.",
	help_rules = "<font size = '13'><B><J>Todas las reglas en los Terminos y Condiciones de Transformice también aplican a #parkour</J></B></font>\n\nSi encuentras algún jugador rompiendo estas reglas, susurra a los moderadores de parkour en el juego. Si no hay moderadores online, es recomendable reportarlo en discord.\nCuando reportes, por favor agrega el servidor, el nombre de la sala, y el nombre del jugador.\n• Ej: en-#parkour10 Blank#3495 trollear\nEvidencia, como fotos, videos y gifs ayudan y son apreciados, pero no son necesarios.\n\n<font size = '11'>• No se permite el uso de <font color = '#ef1111'>hacks, glitches o bugs</font>\n• <font color = '#ef1111'>Farmear con VPN</font> será considerado un <B>abuso</B> y no está permitido. <p align = 'center'><font color = '#cc2222' size = '12'><B>\nCualquier persona rompiendo estas reglas será automáticamente baneado.</B></font></p>\n\n<font size = '12'>Transformice acepta el concepto de trollear. Pero <font color='#cc2222'><B>no está permitido en #parkour.</B></font></font>\n\n<p align = 'center'><J>Trollear es cuando un jugador intencionalmente usa sus poderes para hacer que otros jugadores no completen el mapa.</j></p>\n• Trollear como revancha <B>no es una razón válida</B> para trollear a alguien y aún así seras sancionado.\n• Ayudar a jugadores que no quieren completar el mapa con ayuda y no parar cuando te lo piden también es considerado trollear.\n• <J>Si un jugador no quiere ayuda, por favor ayuda a otros jugadores</J>. Sin embargo, si otro jugador necesita ayuda en el mismo punto, puedes ayudarlos [a los dos].\n\nSi un jugador es atrapado trolleando, será sancionado ya sea en base de tiempo o de rondas. Trollear repetidas veces llevará a sanciones más largas y severas.",
	help_contribute = "<font size='14'>El equipo de mantenimiento de parkour ama el código abierto, porque ayuda a la comunidad. Puedes ver y modificar el código fuente de #parkour en github <a href='event:github'><u>(click aquí)</u></a>.\n\nNosotros mantenemos el módulo de manera gratuita, por lo que cualquier ayuda (ya sea en el código, reportes de bugs, sugerencias) es bienvenida. También aceptamos donaciones, las cuales pueden ser hechas <a href='event:donate'><u>clickeando aquí</u></a>. Cualquier cantidad donada es apreciada y será destinada a mejorar #parkour.",

	-- Congratulation messages
	reached_level = "<d>¡Felicitaciones! Alcanzaste el nivel <vp>%s</vp>.",
	finished = "<d><o>%s</o> completó el parkour en <vp>%s</vp> segundos, <fc>¡felicitaciones!",
	unlocked_power = "<ce><d>%s</d> desbloqueó el poder <vp>%s<ce>.",
	enjoy = "<d>¡Disfruta tus nuevas habilidades!",

	-- Information messages
	paused_events = "<cep><b>[¡Advertencia!]</b> <n>El módulo está entrando en estado crítico y está siendo pausado.",
	resumed_events = "<n2>El módulo ha sido reanudado.",
	welcome = "<n>¡Bienvenido a <t>#parkour</t>!",
	discord = "<cs>¿Tienes alguna buena idea, reporte de bug o simplemente quieres hablar con otros jugadores? Entra a nuestro servidor de discord: <pt>%s</pt>",
	map_submissions = "<bv>¿Quieres ver tu mapa en el módulo? Publicalo aquí: <j>%s</j>",
	type_help = "<pt>¡Te recomendamos que escribas <d>!help</d> para ver información util!",
	data_saved = "<vp>Datos guardados.",
	action_within_minute = "<vp>La acción se aplicará dentro de un minuto.",
	rank_save = "<n2>Escribe <d>!rank save</d> para aplicar los cambios.",
	module_update = "<r><b>[¡Advertencia!]</b> <n>El módulo se actualizará en <d>%02d:%02d</d>.",
	mapping_loaded = "<j>[INFO] <n>Sistema de mapas <t>(v%s)</t> cargado.",
	mapper_joined = "<j>[INFO] <n><ce>%s</ce> <n2>(%s)</n2> entró a la sala.",
	mapper_left = "<j>[INFO] <n><ce>%s</ce> <n2>(%s)</n2> salió de la sala.",
	mapper_loaded = "<j>[INFO] <n><ce>%s</ce> cargó este mapa.",
	starting_perm_change = "<j>[INFO] <n>Empezando cambio de categoría...",
	got_map_info = "<j>[INFO] <n>Se obtuvo toda la información del mapa. Intentando cambiar la categoría...",
	perm_changed = "<j>[INFO] <n>Se cambió la categoría del mapa <ch>@%s</ch> desde <r>P%s</r> hacia <t>P%s</t> exitosamente.",
	leaderboard_loaded = "<j>La tabla de clasificación ha sido cargada. Presiona L para abrirla.",
	kill_minutes = "<R>Tus poderes fueron desactivados por %s minutos.",
	kill_map = "<R>Tus poderes fueron desactivados hasta el siguiente mapa.",

	-- Miscellaneous
	options = "<p align='center'><font size='20'>Opciones de Parkour</font></p>\n\nUsar partículas para los checkpoints\n\nUsar teclado <b>QWERTY</b> (desactivar si usas <b>AZERTY</b>)\n\nUsar la tecla <b>M</b> como atajo para <b>/mort</b> (desactivar si usas <b>DEL</b>)\n\nMostrar tiempos de espera de tus poderes\n\nMostrar el botón de poderes\n\nMostrar el botón de ayuda\n\nMostrar mensajes al completar un mapa",
	unknown = "Desconocido",
	powers = "Poderes",
	press = "<vp>Presiona %s",
	click = "<vp>Haz clic",
	completed_maps = "<p align='center'><BV><B>Mapas completados: %s</B></p></BV>",
	leaderboard = "Tabla de clasificación",
	position = "Posición",
	username = "Jugador",
	community = "Comunidad",
	completed = "Mapas completados",
	not_permed = "sin categoría",
	permed = "categorizado",
	points = "%d puntos",
	conversation_info = "<j>%s <bl>- @%s <vp>(%s, %s) %s\n<n><font size='10'>Empezado por <d>%s</d>. Último comentaro por <d>%s</d>. <d>%s</d> comentarios, <d>%s</d> sin leer.",
	map_info = "<p align='center'>Código: <bl>@%s</bl> <g>|</g> Autor: <j>%s</j> <g>|</g> Estado: <vp>%s, %s</vp> <g>|</g> Puntos: <vp>%s</vp>",
	permed_maps = "Mapas categorizados",
	ongoing_votations = "Discusiones abiertas",
	archived_votations = "Discusiones archivadas",
	open = "Abrir",
	not_archived = "no archivado",
	archived = "archivado",
	delete = "<r><a href='event:%s'>[eliminar]</a> ",
	see_restore = "<vp><a href='event:%s'>[ver]</a> <a href='event:%s'>[restaurar]</a> ",
	no_comments = "Sin comentarios.",
	deleted_by = "<r>[Mensaje eliminado por %s]",
	dearchive = "desarchivar", -- to dearchive
	archive = "archivar", -- to archive
	deperm = "descategorizar", -- to deperm
	perm = "categorizar", -- to perm
	map_actions_staff = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Comentar</j></a> <g>|</g> Tu voto: %s <g>|</g> <vp><a href='event:%s'>[%s]</a> <a href='event:%s'>[%s]</a> <a href='event:%s'>[cargar]</a></p>",
	map_actions_user = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Comentar</j></a></p>",
	load_from_thread = "<p align='center'><a href='event:load_custom'>Cargar mapa</a></p>",
	write_comment = "Escribe tu comentario aquí abajo",
	write_map = "Escribe el código de mapa aquí abajo",

	-- Power names
	balloon = "Globo",
	masterBalloon = "Globo Maestro",
	bubble = "Burbuja",
	fly = "Volar",
	snowball = "Bola de nieve",
	speed = "Velocidad",
	teleport = "Teletransporte",
	smallbox = "Caja pequeña",
	cloud = "Nube",
	rip = "Tumba",
	choco = "Chocolate",
}
