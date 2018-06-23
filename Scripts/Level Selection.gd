extends Node2D

#var button1_location = Position2D(530, 895)

export (NodePath) var level1
export (NodePath) var level2
onready var button1 = get_node(level1)
onready var button2 = get_node(level2)
#onready var TweenNode = get_node("Tween")
#onready var Position2D = get_node("Position2D")
#onready var sprite = get_node("Sprite")

func _ready():
	button1.set_text("Level 1")
	button1.connect("pressed", self, "on_pressed")
	button2.set_text("Level 2")
	button2.connect("pressed", self, "on_pressed2")

func on_pressed():
		$Tween.interpolate_property($Sprite, "position", Vector2(474,252), Vector2(895,530), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()

func on_pressed2():
	$Tween.interpolate_property($Sprite, "position", Vector2(895,530), Vector2(1300,730), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()