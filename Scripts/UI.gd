extends Control

onready var checkButton = $PlayButton

# Called when the node enters the scene tree for the first time.
func _ready():
	checkButton.connect("toggled",self, _on_stop())
	pass # Replace with function body.

func _on_stop():
	
	pass


func _on_PlayButton_toggled(button_pressed):
	pass # Replace with function body.
