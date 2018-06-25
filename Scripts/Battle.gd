extends Node
var drawnCard = ""
var cardAttack = 0
var cardHealth = 0
var cardClass = ""
var cardClassTexture
var cardSprite
var cardName = ""
var card_1_Drawn = false
var card_1_Pressed = false
var PCardUR_Occupied = false
func _ready():
	pass
	
func deck():
	var deckCards = []
	var file = File.new();
	file.open("res://Cards.txt", File.READ);
	while not file.eof_reached():
		deckCards.append(file.get_line())
	return deckCards

###Gets a random entry from the decklist which is then called as a function
func _on_End_Turn_pressed():
	var decklist = deck()
	drawnCard = decklist[randi() % decklist.size()]
	if drawnCard == "Stalin":
		stalin()
	elif drawnCard == "Castro":
		castro()
	elif drawnCard == "Comrades":
		comrades()
	elif drawnCard == "Rousing":
		rousing()
	elif drawnCard == "Lenin":
		lenin()
	elif drawnCard == "Conscript":
		conscript()
	elif drawnCard == "March":
		march()
	elif drawnCard == "Sniper":
		sniper()
	elif drawnCard == "Tank":
		tank()
	elif drawnCard == "Guerilla":
		guerilla()
	elif drawnCard == "Katyusha":
		katyusha()
	elif drawnCard == "Artillery":
		artillery()
	elif drawnCard == "Cavalry":
		cavalry()
	elif drawnCard == "General":
		general()
	elif drawnCard == "Rebelgirl":
		rebelgirl()
	elif drawnCard == "Rifleman":
		rifleman()
	elif drawnCard == "Bomber":
		bomber()
	elif drawnCard == "Trotsky":
		trotsky()
	else:
		pass
		
### Drawn card entries and calls the card storing function
func stalin():
	cardName = "Stalin"
	cardAttack = 7
	cardHealth = 5
	cardClass = "Melee"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Stalin.jpg")
	carddrawn()
	
func castro():
	cardName = "Castro"
	cardAttack = 6
	cardHealth = 3
	cardClass = "Melee"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Castro.jpg")
	carddrawn()

func comrades():
	cardName = "Comrades"
	cardAttack = 4
	cardHealth = 7
	cardClass = "Melee"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Comrades at arms.jpg")
	carddrawn()

func rousing():
	cardName = "Rousing Leader"
	cardAttack = 2
	cardHealth = 9
	cardClass = "Melee"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/InspiringLeader.png")
	carddrawn()

func lenin():
	cardName = "Lenin"
	cardAttack = 4
	cardHealth = 7
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Lenin.jpeg")
	carddrawn()

func conscript():
	cardName = "Conscript"
	cardAttack = 2
	cardHealth = 3
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/RedConscript.jpeg")
	carddrawn()

func march():
	cardName = "Red March"
	cardAttack = 3
	cardHealth = 6
	cardClass = "Melee"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Red March.jpg")
	carddrawn()

func sniper():
	cardName = "Red Sniper"
	cardAttack = 8
	cardHealth = 2
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/RedSniper.jpeg")
	carddrawn()

func soldier():
	cardName = "Red Soldier"
	cardAttack = 4
	cardHealth = 7
	cardClass = "Melee"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Red Soldier.jpg")
	carddrawn()
	
func tank():
	cardName = "Red Tank"
	cardAttack = 4
	cardHealth = 7
	cardClass = "Melee"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Red Tank.jpg")
	carddrawn()

func guerilla():
	cardName = "Red Guerillas"
	cardAttack = 4
	cardHealth = 7
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Red Troops.jpg")
	carddrawn()

func katyusha():
	cardName = "Katyusha"
	cardAttack = 6
	cardHealth = 3
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Katyusha.png")
	carddrawn()

func artillery():
	cardName = "Red Artillery"
	cardAttack = 2
	cardHealth = 9
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/RedArtillery.jpg")
	carddrawn()

func cavalry():
	cardName = "Red Cavalry"
	cardAttack = 8
	cardHealth = 5
	cardClass = "Melee"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/RedCalvalry.jpg")
	carddrawn()

func general():
	cardName = "Red General"
	cardAttack = 4
	cardHealth = 7
	cardClass = "Melee"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Red General.jpg")
	carddrawn()

func rebelgirl():
	cardName = "Rebel Girl"
	cardAttack = 3
	cardHealth = 9
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Red Rebel Girl.jpg")
	carddrawn()

func rifleman():
	cardName = "Red Rifleman"
	cardAttack = 8
	cardHealth = 4
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Red Rifleman.jpg")
	carddrawn()

func bomber():
	cardName = "Worker's Bomber"
	cardAttack = 10
	cardHealth = 10
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/RedBomber.jpg")
	carddrawn()

func trotsky():
	cardName = "Trotsky"
	cardAttack = 4
	cardHealth = 7
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Trotsky.jpg")
	carddrawn()

func carddrawn():
	if cardClass == "Melee":
		cardClassTexture = load("res://Graphics/Card Art/Melee Card final.png")
	elif cardClass == "Ranged":
		cardClassTexture = load("res://Graphics/Card Art/Ranged Card final.png")
		
	get_node("Card 1").texture_normal = cardClassTexture
	get_node("Card 1/Name").text = cardName
	get_node("Card 1/Sprite").texture = cardSprite
	get_node("Card 1/Health").text = (str(cardHealth))
	get_node("Card 1/Attack").text = (str(cardAttack))
	card_1_Drawn = true
	
func _on_Card_1_pressed():
	if card_1_Drawn == true:
		card_1_Pressed = true
	else:
		pass




func _on_PCardUR_pressed():
	if card_1_Pressed == true and PCardUR_Occupied == false:
		get_node("PCardUR").texture_normal = get_node("Card 1").texture_normal
		get_node("PCardUR/Sprite").texture = get_node("Card 1/Sprite").texture
		get_node("PCardUR/Health").text = get_node("Card 1/Health").text
		get_node("PCardUR/Attack").text = get_node("Card 1/Attack").text
		get_node("PCardUR/Name").text = get_node("Card 1/Name").text
		PCardUR_Occupied = true
		clearCard()

###Resets node to original values
func clearCard():
	get_node("Card 1").texture_normal = null
	get_node("Card 1/Name").text = ""
	get_node("Card 1/Sprite").texture = null
	get_node("Card 1/Health").text = ""
	get_node("Card 1/Attack").text = ""
	card_1_Drawn = false