extends Node
var y
var my
var track1

func _ready():
	track1 =  get_node("Internationale")
	set_process_input(true)
	get_node("Select").hide()
	get_node("MSelect").hide()
	get_node("MBack").hide()
	get_node("MFull").hide()
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
	get_node("MSelect").hide()
	_select()


func _on_Options_pressed():
	get_node("ExitGame").hide()
	get_node("Continue").hide()
	get_node("Options").hide()
	get_node("NewGame").hide()
	get_node("Select").hide()
	get_node("MBack").show()
	get_node("MFull").show()


func _on_MBack_pressed():
	get_node("ExitGame").show()
	get_node("Continue").show()
	get_node("Options").show()
	get_node("NewGame").show()
	get_node("MBack").hide()
	get_node("MFull").hide()

func _on_MFull_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_MFull_mouse_entered():
	my = get_node("MFull").rect_position.y +50
	_mselect()
	
func _mselect():
	get_node("Select").hide()
	get_node("MSelect").set_position(Vector2(750, my))
	get_node("MSelect").show()
