translations.br = {
	-- Error messages
	corrupt_map = "<r>Mapa corrompido. Carregando outro.",
	corrupt_map_vanilla = "<r>[ERROR] <n>Não foi possível obter informações deste mapa.",
	corrupt_map_mouse_start = "<r>[ERROR] <n>O mapa requer um ponto de partida (spawn).",
	corrupt_map_needing_chair = "<r>[ERROR] <n>O mapa requer a poltrona final.",
	corrupt_map_missing_checkpoints = "<r>[ERROR] <n>O mapa requer ao menos um checkpoint (prego amarelo).",
	corrupt_data = "<r>Infelizmente seus dados corromperam e foram reiniciados.",
	min_players = "<r>Para que dados sejam salvos, ao menos 4 jogadores únicos devem estar na sala. <bl>[%s/%s]",
	tribe_house = "<r>Para que dados sejam salvos, você precisa jogar fora de um cafofo de tribo.",
	invalid_syntax = "<r>Sintaxe inválida.",
	user_not_in_room = "<r>O usuário <n2>%s</n2> não está na sala.",
	arg_must_be_id = "<r>O argumento deve ser um ID válido.",
	cant_update = "<r>Não foi possível atualizar o cargo do jogador. Tente novamente mais tarde.",
	cant_edit = "<r>Você não pode editar o cargo do jogador <n2>%s</n2>.",
	invalid_rank = "<r>Cargo inválido: <n2>%s",
	code_error = "<r>Um erro aconteceu: <bl>%s-%s-%s %s",
	panic_mode = "<r>Módulo entrando em Modo Pânico.",
	public_panic = "<r>Espere um momento enquanto um bot entra na sala e reinicia o módulo.",
	tribe_panic = "<r>Por favor, digite <n2>/module parkour</n2> para reiniciar o módulo.",
	emergency_mode = "<r>Começando desativação de emergência, novos jogadores não serão mais permitidos. Por favor, vá para outra sala #parkour.",
	bot_requested = "<r>O bot foi requisitado. Ele virá em poucos segundos.",
	stream_failure = "<r>Erro interno entre canais. Não foi possível transmitir dados.",
	maps_not_available = "<r>Submodo #parkour 'maps' só está disponível na sala <n2>*#parkour0maps</n2>.",
	version_mismatch = "<r>Versões do Bot (<d>%s</d>) e lua (<d>%s</d>) não são equivalentes. Não foi possível iniciar o sistema.",
	missing_bot = "<r>O bot sumiu. Aguarde um minuto ou mencione @Tocu#0018 no discord: <d>%s</d>",
	invalid_length = "<r>Sua mensagem deve ter algo entre 10 e 100 caracteres. Agora tem <n2>%s</n2> caracteres.",
	invalid_map = "<r>Mapa inválido.",
	map_does_not_exist = "<r>O mapa não existe ou não pôde ser carregado. Tente novamente mais tarde.",
	invalid_map_perm = "<r>O mapa não é nem P22, nem P41.",
	invalid_map_perm_specific = "<r>O mapa não é P%s.",
	cant_use_this_map = "<r>O mapa tem um pequeno bug e não pode ser usado.",
	invalid_map_p41 = "<r>O mapa é P41, mas não está na lista de mapas do módulo.",
	invalid_map_p22 = "<r>O mapa é P22, mas está na lista de mapas do módulo.",
	map_already_voting = "<r>o mapa já tem uma votação em aberto.",
	not_enough_permissions = "<r>Você não tem permissões suficientes para fazer isso.",
	already_depermed = "<r>O mapa já foi <i>deperm</i>.",
	already_permed = "<r>O mapa já está <i>perm</i>.",
	cant_perm_right_now = "<r>Não foi possível alterar a categoria deste mapa no momento. Tente novamente mais tarde.",

	-- Congratulation messages
	reached_level = "<d>Parabéns! Você atingiu o nível <vp>%s</vp>.",
	finished = "<d><o>%s</o> terminou o parkour em <vp>%s</vp> segundos, <fc>parabéns!",
	unlocked_power = "<ce><d>%s</d> desbloqueou o poder <vp>%s</vp>.",
	enjoy = "<d>Aproveite suas novas habilidades!",

	-- Information messages
	paused_events = "<cep><b>[Atenção!]</b> <n>O módulo está atingindo um estado crítico e está sendo pausado.",
	resumed_events = "<n2>O módulo está se normalizando.",
	welcome = "<n>Bem-vindo(a) ao <t>#parkour</t>!",
	discord = "<cs>Tendo alguma boa ideia, report de bug ou apenas querendo conversar com outros jogadores? Entre em nosso servidor no Discord: <pt>%s</pt>",
	map_submissions = "<pt>Quer ver seu mapa no módulo? Poste-o aqui: <j>%s</j>",
	data_saved = "<vp>Dados salvos.",
	action_within_minute = "<vp>A ação será aplicada dentre um minuto.",
	rank_save = "<n2>Digite <d>!rank save</d> para salvar as mudanças.",
	module_update = "<r><b>[Atenção!]</b> <n>O módulo irá atualizar em <d>%02d:%02d</d>.",
	mapping_loaded = "<j>[INFO] <n>Sistema de mapas <t>(v%s)</t> carregado.",
	mapper_joined = "<j>[INFO] <n><ce>%s</ce> <n2>(%s)</n2> entrou na sala.",
	mapper_left = "<j>[INFO] <n><ce>%s</ce> <n2>(%s)</n2> saiu da sala.",
	mapper_loaded = "<j>[INFO] <n><ce>%s</ce> carregou este mapa.",
	starting_perm_change = "<j>[INFO] <n>Iniciando mudança de categoria...",
	got_map_info = "<j>[INFO] <n>Todas as informações do mapa foram coletadas. Tentando alterar categoria...",
	perm_changed = "<j>[INFO] <n>Categoria do mapa <ch>@%s</ch> alterada com sucesso, de <r>P%s</r> para <t>P%s</t>.",
	data_migration = "Todos os dados precisam migrar. Isso significa que atualmente você não tem nenhum mapa completado. Para restaurar seus dados, vá até a sala: <a href='event:migration'><b>*#drawbattle0migration</b></a>.",

	-- Miscellaneous
	important = "IMPORTANTE",
	unknown = "Desconhecido",
	powers = "Poderes",
	press = "<vp>Aperte %s",
	click = "<vp>Use click",
	completed_maps = "<p align='center'><BV><B>Mapas completados: %s</B></p></BV>",
	leaderboard = "Ranking",
	position = "Posição",
	username = "Nome",
	community = "Comunidade",
	completed = "Mapas completados",
	not_permed = "não tem categoria",
	permed = "permed",
	points = "%d pontos",
	conversation_info = "<j>%s <bl>- @%s <vp>(%s, %s) %s\n<n><font size='10'>Iniciado por <d>%s</d>. Último comentário por <d>%s</d>. <d>%s</d> comentários, <d>%s</d> não lidos.",
	map_info = "<p align='center'>Código do mapa: <bl>@%s</bl> <g>|</g> Autor do mapa: <j>%s</j> <g>|</g> Status: <vp>%s, %s</vp> <g>|</g> Pontos: <vp>%s</vp>",
	permed_maps = "Mapas <i>permed</i>",
	ongoing_votations = "Votações em andamento",
	archived_votations = "Votações arquivadas",
	open = "Abrir",
	not_archived = "não arquivado",
	archived = "arquivado",
	delete = "<r><a href='event:%s'>[deletar]</a> ",
	see_restore = "<vp><a href='event:%s'>[ver]</a> <a href='event:%s'>[restaurar]</a> ",
	no_comments = "Sem comentários.",
	deleted_by = "<r>[Mensagem deletada por %s]",
	dearchive = "desarquivar", -- to dearchive
	archive = "arquivar", -- to archive
	deperm = "deperm", -- to deperm
	perm = "perm", -- to perm
	map_actions_staff = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Comentar</j></a> <g>|</g> Seu voto: %s <g>|</g> <vp><a href='event:%s'>[%s]</a> <a href='event:%s'>[%s]</a> <a href='event:%s'>[carregar]</a></p>",
	map_actions_user = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Comentar</j></a></p>",
	load_from_thread = "<p align='center'><a href='event:load_custom'>Carregar mapa</a></p>",
	write_comment = "Escreva seu comentário abaixo",
	write_map = "Escreva o código do mapa abaixo",

	-- Power names
	ballon = "Balão",
	masterBallon = "Balão Mestre",
	bubble = "Bolha",
	fly = "Voar",
	snowball = "Bola de Neve",
	speed = "Velocidade",
	teleport = "Teleporte",
	smallbox = "Caixa Pequena",
	cloud = "Nuvem",
	rip = "Lápide",
	choco = "Choco-tábua",
}
