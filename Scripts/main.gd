extends Node


onready var map = $Field/Map
onready var timer = $RefreshTimer

export var alive_count = 10

func _refresh():
	map.update()
	timer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root();
	var size:int = root.size.x / 16
	map.setup(size,size)
	for n in alive_count:
		var pos = Vector2( randi()%size, randi()%size)
		map.alive(pos)
	
	timer.connect("timeout", self, "_refresh")
	timer.start()
	pass
