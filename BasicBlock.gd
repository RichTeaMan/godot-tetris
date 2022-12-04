extends KinematicBody

func set_guard_mask(value: bool) -> void:
	$".".set_collision_layer_bit(0, value)

func set_placed_mask(value: bool) -> void:
	$".".set_collision_layer_bit(1, value)
