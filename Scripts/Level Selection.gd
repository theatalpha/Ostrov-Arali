extends Node2D

#This brings in my variables from the nodes used in the 2d section
export (NodePath) var level1
export (NodePath) var level2
onready var button1 = get_node(level1)
onready var button2 = get_node(level2)

func _ready():
	button1.set_text("Level 1") #This will show words on the button which the program is launched
	button1.connect("pressed", self, "on_pressed") #This will connect the button on the screen to the code so that it will work when pressed
	button2.set_text("Level 2") #This is the same as above but for the second button. Its the same for the code below.
	button2.connect("pressed", self, "on_pressed2")

func on_pressed(): #This is the code that allows the sprite to ove physcially instead of teleporting
	if $Sprite.position == Vector2(1420, 765):
		$Tween.interpolate_property($Sprite, "position", Vector2(1420, 765), Vector2(865, 520), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	else:
		$Tween.interpolate_property($Sprite, "position", Vector2(270, 155), Vector2(865,520), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()

func on_pressed2(): #The same as above but for the second button
	if $Sprite.position == Vector2(270, 155):
		$Tween.interpolate_property($Sprite, "position", Vector2(270, 155), Vector2(1420,765), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	else:
		$Tween.interpolate_property($Sprite, "position", Vector2(865,520), Vector2(1420,765), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()