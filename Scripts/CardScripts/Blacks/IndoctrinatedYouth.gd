extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var atk = 2
var hp = 8
var CardName = "Indoctrinated Youth"
var CardType = "ranged"


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
func _process(delta):
	get_node("AttackDisplay").set_text(str(atk))
	get_node("HealthDisplay").set_text(str(hp))
	get_node("NameDisplay").set_text(str(CardName))

	pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass