extends Node

export (PackedScene) var player_block_scene

export (PackedScene) var basic_block_scene

var current_block

var pressed = false


# Called when the node enters the scene tree for the first time.
func _ready():

	create_guards()
	spawn_block()

func spawn_block():
	current_block = player_block_scene.instance()
	add_child(current_block)

func create_guards():
	for n in 20:
		var guard_block_a = basic_block_scene.instance();
		guard_block_a.translation = Vector3(-5, -n, 0)
		guard_block_a.set_guard_mask(true)
		add_child(guard_block_a)
		
		var guard_block_b = basic_block_scene.instance();
		guard_block_b.translation = Vector3(6, -n, 0)
		guard_block_b.set_guard_mask(true)
		add_child(guard_block_b)
	
	for n in 12:
		var guard_block = basic_block_scene.instance();
		guard_block.translation = Vector3(-5 + n, -20, 0)
		guard_block.set_guard_mask(true)
		add_child(guard_block)

func _on_Timer_timeout():
	pressed = false
	# check down and respawn if bottomed
	if !current_block.try_move(Vector3.DOWN):
		# hit something, do a respawn
		current_block.place_block()
		spawn_block()

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y -= 1

	if !pressed && direction != Vector3.ZERO && current_block.try_move(direction):
		pressed = true
