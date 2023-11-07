extends Node

const SIZE = 16
const OFFSET = SIZE / 4


var W = 8
var H = 8

var cells = {}

var aliveCells = {}

export var cell: PackedScene

# Setup
func _ready():
	pass

func setup(w,h):
	W = w
	H = h
	for x in W:
		for y in H:
			var clone = cell.instance()
			var image = clone.get_node("Image")
			clone.position.x = x * SIZE + (x * OFFSET)
			clone.position.y = y * SIZE + (y * OFFSET)

			image.set_size(Vector2(SIZE,SIZE))
			
			var pos = Vector2(x,y)
			cells[pos] = image
			cells[pos].visible = false
			aliveCells[pos] = false
			
			add_child(clone)
	pass
	
func update():
	var next = {}
	
	for x in W:
		for y in H:
			var pos = Vector2(x,y)
			var count = _get_alive_count(pos)
			next[pos] = _is_alive(pos,count)
	for x in W:
		for y in H:
			var pos = Vector2(x,y)
			cells[pos].visible = next[pos]
	aliveCells = next
	
func _is_alive(pos:Vector2,aliveCount:int):
	return aliveCount == 3 || (aliveCells[pos] && aliveCount == 2)

func _get_alive_count(pos:Vector2):
	var count = 0
	for dy in range(-1, 2):
		for dx in range(-1, 2):
			if dy == 0 && dx == 0:
				continue
			var checkPos = Vector2(pos.x + dx, pos.y + dy)
			if aliveCells.has(checkPos) == false:
				continue
			if aliveCells[checkPos]:
				count += 1
	return count

func alive(pos:Vector2):
	aliveCells[pos] = true
	cells[pos].visible = true

