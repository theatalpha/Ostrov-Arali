extends Node
var y
var track1

func _ready():
	track1 =  get_node("Internationale")
	set_process_input(true)
	get_node("Select").hide()
	get_node("TextureRect").hide()
	get_node("TextureRect2").hide()
	track1.play()

func _on_Continue_mouse_entered():
	y = get_node("Continue").rect_position.y +50
	_select()
	
func _select():
	get_node("Select").set_position(Vector2(960, y))
	get_node("Select").show()


func _on_NewGame_mouse_entered():
	y = get_node("NewGame").rect_position.y +50
	_select()


func _on_Options_mouse_entered():
	y = get_node("Options").rect_position.y +50
	_select()


func _on_ExitGame_mouse_entered():
	y = get_node("ExitGame").rect_position.y +50
	_select()
