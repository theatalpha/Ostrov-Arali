extends Node
var card1Empty = true
var card2Empty = true
var card3Empty = true
var card4Empty = true
var card5Empty = true
var card1Pressed = false
var card2Pressed = false
var card3Pressed = false
var card4Pressed = false
var card5Pressed = false
var cardTexture = ""
var cardAttack = 0
var cardHealth = 0
var drawnCard = ""
var card1Attack = 0
var card2Attack = 0
var card3Attack = 0
var card4Attack = 0
var card5Attack = 0
var card1Health = 0
var card2Health = 0
var card3Health = 0
var card4Health = 0
var card5Health = 0
var PCardURHealth = 0
var PCardULHealth = 0
var PCardCRHealth = 0
var PCardCLHealth = 0
var PCardLLHealth = 0
var PCardLRHealth = 0
var ECardURHealth = 0
var ECardULHealth = 0
var ECardCRHealth = 0
var ECardCLHealth = 0
var ECardLRHealth = 0
var ECardLLHealth = 0
var PCardURAttack = 0
var PCardULAttack = 0
var PCardCRAttack = 0
var PCardCLAttack = 0
var PCardLLAttack = 0
var PCardLRAttack = 0
var ECardURAttack = 0
var ECardULAttack = 0
var ECardCRAttack = 0
var ECardCLAttack = 0
var ECardLRAttack = 0
var ECardLLAttack = 0


func _ready():
	pass
	
### Deck and Cards
func deck():
	var deckCards = []
	var file = File.new();
	file.open("res://Cards.txt", File.READ);
	while not file.eof_reached():
		deckCards.append(file.get_line())
	return deckCards
	
func _on_End_Turn_pressed():
	var decklist = deck()
	drawnCard = decklist[randi() % decklist.size()]
	if drawnCard == "Stalin":
		stalin()
	elif drawnCard == "Trotsky":
		trotsky()
	else:
		pass

func stalin():
	cardTexture = load("res://Graphics/Card Art/StalinFull.png")
	cardAttack = 3
	cardHealth = 2
	carddrawn()
func trotsky():
	cardTexture = load("res://Graphics/Card Art/TrotskyFull.png")
	cardAttack = 2
	cardHealth = 3
	carddrawn()
### Card Drawing
func carddrawn():
	if card1Empty == true:
		get_node("Card 1").texture_normal = cardTexture
		card1Attack = cardAttack
		card1Health = cardHealth
		card1Empty = false
	else:
		if card2Empty == true:
			get_node("Card 2").texture_normal = cardTexture
			card2Attack = cardAttack
			card2Health = cardHealth
			card2Empty = false
		else:
			if card3Empty == true:
				get_node("Card 3").texture_normal = cardTexture
				card3Attack = cardAttack
				card3Health = cardHealth
				card3Empty = false
			else:
				if card4Empty == true:
					get_node("Card 4").texture_normal = cardTexture
					card4Attack = cardAttack
					card4Health = cardHealth
					card4Empty = false
				else:
					if card5Empty == true:
						get_node("Card 5").texture_normal = cardTexture
						card5Attack = cardAttack
						card5Health = cardHealth
						card5Empty = false
					else:
						pass


###Placing Cards
func _on_Card_1_pressed():
	if card1Empty == false:
		card1Pressed = true
		card2Pressed = false
		card3Pressed = false
		card4Pressed = false
		card5Pressed = false
	else: 
		pass
func _on_Card_3_pressed():
	if card3Empty == false:
		card1Pressed = false
		card2Pressed = false
		card3Pressed = true
		card4Pressed = false
		card5Pressed = false
	else: 
		pass

func _on_Card_5_pressed():
	if card5Empty == false:
		card1Pressed = false
		card2Pressed = false
		card3Pressed = false
		card4Pressed = false
		card5Pressed = true
	else: 
		pass

func _on_Card_2_pressed():
	if card2Empty == false:
		card1Pressed = false
		card2Pressed = true
		card3Pressed = false
		card4Pressed = false
		card5Pressed = false
	else: 
		pass

func _on_Card_4_pressed():
	if card4Empty == false:
		card1Pressed = false
		card2Pressed = false
		card3Pressed = false
		card4Pressed = true
		card5Pressed = false
	else: 
		pass



func _on_PCardUR_pressed():
	if card1Pressed == true:
		get_node("PCardUR").texture_normal = get_node("Card 1").texture_normal
		card1clear()
		card1Empty = true
	elif card2Pressed == true:
		get_node("PCardUR").texture_normal = get_node("Card 2").texture_normal
		card2clear()
		card2Empty = true

	elif card3Pressed == true:
		get_node("PCardUR").texture_normal = get_node("Card 3").texture_normal
		card3clear()
		card3Empty = true

	elif card4Pressed == true:
		get_node("PCardUR").texture_normal = get_node("Card 4").texture_normal
		card4clear()
		card4Empty = true

	elif card5Pressed == true:
		get_node("PCardUR").texture_normal = get_node("Card 5").texture_normal
		card5clear()
		card5Empty = true
	else:
		pass

