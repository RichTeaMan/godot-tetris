extends Node

export (PackedScene) var basic_block_scene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_block

var pressed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	var guard_block = basic_block_scene.instance();
	guard_block.translation = Vector3(0, -2, 0)
	add_child(guard_block)
	
	var basic_block = basic_block_scene.instance()
	
	# get a random location
	#var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# with a random offset
	#mob_spawn_location.unit_offset = randf()
	
	#var player_position = $Player.transform.origin
	#basic_block.initialize(Vector3.ZERO, player_position)
	
	basic_block.to_global(Vector3.ZERO)
	
	#basic_block.connect("squashed", $UserInterface/ScoreLabel, "_on_Mob_squashed")
	
	add_child(basic_block)
	current_block = basic_block


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	current_block.move_and_collide(Vector3(0, -1, 0))
	pressed = false

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y -= 1

	if !pressed && direction != Vector3.ZERO:
		current_block.move_and_collide(direction)
		pressed = true
