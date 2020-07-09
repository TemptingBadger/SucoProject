extends Node

const GRUPO_MOBS = "mobs"
const GRUPO_PLAYER = "players"

var players = {}
var my_info = {}

func _ready():
    var _not_used = get_tree().multiplayer.connect("network_peer_connected", self, "_player_conected")
    var _not_used2 = get_tree().multiplayer.connect("network_peer_disconnected", self, "_player_disconnected")
    pass

func run_game(id,info):
    var world = load("res://Scenes/World.tscn").instance()
    get_node("/root").add_child(world)

    my_info = info
    var player = preload("res://Scenes/Player.tscn").instance()
    player.name = str(id)
    player.set_network_master(id)
    player.initialize(info)
    
    get_node("/root/World").add_child(player)
    players[id] = info
    
    
    var mob_red = preload("res://mobs/mob_red.tscn").instance()
    get_node("/root/prontera_world/spaw_point").add_child(mob_red)
    var mob_red2 = preload("res://mobs/mob_red.tscn").instance()
    get_node("/root/prontera_world/spaw_point").add_child(mob_red2)
    pass
    