func _on_PCardUL_pressed():
	if card1Pressed == true:
		get_node("PCardUL").texture_normal = get_node("Card 1").texture_normal
		card1clear()
		card1Empty = true
	elif card2Pressed == true:
		get_node("PCardUL").texture_normal = get_node("Card 2").texture_normal
		card2clear()
		card2Empty = true

	elif card3Pressed == true:
		get_node("PCardUL").texture_normal = get_node("Card 3").texture_normal
		card3clear()
		card3Empty = true

	elif card4Pressed == true:
		get_node("PCardUL").texture_normal = get_node("Card 4").texture_normal
		card4clear()
		card4Empty = true

	elif card5Pressed == true:
		get_node("PCardUL").texture_normal = get_node("Card 5").texture_normal
		card5clear()
		card5Empty = true
	else:
		pass

func _on_PCardCL_pressed():
	if card1Pressed == true:
		get_node("PCardCL").texture_normal = get_node("Card 1").texture_normal
		card1clear()
		card1Empty = true
	elif card2Pressed == true:
		get_node("PCardCL").texture_normal = get_node("Card 2").texture_normal
		card2clear()
		card2Empty = true

	elif card3Pressed == true:
		get_node("PCardCL").texture_normal = get_node("Card 3").texture_normal
		card3clear()
		card3Empty = true

	elif card4Pressed == true:
		get_node("PCardCL").texture_normal = get_node("Card 4").texture_normal
		card4clear()
		card4Empty = true

	elif card5Pressed == true:
		get_node("PCardCL").texture_normal = get_node("Card 5").texture_normal
		card5clear()
		card5Empty = true
	else:
		pass

func _on_PCardCR_pressed():
	if card1Pressed == true:
		get_node("PCardCR").texture_normal = get_node("Card 1").texture_normal
		card1clear()
		card1Empty = true
	elif card2Pressed == true:
		get_node("PCardCR").texture_normal = get_node("Card 2").texture_normal
		card2clear()
		card2Empty = true

	elif card3Pressed == true:
		get_node("PCardCR").texture_normal = get_node("Card 3").texture_normal
		card3clear()
		card3Empty = true

	elif card4Pressed == true:
		get_node("PCardCR").texture_normal = get_node("Card 4").texture_normal
		card4clear()
		card4Empty = true

	elif card5Pressed == true:
		get_node("PCardCR").texture_normal = get_node("Card 5").texture_normal
		card5clear()
		card5Empty = true
	else:
		pass

func _on_PCardLL_pressed():
	if card1Pressed == true:
		get_node("PCardLL").texture_normal = get_node("Card 1").texture_normal
		card1clear()
		card1Empty = true
	elif card2Pressed == true:
		get_node("PCardLL").texture_normal = get_node("Card 2").texture_normal
		card2clear()
		card2Empty = true

	elif card3Pressed == true:
		get_node("PCardLL").texture_normal = get_node("Card 3").texture_normal
		card3clear()
		card3Empty = true

	elif card4Pressed == true:
		get_node("PCardLL").texture_normal = get_node("Card 4").texture_normal
		card4clear()
		card4Empty = true

	elif card5Pressed == true:
		get_node("PCardLL").texture_normal = get_node("Card 5").texture_normal
		card5clear()
		card5Empty = true
	else:
		pass

func _on_PCardLR_pressed():
	if card1Pressed == true:
		get_node("PCardLR").texture_normal = get_node("Card 1").texture_normal
		card1clear()
		card1Empty = true
	elif card2Pressed == true:
		get_node("PCardLR").texture_normal = get_node("Card 2").texture_normal
		card2clear()
		card2Empty = true

	elif card3Pressed == true:
		get_node("PCardLR").texture_normal = get_node("Card 3").texture_normal
		card3clear()
		card3Empty = true

	elif card4Pressed == true:
		get_node("PCardLR").texture_normal = get_node("Card 4").texture_normal
		card4clear()
		card4Empty = true

	elif card5Pressed == true:
		get_node("PCardLR").texture_normal = get_node("Card 5").texture_normal
		card5clear()
		card5Empty = true
	else:
		pass





### Clear Cards
func card1clear():
	get_node("Card 1").texture_normal = null
	card1Attack = 0
	card1Health = 0

func card2clear():
	get_node("Card 2").texture_normal = null
	card2Attack = 0
	card2Health = 0
func card3clear():
	get_node("Card 3").texture_normal = null
	card3Attack = 0
	card3Health = 0
func card4clear():
	get_node("Card 4").texture_normal = null
	card4Attack = 0
	card4Health = 0
func card5clear():
	get_node("Card 5").texture_normal = null
	card5Attack = 0
	card5Health = 0


