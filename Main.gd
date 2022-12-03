extends Node

export (PackedScene) var basic_block_scene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_block


# Called when the node enters the scene tree for the first time.
func _ready():
	var basic_block = basic_block_scene.instance();
	
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
	pass # Replace with function body.

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y -= 1
		
	current_block.move_and_slide(direction, Vector3.UP)
