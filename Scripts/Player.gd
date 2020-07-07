extends KinematicBody2D

const MOVE_SPEED = 300

onready var raycast = $RayCast2D #usado para quando for fazer os tiros

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var move_vec = Vector2()
	if(Input.is_action_pressed("ui_up")):
		move_vec.y -= 1
	if(Input.is_action_pressed("ui_down")):
		move_vec.y += 1
	if(Input.is_action_pressed("ui_left")):
		move_vec.x -= 1
	if(Input.is_action_pressed("ui_right")):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	var _asdf = move_and_collide(move_vec * MOVE_SPEED * delta) #"_asdf" é um placeholder para o objeto que o jogador irá colidir
	
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
