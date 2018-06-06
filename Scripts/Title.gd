extends Node

var track1

func _ready():
	track1 =  get_node("DWAR")
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("play"):
		track1.play()
	
	pass
