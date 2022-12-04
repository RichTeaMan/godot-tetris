extends Node

func try_move(direction: Vector3) -> bool:
	
	var blocks = fetch_blocks()
	
	for block in blocks:
		if block.move_and_collide(direction, true, true, true):
			return false
	
	for block in blocks:
		block.move_and_collide(direction)
	
	return true

func place_block():
	var blocks = fetch_blocks()
	
	for block in blocks:
		block.set_placed_mask(true)

func fetch_blocks() -> Array:
	var arr = Array()
	arr.append($PivotA/BasicBlock)
	arr.append($PivotB/BasicBlock)
	return arr
