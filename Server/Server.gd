extends Node

const SERVER_PORT = 25225
const MAX_PLAYERS = 10

func _ready():
	var _never_used = get_tree().connect("network_peer_connected", self, "_player_connected")
	var _never_used2 = get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	start_server()
	pass
	
func start_server():
	print("Tentando iniciar o servidor.")
	var peer = NetworkedMultiplayerENet.new()
	var result = peer.create_server(SERVER_PORT, MAX_PLAYERS)
	
	if result != OK:
		print("Falha ao criar o servidor.")
		return
	else:
		print("Servior criado!")
	
	get_tree().set_network_peer(peer)
	pass

func _player_connected(id):
	print(str(id) + " conectado ao servidor!")
	pass

func _player_disconnected(id):
	print(str(id) + " desconectado do servidor!")
	pass
