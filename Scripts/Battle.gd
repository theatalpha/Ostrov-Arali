extends Node
var drawnCard = ""
var cardAttack = 0
var cardHealth = 0
var cardClass = ""
var cardClassTexture
var cardSprite
var cardName = ""
var EcardAttack
var EcardHealth
var EcardClass
var EcardClassTexture
var EcardSprite
var EcardName
var card_1_Drawn = false
var card_1_Pressed = false
var card_2_Drawn = false
var card_2_Pressed = false
var card_3_Drawn = false
var card_3_Pressed = false
var card_4_Drawn = false
var card_4_Pressed = false
var card_5_Drawn = false
var card_5_Pressed = false
var PCardUR_Occupied = false
var PCardUL_Occupied = false
var PCardCR_Occupied = false
var PCardCL_Occupied = false
var PCardLR_Occupied = false
var PCardLL_Occupied = false
var ECardUR_Occupied = false
var ECardUL_Occupied = false
var ECardCR_Occupied = false
var ECardCL_Occupied = false
var ECardLR_Occupied = false
var ECardLL_Occupied = false
var cardsPlayed = 0
var player_turn = false
var enemyDrawnCard
var enemyPlacement
var PCardULHealth
var PCardULAttack
var PCardURHealth
var PCardURAttack
var PCardCLHealth
var PCardCLAttack
var PCardCRHealth
var PCardCRAttack
var PCardLLHealth
var PCardLLAttack
var PCardLRHealth
var PCardLRAttack
var ECardULHealth
var ECardULAttack
var ECardURHealth
var ECardURAttack
var ECardCLHealth
var ECardCLAttack
var ECardCRHealth
var ECardCRAttack
var ECardLLHealth
var ECardLLAttack
var ECardLRHealth
var ECardLRAttack
var Card1Attack
var Card1Health
var Card2Attack
var Card2Health
var Card3Attack
var Card3Health
var Card4Attack
var Card4Health
var Card5Attack
var Card5Health

func _ready():
	playerTurn()
	playerTurn()
	playerTurn()
	
func deck():
	var deckCards = []
	var file = File.new();
	file.open("res://Cards.txt", File.READ);
	while not file.eof_reached():
		deckCards.append(file.get_line())
	return deckCards

func enemyDeck():
	print("Enemy Deck works")
	var enemyDeckCards = []
	var file = File.new();
	file.open("res://EnemyCards.txt", File.READ);
	while not file.eof_reached():
		enemyDeckCards.append(file.get_line())
	return enemyDeckCards

###Gets a random entry from the decklist which is then called as a function
func _on_End_Turn_pressed():
	playerAttack()
	cardsPlayed = 0
	enemyTurn()



func enemyTurn():
	print("Enemy Turn Works")
	var enemyDecklist = enemyDeck()
	enemyDrawnCard = enemyDecklist[randi() % enemyDecklist.size()]
	
	if enemyDrawnCard == "EFieldMarshal":
		EcardName = "Black Field Marshal"
		EcardAttack = 6
		EcardHealth = 6
		EcardClass = "Melee"
		EcardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Black Field Marshal.jpeg")
		enemyPlacementChoice()
	elif enemyDrawnCard == "EBrigade":
		EcardName = "Common Conscript"
		EcardAttack = 4
		EcardHealth = 7
		EcardClass = "Ranged"
		EcardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Black Soldier.jpg")
		enemyPlacementChoice()

	elif enemyDrawnCard == "EShirts":
		EcardName = "Black Brigade"
		EcardAttack = 6
		EcardHealth = 7
		EcardClass = "Melee"
		EcardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/BlackBrigade.jpg")
		enemyPlacementChoice()
		
	elif enemyDrawnCard == "EBomber":
		EcardName = "Bomber Pilot"
		EcardAttack = 6
		EcardHealth = 9
		EcardClass = "Melee"
		EcardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Bomber Pilot.jpg")
		enemyPlacementChoice()

	elif enemyDrawnCard == "EConscript":
		EcardName = "Black Shirts"
		EcardAttack = 6
		EcardHealth = 8
		EcardClass = "Melee"
		EcardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Black Shirts.jpg")
		enemyPlacementChoice()
		
	elif enemyDrawnCard == "ECommander":
		EcardName = "Despicable Commander"
		EcardAttack = 3
		EcardHealth = 10
		EcardClass = "Ranged"
		EcardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Despicable Commander.jpg")
		enemyPlacementChoice()

	elif enemyDrawnCard == "EFranco":
		EcardName = "Franco"
		EcardAttack = 5
		EcardHealth = 12
		EcardClass = "Ranged"
		EcardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Franco.png")
		enemyPlacementChoice()

	elif enemyDrawnCard == "EGiovanni":
		EcardName = "Giovanni"
		EcardAttack = 8
		EcardHealth = 6
		EcardClass = "Melee"
		EcardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/GiovanniGentile.jpg")
		enemyPlacementChoice()
	elif enemyDrawnCard == "EHirohito":
		EcardName = "Hirohito"
		EcardAttack = 4
		EcardHealth = 10
		EcardClass = "Ranged"
		EcardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Hirohito.jpeg")
		enemyPlacementChoice()
	elif enemyDrawnCard == "EYouth":
		EcardName = "Indoctrinated Youth"
		EcardHealth = 8
		EcardAttack = 2
		EcardClass = "Ranged"
	elif enemyDrawnCard == "EMussolini":
		cardName = "Mussolini"
		cardAttack = 6
		cardHealth = 9
		cardClass = "Melee"
		cardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Mussolini.jpeg")
		enemyPlacementChoice()
	elif enemyDrawnCard == "EMosley":
		cardName = "Oswald Mosley"
		cardAttack = 5
		cardHealth = 8
		cardClass = "Ranged"
		cardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Mosley.jpg")
		enemyPlacementChoice()
	elif enemyDrawnCard == "EDictator":
		cardName = "Rallying Dictator"
		cardAttack = 8
		cardHealth = 4
		cardClass = "Ranged"
		cardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Rallying_Dictator.PNG")
		enemyPlacementChoice()

	elif enemyDrawnCard == "EKing":
		cardName = "The Black King"
		cardAttack = 1
		cardHealth = 15
		cardClass = "Ranged"
		cardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/The Black King.jpg")
		enemyPlacementChoice()

	elif enemyDrawnCard == "ETyrant":
		cardName = "Tyrant Commander"
		cardAttack = 7
		cardHealth = 5
		cardClass = "Melee"
		cardSprite = load("res://Graphics/Card Art/Card Artworks/Blacks/Black Commander.jpg")
		enemyPlacementChoice()

func enemyPlacementChoice():
	playerTurn()
	if ECardCL_Occupied == true and ECardCR_Occupied == true and ECardUR_Occupied == true and ECardUL_Occupied == true and ECardLR_Occupied == true and ECardLL_Occupied == true:
		pass
	else:
		enemyPlacement = randi()%4+1
		if cardClass == "Melee":
			EcardClassTexture = load("res://Graphics/Card Art/Melee Card final.png")
		elif cardClass == "Ranged":
			EcardClassTexture = load("res://Graphics/Card Art/Ranged Card final.png")
		if enemyPlacement == 1 and ECardUL_Occupied == false:
			get_node("ECardUL").texture_normal = EcardClassTexture
			get_node("ECardUL/Name").text = EcardName
			get_node("ECardUL/Sprite").texture = EcardSprite
			get_node("ECardUL/Health").text = (str(EcardHealth))
			get_node("ECardUL/Attack").text = (str(EcardAttack))
			ECardULAttack = EcardAttack
			ECardULHealth = EcardHealth
			ECardUL_Occupied = true

		elif enemyPlacement == 1 and ECardUL_Occupied == true and ECardUR_Occupied == false:
			get_node("ECardUR").texture_normal = EcardClassTexture
			get_node("ECardUR/Name").text = EcardName
			get_node("ECardUR/Sprite").texture = EcardSprite
			get_node("ECardUR/Health").text = (str(EcardHealth))
			get_node("ECardUR/Attack").text = (str(EcardAttack))
			ECardURAttack = EcardAttack
			ECardURHealth = EcardHealth
			ECardUR_Occupied = true

		elif enemyPlacement == 2 and ECardCL_Occupied == false:
			get_node("ECardCL").texture_normal = EcardClassTexture
			get_node("ECardCL/Name").text = EcardName
			get_node("ECardCL/Sprite").texture = EcardSprite
			get_node("ECardCL/Health").text = (str(EcardHealth))
			get_node("ECardCL/Attack").text = (str(EcardAttack))
			ECardCL_Occupied = true
			ECardCLAttack = EcardAttack
			ECardCLHealth = EcardHealth
		elif enemyPlacement == 2 and ECardCL_Occupied == true and ECardCR_Occupied == false:
			get_node("ECardCR").texture_normal = EcardClassTexture
			get_node("ECardCR/Name").text = EcardName
			get_node("ECardCR/Sprite").texture = EcardSprite
			get_node("ECardCR/Health").text = (str(EcardHealth))
			get_node("ECardCR/Attack").text = (str(EcardAttack))
			ECardCR_Occupied = true
			ECardCRAttack = EcardAttack
			ECardCRHealth = EcardHealth
		elif enemyPlacement == 3 and ECardLL_Occupied == false:
			get_node("ECardLL").texture_normal = EcardClassTexture
			get_node("ECardLL/Name").text = EcardName
			get_node("ECardLL/Sprite").texture = EcardSprite
			get_node("ECardLL/Health").text = (str(EcardHealth))
			get_node("ECardLL/Attack").text = (str(EcardAttack))
			ECardLL_Occupied = true
			ECardLLAttack = EcardAttack
			ECardLLHealth = EcardHealth
		elif enemyPlacement == 2 and ECardLL_Occupied == true and ECardLR_Occupied == false:
			get_node("ECardLR").texture_normal = EcardClassTexture
			get_node("ECardLR/Name").text = EcardName
			get_node("ECardLR/Sprite").texture = EcardSprite
			get_node("ECardLR/Health").text = (str(EcardHealth))
			get_node("ECardLR/Attack").text = (str(EcardAttack))
			ECardLR_Occupied = true
			ECardLRAttack = EcardAttack
			ECardLRHealth = EcardHealth
		else:
			enemyPlacementChoice()
	Ecombat()

func Ecombat():
	if ECardUL_Occupied == true:
		if PCardUR_Occupied:
			PCardURHealth -= ECardULAttack
			if PCardURHealth <= 0:
				PCardURclear()
			else:
				get_node("PCardUR/Health").text = (str(PCardURHealth))
		elif PCardUL_Occupied == true:
			PCardULHealth -= ECardULAttack
			if PCardULHealth <= 0:
				PCardULclear()
			else:
				get_node("PCardUL/Health").text = (str(PCardULHealth))
		else:
			get_node("PlayerHealth").value -= ECardULAttack
	elif ECardUR_Occupied == true:
		if PCardUR_Occupied:
			PCardURHealth -= ECardURAttack
			if PCardURHealth <= 0:
				PCardURclear()
			else:
				get_node("PCardUR/Health").text = (str(PCardURHealth))
		elif PCardUL_Occupied == true:
			PCardULHealth -= ECardURAttack
			if PCardULHealth <= 0:
				PCardULclear()
			else:
				get_node("PCardUL/Health").text = (str(PCardULHealth))
		else:
			get_node("PlayerHealth").value -= ECardURAttack
	else:
		pass


	if ECardCL_Occupied == true:
		if PCardCR_Occupied:
			PCardCRHealth -= ECardCLAttack
			if PCardCRHealth <= 0:
				PCardCRclear()
			else:
				get_node("PCardCR/Health").text = (str(PCardCRHealth))
		elif PCardCL_Occupied == true:
			PCardCLHealth -= ECardCLAttack
			if PCardCLHealth <= 0:
				PCardCLclear()
			else:
				get_node("PCardCL/Health").text = (str(PCardCLHealth))
		else:
			get_node("PlayerHealth").value -= ECardCLAttack
	elif ECardCR_Occupied == true:
		if PCardCR_Occupied:
			PCardCRHealth -= ECardCRAttack
			if PCardCRHealth <= 0:
				PCardCRclear()
			else:
				get_node("PCardCR/Health").text = (str(PCardCRHealth))
		elif PCardCL_Occupied == true:
			PCardCLHealth -= ECardCRAttack
			if PCardCLHealth <= 0:
				PCardCLclear()
			else:
				get_node("PCardCL/Health").text = (str(PCardCLHealth))
		else:
			get_node("PlayerHealth").value -= ECardCRAttack
			
			
	if ECardLL_Occupied == true:
		if PCardLR_Occupied:
			PCardLRHealth -= ECardLLAttack
			if PCardLRHealth <= 0:
				PCardLRclear()
			else:
				get_node("PCardLL/Health").text = (str(PCardLRHealth))
		elif PCardLL_Occupied == true:
			PCardLLHealth -= ECardLLAttack
			if PCardLLHealth <= 0:
				PCardLLclear()
			else:
				get_node("PCardLL/Health").text = (str(PCardLLHealth))
		else:
			get_node("PlayerHealth").value -= ECardLLAttack
	if ECardLR_Occupied == true:
		if PCardLR_Occupied:
			PCardLRHealth -= ECardLRAttack
			if PCardLRHealth <= 0:
				PCardLRclear()
			else:
				get_node("PCardLL/Health").text = (str(PCardLRHealth))
		elif PCardLL_Occupied == true:
			PCardLLHealth -= ECardLRAttack
			if PCardLLHealth <= 0:
				PCardLLclear()
			else:
				get_node("PCardLL/Health").text = (str(PCardLLHealth))
		else:
			get_node("PlayerHealth").value -= ECardLRAttack



func playerTurn():
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
	cardAttack = 6
	cardHealth = 7
	cardClass = "Ranged"
	cardSprite = load("res://Graphics/Card Art/Card Artworks/Reds/Trotsky.jpg")
	carddrawn()

func carddrawn():
	if cardClass == "Melee":
		cardClassTexture = load("res://Graphics/Card Art/Melee Card final.png")
	elif cardClass == "Ranged":
		cardClassTexture = load("res://Graphics/Card Art/Ranged Card final.png")
	if card_1_Drawn == false:
		get_node("Card 1").texture_normal = cardClassTexture
		get_node("Card 1/Name").text = cardName
		get_node("Card 1/Sprite").texture = cardSprite
		get_node("Card 1/Health").text = (str(cardHealth))
		get_node("Card 1/Attack").text = (str(cardAttack))
		card_1_Drawn = true
		Card1Attack = cardAttack
		Card1Health = cardHealth
	elif card_2_Drawn == false:
		get_node("Card 2").texture_normal = cardClassTexture
		get_node("Card 2/Name").text = cardName
		get_node("Card 2/Sprite").texture = cardSprite
		get_node("Card 2/Health").text = (str(cardHealth))
		get_node("Card 2/Attack").text = (str(cardAttack))
		Card2Attack = cardAttack
		Card2Health = cardHealth
		card_2_Drawn = true
	elif card_3_Drawn == false:
		get_node("Card 3").texture_normal = cardClassTexture
		get_node("Card 3/Name").text = cardName
		get_node("Card 3/Sprite").texture = cardSprite
		get_node("Card 3/Health").text = (str(cardHealth))
		get_node("Card 3/Attack").text = (str(cardAttack))
		Card3Attack = cardAttack
		Card3Health = cardHealth
		card_3_Drawn = true
	elif card_4_Drawn == false:
		get_node("Card 4").texture_normal = cardClassTexture
		get_node("Card 4/Name").text = cardName
		get_node("Card 4/Sprite").texture = cardSprite
		get_node("Card 4/Health").text = (str(cardHealth))
		get_node("Card 4/Attack").text = (str(cardAttack))
		card_4_Drawn = true
		Card4Attack = cardAttack
		Card4Health = cardHealth
	elif card_5_Drawn == false:
		get_node("Card 5").texture_normal = cardClassTexture
		get_node("Card 5/Name").text = cardName
		get_node("Card 5/Sprite").texture = cardSprite
		get_node("Card 5/Health").text = (str(cardHealth))
		get_node("Card 5/Attack").text = (str(cardAttack))
		card_5_Drawn = true
		Card5Attack = cardAttack
		Card5Health = cardHealth
	else:
		pass
		
func _on_Card_1_pressed():
	if card_1_Drawn == true and cardsPlayed == 0:
		card_1_Pressed = true
		card_2_Pressed = false
		card_3_Pressed = false
		card_4_Pressed = false
		card_5_Pressed = false
	else:
		pass

func _on_Card_2_pressed():
	if card_2_Drawn == true and cardsPlayed == 0:
		card_2_Pressed = true
		card_1_Pressed = false
		card_3_Pressed = false
		card_4_Pressed = false
		card_5_Pressed = false
	else:
		pass

func _on_Card_3_pressed():
	if card_3_Drawn == true and cardsPlayed == 0:
		card_3_Pressed = true
		card_1_Pressed = false
		card_2_Pressed = false
		card_4_Pressed = false
		card_5_Pressed = false
	else:
		pass

func _on_Card_4_pressed():
	if card_4_Drawn == true and cardsPlayed == 0:
		card_4_Pressed = true
		card_1_Pressed = false
		card_2_Pressed = false
		card_3_Pressed = false
		card_5_Pressed = false
	else:
		pass

func _on_Card_5_pressed():
	if card_5_Drawn == true and cardsPlayed == 0:
		card_5_Pressed = true
		card_1_Pressed = false
		card_2_Pressed = false
		card_3_Pressed = false
		card_4_Pressed = false
	else:
		pass

func playerAttack():
	if PCardUR_Occupied == true:
		if ECardUL_Occupied == true:
			ECardULHealth -= PCardURAttack
			if ECardULHealth <= 0:
				ECardULclear()
			else:
				get_node("ECardUL/Health").text = (str(ECardULHealth))
		elif ECardUR_Occupied == true:
			ECardURHealth -= PCardURAttack
			if ECardURHealth <= 0:
				ECardURclear()
			else:
				get_node("ECardUR/Health").text = (str(ECardURHealth))
		else:
			get_node("EnemyPlayerHealth").value -= PCardURAttack
	elif PCardUL_Occupied == true:
		if ECardUL_Occupied == true:
			ECardULHealth -= PCardULAttack
			if ECardULHealth <= 0:
				ECardULclear()
			else:
				get_node("ECardUL/Health").text = (str(ECardULHealth))
		elif ECardUR_Occupied == true:
			ECardURHealth -= PCardULAttack
			if ECardURHealth <= 0:
				ECardURclear()
			else:
				get_node("ECardUR/Health").text = (str(ECardURHealth))
		else:
			get_node("EnemyPlayerHealth").value -= PCardULAttack
	else:
		pass
	if PCardCR_Occupied == true:
		if ECardCL_Occupied == true:
			ECardCLHealth -= PCardCRAttack
			if ECardCLHealth <= 0:
				ECardCLclear()
			else:
				get_node("ECardCL/Health").text = (str(ECardCLHealth))
		elif ECardCR_Occupied == true:
			ECardCRHealth -= PCardURAttack
			if ECardCRHealth <= 0:
				ECardCRclear()
			else:
				get_node("ECardCR/Health").text = (str(ECardCRHealth))
		else:
			get_node("EnemyPlayerHealth").value -= PCardCRAttack
	elif PCardCL_Occupied == true:
		if ECardCL_Occupied == true:
			ECardCLHealth -= PCardCLAttack
			if ECardCLHealth <= 0:
				ECardCLclear()
			else:
				get_node("ECardCL/Health").text = (str(ECardCLHealth))
		elif ECardCR_Occupied == true:
			ECardCRHealth -= PCardCLAttack
			if ECardCRHealth <= 0:
				ECardCRclear()
			else:
				get_node("ECardCR/Health").text = (str(ECardCRHealth))
		else:
			get_node("EnemyPlayerHealth").value -= PCardCLAttack
	else:
		pass

	if PCardLR_Occupied == true:
		if ECardLL_Occupied == true:
			ECardLLHealth -= PCardLRAttack
			if ECardLLHealth <= 0:
				ECardLLclear()
			else:
				get_node("ECardLL/Health").text = (str(ECardLLHealth))
		elif ECardLR_Occupied == true:
			ECardLRHealth -= PCardLRAttack
			if ECardLRHealth <= 0:
				ECardLRclear()
			else:
				get_node("ECardLR/Health").text = (str(ECardLRHealth))
		else:
			get_node("EnemyPlayerHealth").value -= PCardLRAttack

	elif PCardLL_Occupied == true:
		if ECardLL_Occupied == true:
			ECardLLHealth -= PCardLLAttack
			if ECardLLHealth <= 0:
				ECardLLclear()
			else:
				get_node("ECardLL/Health").text = (str(ECardLLHealth))
		elif ECardLR_Occupied == true:
			ECardLRHealth -= PCardLLAttack
			if ECardLRHealth <= 0:
				ECardLRclear()
			else:
				get_node("ECardLR/Health").text = (str(ECardLRHealth))
		else:
			get_node("EnemyPlayerHealth").value -= PCardLLAttack
	else:
		pass


func _on_PCardUR_pressed():
	if PCardUR_Occupied == false:
		if card_1_Pressed == true:
			get_node("PCardUR").texture_normal = get_node("Card 1").texture_normal
			get_node("PCardUR/Sprite").texture = get_node("Card 1/Sprite").texture
			get_node("PCardUR/Health").text = get_node("Card 1/Health").text
			get_node("PCardUR/Attack").text = get_node("Card 1/Attack").text
			get_node("PCardUR/Name").text = get_node("Card 1/Name").text
			PCardURAttack = Card1Attack
			PCardURHealth = Card1Health
			PCardUR_Occupied = true
			clearCard_1()
		elif card_2_Pressed == true:
			get_node("PCardUR").texture_normal = get_node("Card 2").texture_normal
			get_node("PCardUR/Sprite").texture = get_node("Card 2/Sprite").texture
			get_node("PCardUR/Health").text = get_node("Card 2/Health").text
			get_node("PCardUR/Attack").text = get_node("Card 2/Attack").text
			get_node("PCardUR/Name").text = get_node("Card 2/Name").text
			PCardUR_Occupied = true
			PCardURAttack = Card2Attack
			PCardURHealth = Card2Health
			clearCard_2()
		elif card_3_Pressed == true:
			get_node("PCardUR").texture_normal = get_node("Card 3").texture_normal
			get_node("PCardUR/Sprite").texture = get_node("Card 3/Sprite").texture
			get_node("PCardUR/Health").text = get_node("Card 3/Health").text
			get_node("PCardUR/Attack").text = get_node("Card 3/Attack").text
			get_node("PCardUR/Name").text = get_node("Card 3/Name").text
			PCardUR_Occupied = true
			PCardURAttack = Card3Attack
			PCardURHealth = Card3Health
			clearCard_3()
		elif card_4_Pressed == true:
			get_node("PCardUR").texture_normal = get_node("Card 4").texture_normal
			get_node("PCardUR/Sprite").texture = get_node("Card 4/Sprite").texture
			get_node("PCardUR/Health").text = get_node("Card 4/Health").text
			get_node("PCardUR/Attack").text = get_node("Card 4/Attack").text
			get_node("PCardUR/Name").text = get_node("Card 4/Name").text
			PCardUR_Occupied = true
			PCardURAttack = Card4Attack
			PCardURHealth = Card4Health
			clearCard_4()
		elif card_5_Pressed == true:
			get_node("PCardUR").texture_normal = get_node("Card 5").texture_normal
			get_node("PCardUR/Sprite").texture = get_node("Card 5/Sprite").texture
			get_node("PCardUR/Health").text = get_node("Card 5/Health").text
			get_node("PCardUR/Attack").text = get_node("Card 5/Attack").text
			get_node("PCardUR/Name").text = get_node("Card 5/Name").text
			PCardUR_Occupied = true
			PCardURAttack = Card5Attack
			PCardURHealth = Card5Health
			clearCard_5()

func _on_PCardUL_pressed():
	if PCardUL_Occupied == false:
		if card_1_Pressed == true:
			get_node("PCardUL").texture_normal = get_node("Card 1").texture_normal
			get_node("PCardUL/Sprite").texture = get_node("Card 1/Sprite").texture
			get_node("PCardUL/Health").text = get_node("Card 1/Health").text
			get_node("PCardUL/Attack").text = get_node("Card 1/Attack").text
			get_node("PCardUL/Name").text = get_node("Card 1/Name").text
			PCardUL_Occupied = true
			PCardULAttack = Card1Attack
			PCardULHealth = Card1Health
			clearCard_1()
		elif card_2_Pressed == true:
			get_node("PCardUL").texture_normal = get_node("Card 2").texture_normal
			get_node("PCardUL/Sprite").texture = get_node("Card 2/Sprite").texture
			get_node("PCardUL/Health").text = get_node("Card 2/Health").text
			get_node("PCardUL/Attack").text = get_node("Card 2/Attack").text
			get_node("PCardUL/Name").text = get_node("Card 2/Name").text
			PCardUL_Occupied = true
			PCardULAttack = Card2Attack
			PCardULHealth = Card2Health
			clearCard_2()
		elif card_3_Pressed == true:
			get_node("PCardUL").texture_normal = get_node("Card 3").texture_normal
			get_node("PCardUL/Sprite").texture = get_node("Card 3/Sprite").texture
			get_node("PCardUL/Health").text = get_node("Card 3/Health").text
			get_node("PCardUL/Attack").text = get_node("Card 3/Attack").text
			get_node("PCardUL/Name").text = get_node("Card 3/Name").text
			PCardUL_Occupied = true
			PCardULAttack = Card3Attack
			PCardULHealth = Card3Health
			clearCard_3()
		elif card_4_Pressed == true:
			get_node("PCardUL").texture_normal = get_node("Card 4").texture_normal
			get_node("PCardUL/Sprite").texture = get_node("Card 4/Sprite").texture
			get_node("PCardUL/Health").text = get_node("Card 4/Health").text
			get_node("PCardUL/Attack").text = get_node("Card 4/Attack").text
			get_node("PCardUL/Name").text = get_node("Card 4/Name").text
			PCardUL_Occupied = true
			PCardULAttack = Card4Attack
			PCardULHealth = Card4Health
			clearCard_4()
		elif card_5_Pressed == true:
			get_node("PCardUL").texture_normal = get_node("Card 5").texture_normal
			get_node("PCardUL/Sprite").texture = get_node("Card 5/Sprite").texture
			get_node("PCardUL/Health").text = get_node("Card 5/Health").text
			get_node("PCardUL/Attack").text = get_node("Card 5/Attack").text
			get_node("PCardUL/Name").text = get_node("Card 5/Name").text
			PCardUL_Occupied = true
			PCardULAttack = Card5Attack
			PCardULHealth = Card5Health
			clearCard_5()

func _on_PCardCL_pressed():
	if PCardCL_Occupied == false:
		if card_1_Pressed == true:
			get_node("PCardCL").texture_normal = get_node("Card 1").texture_normal
			get_node("PCardCL/Sprite").texture = get_node("Card 1/Sprite").texture
			get_node("PCardCL/Health").text = get_node("Card 1/Health").text
			get_node("PCardCL/Attack").text = get_node("Card 1/Attack").text
			get_node("PCardCL/Name").text = get_node("Card 1/Name").text
			PCardCL_Occupied = true
			PCardCLAttack = Card1Attack
			PCardCLHealth = Card1Health
			clearCard_1()
		elif card_2_Pressed == true:
			get_node("PCardCL").texture_normal = get_node("Card 2").texture_normal
			get_node("PCardCL/Sprite").texture = get_node("Card 2/Sprite").texture
			get_node("PCardCL/Health").text = get_node("Card 2/Health").text
			get_node("PCardCL/Attack").text = get_node("Card 2/Attack").text
			get_node("PCardCL/Name").text = get_node("Card 2/Name").text
			PCardCL_Occupied = true
			PCardCLAttack = Card2Attack
			PCardCLHealth = Card2Health
			clearCard_2()
		elif card_3_Pressed == true:
			get_node("PCardCL").texture_normal = get_node("Card 3").texture_normal
			get_node("PCardCL/Sprite").texture = get_node("Card 3/Sprite").texture
			get_node("PCardCL/Health").text = get_node("Card 3/Health").text
			get_node("PCardCL/Attack").text = get_node("Card 3/Attack").text
			get_node("PCardCL/Name").text = get_node("Card 3/Name").text
			PCardCL_Occupied = true
			PCardCLAttack = Card3Attack
			PCardCLHealth = Card3Health
			clearCard_3()
		elif card_4_Pressed == true:
			get_node("PCardCL").texture_normal = get_node("Card 4").texture_normal
			get_node("PCardCL/Sprite").texture = get_node("Card 4/Sprite").texture
			get_node("PCardCL/Health").text = get_node("Card 4/Health").text
			get_node("PCardCL/Attack").text = get_node("Card 4/Attack").text
			get_node("PCardCL/Name").text = get_node("Card 4/Name").text
			PCardCL_Occupied = true
			PCardCLAttack = Card4Attack
			PCardCLHealth = Card4Health
			clearCard_4()
		elif card_5_Pressed == true:
			get_node("PCardCL").texture_normal = get_node("Card 5").texture_normal
			get_node("PCardCL/Sprite").texture = get_node("Card 5/Sprite").texture
			get_node("PCardCL/Health").text = get_node("Card 5/Health").text
			get_node("PCardCL/Attack").text = get_node("Card 5/Attack").text
			get_node("PCardCL/Name").text = get_node("Card 5/Name").text
			PCardCL_Occupied = true
			PCardCLAttack = Card5Attack
			PCardCLHealth = Card5Health
			clearCard_5()


func _on_PCardCR_pressed():
	if PCardCR_Occupied == false:
		if card_1_Pressed == true:
			get_node("PCardCR").texture_normal = get_node("Card 1").texture_normal
			get_node("PCardCR/Sprite").texture = get_node("Card 1/Sprite").texture
			get_node("PCardCR/Health").text = get_node("Card 1/Health").text
			get_node("PCardCR/Attack").text = get_node("Card 1/Attack").text
			get_node("PCardCR/Name").text = get_node("Card 1/Name").text
			PCardCR_Occupied = true
			PCardCRAttack = Card1Attack
			PCardCRHealth = Card1Health
			
			clearCard_1()
		elif card_2_Pressed == true:
			get_node("PCardCR").texture_normal = get_node("Card 2").texture_normal
			get_node("PCardCR/Sprite").texture = get_node("Card 2/Sprite").texture
			get_node("PCardCR/Health").text = get_node("Card 2/Health").text
			get_node("PCardCR/Attack").text = get_node("Card 2/Attack").text
			get_node("PCardCR/Name").text = get_node("Card 2/Name").text
			PCardCR_Occupied = true
			PCardCRAttack = Card2Attack
			PCardCRHealth = Card2Health
			clearCard_2()
		elif card_3_Pressed == true:
			get_node("PCardCR").texture_normal = get_node("Card 3").texture_normal
			get_node("PCardCR/Sprite").texture = get_node("Card 3/Sprite").texture
			get_node("PCardCR/Health").text = get_node("Card 3/Health").text
			get_node("PCardCR/Attack").text = get_node("Card 3/Attack").text
			get_node("PCardCR/Name").text = get_node("Card 3/Name").text
			PCardCR_Occupied = true
			PCardCRAttack = Card3Attack
			PCardCRHealth = Card3Health
			clearCard_3()
		elif card_4_Pressed == true:
			get_node("PCardCR").texture_normal = get_node("Card 4").texture_normal
			get_node("PCardCR/Sprite").texture = get_node("Card 4/Sprite").texture
			get_node("PCardCR/Health").text = get_node("Card 4/Health").text
			get_node("PCardCR/Attack").text = get_node("Card 4/Attack").text
			get_node("PCardCR/Name").text = get_node("Card 4/Name").text
			PCardCR_Occupied = true
			PCardCRAttack = Card4Attack
			PCardCRHealth = Card4Health
			clearCard_4()
		elif card_5_Pressed == true:
			get_node("PCardCR").texture_normal = get_node("Card 5").texture_normal
			get_node("PCardCR/Sprite").texture = get_node("Card 5/Sprite").texture
			get_node("PCardCR/Health").text = get_node("Card 5/Health").text
			get_node("PCardCR/Attack").text = get_node("Card 5/Attack").text
			get_node("PCardCR/Name").text = get_node("Card 5/Name").text
			PCardCR_Occupied = true
			PCardCRAttack = Card5Attack
			PCardCRHealth = Card5Health
			clearCard_5()


func _on_PCardLL_pressed():
	if PCardLL_Occupied == false:
		if card_1_Pressed == true:
			get_node("PCardLL").texture_normal = get_node("Card 1").texture_normal
			get_node("PCardLL/Sprite").texture = get_node("Card 1/Sprite").texture
			get_node("PCardLL/Health").text = get_node("Card 1/Health").text
			get_node("PCardLL/Attack").text = get_node("Card 1/Attack").text
			get_node("PCardLL/Name").text = get_node("Card 1/Name").text
			PCardLLAttack = Card1Attack
			PCardLLHealth = Card1Health
			PCardLL_Occupied = true
			clearCard_1()
		elif card_2_Pressed == true:
			get_node("PCardLL").texture_normal = get_node("Card 2").texture_normal
			get_node("PCardLL/Sprite").texture = get_node("Card 2/Sprite").texture
			get_node("PCardLL/Health").text = get_node("Card 2/Health").text
			get_node("PCardLL/Attack").text = get_node("Card 2/Attack").text
			get_node("PCardLL/Name").text = get_node("Card 2/Name").text
			PCardLL_Occupied = true
			PCardLLAttack = Card2Attack
			PCardLLHealth = Card2Health
			clearCard_2()
		elif card_3_Pressed == true:
			get_node("PCardLL").texture_normal = get_node("Card 3").texture_normal
			get_node("PCardLL/Sprite").texture = get_node("Card 3/Sprite").texture
			get_node("PCardLL/Health").text = get_node("Card 3/Health").text
			get_node("PCardLL/Attack").text = get_node("Card 3/Attack").text
			get_node("PCardLL/Name").text = get_node("Card 3/Name").text
			PCardLL_Occupied = true
			PCardLLAttack = Card3Attack
			PCardLLHealth = Card3Health
			clearCard_3()
		elif card_4_Pressed == true:
			get_node("PCardLL").texture_normal = get_node("Card 4").texture_normal
			get_node("PCardLL/Sprite").texture = get_node("Card 4/Sprite").texture
			get_node("PCardLL/Health").text = get_node("Card 4/Health").text
			get_node("PCardLL/Attack").text = get_node("Card 4/Attack").text
			get_node("PCardLL/Name").text = get_node("Card 4/Name").text
			PCardLL_Occupied = true
			PCardLLAttack = Card4Attack
			PCardLLHealth = Card4Health
			clearCard_4()
		elif card_5_Pressed == true:
			get_node("PCardLL").texture_normal = get_node("Card 5").texture_normal
			get_node("PCardLL/Sprite").texture = get_node("Card 5/Sprite").texture
			get_node("PCardLL/Health").text = get_node("Card 5/Health").text
			get_node("PCardLL/Attack").text = get_node("Card 5/Attack").text
			get_node("PCardLL/Name").text = get_node("Card 5/Name").text
			PCardLL_Occupied = true
			PCardLLAttack = Card5Attack
			PCardLLHealth = Card5Health
			clearCard_5()


func _on_PCardLR_pressed():
	if PCardLR_Occupied == false:
		if card_1_Pressed == true:
			get_node("PCardLR").texture_normal = get_node("Card 1").texture_normal
			get_node("PCardLR/Sprite").texture = get_node("Card 1/Sprite").texture
			get_node("PCardLR/Health").text = get_node("Card 1/Health").text
			get_node("PCardLR/Attack").text = get_node("Card 1/Attack").text
			get_node("PCardLR/Name").text = get_node("Card 1/Name").text
			PCardLR_Occupied = true
			PCardLRAttack = Card1Attack
			PCardLRHealth = Card1Health
			clearCard_1()
		elif card_2_Pressed == true:
			get_node("PCardLR").texture_normal = get_node("Card 2").texture_normal
			get_node("PCardLR/Sprite").texture = get_node("Card 2/Sprite").texture
			get_node("PCardLR/Health").text = get_node("Card 2/Health").text
			get_node("PCardLR/Attack").text = get_node("Card 2/Attack").text
			get_node("PCardLR/Name").text = get_node("Card 2/Name").text
			PCardLR_Occupied = true
			PCardLRAttack = Card2Attack
			PCardLRHealth = Card2Health
			clearCard_2()
		elif card_3_Pressed == true:
			get_node("PCardLR").texture_normal = get_node("Card 3").texture_normal
			get_node("PCardLR/Sprite").texture = get_node("Card 3/Sprite").texture
			get_node("PCardLR/Health").text = get_node("Card 3/Health").text
			get_node("PCardLR/Attack").text = get_node("Card 3/Attack").text
			get_node("PCardLR/Name").text = get_node("Card 3/Name").text
			PCardLR_Occupied = true
			PCardLRAttack = Card3Attack
			PCardLRHealth = Card3Health
			clearCard_3()
		elif card_4_Pressed == true:
			get_node("PCardLR").texture_normal = get_node("Card 4").texture_normal
			get_node("PCardLR/Sprite").texture = get_node("Card 4/Sprite").texture
			get_node("PCardLR/Health").text = get_node("Card 4/Health").text
			get_node("PCardLR/Attack").text = get_node("Card 4/Attack").text
			get_node("PCardLR/Name").text = get_node("Card 4/Name").text
			PCardLR_Occupied = true
			PCardLRAttack = Card4Attack
			PCardLRHealth = Card4Health
			clearCard_4()
		elif card_5_Pressed == true:
			get_node("PCardLR").texture_normal = get_node("Card 5").texture_normal
			get_node("PCardLR/Sprite").texture = get_node("Card 5/Sprite").texture
			get_node("PCardLR/Health").text = get_node("Card 5/Health").text
			get_node("PCardLR/Attack").text = get_node("Card 5/Attack").text
			get_node("PCardLR/Name").text = get_node("Card 5/Name").text
			PCardLR_Occupied = true
			PCardLRAttack = Card5Attack
			PCardLRHealth = Card5Health
			clearCard_5()



###Resets card nodes to original values. Also adds one to cards played
func clearCard_1():
	get_node("Card 1").texture_normal = null
	get_node("Card 1/Name").text = ""
	get_node("Card 1/Sprite").texture = null
	get_node("Card 1/Health").text = ""
	get_node("Card 1/Attack").text = ""
	Card1Attack = 0
	Card1Health = 0
	card_1_Drawn = false
	card_1_Pressed = false
	cardsPlayed += 1

func clearCard_2():
	get_node("Card 2").texture_normal = null
	get_node("Card 2/Name").text = ""
	get_node("Card 2/Sprite").texture = null
	get_node("Card 2/Health").text = ""
	get_node("Card 2/Attack").text = ""
	card_2_Drawn = false
	card_2_Pressed = false
	Card2Attack = 0
	Card2Health = 0
	cardsPlayed += 1
func clearCard_3():
	get_node("Card 3").texture_normal = null
	get_node("Card 3/Name").text = ""
	get_node("Card 3/Sprite").texture = null
	get_node("Card 3/Health").text = ""
	get_node("Card 3/Attack").text = ""
	card_3_Drawn = false
	card_3_Pressed = false
	cardsPlayed += 1
	Card3Attack = 0
	Card3Health = 0
func clearCard_4():
	get_node("Card 4").texture_normal = null
	get_node("Card 4/Name").text = ""
	get_node("Card 4/Sprite").texture = null
	get_node("Card 4/Health").text = ""
	get_node("Card 4/Attack").text = ""
	card_4_Drawn = false
	card_4_Pressed = false
	cardsPlayed += 1
	Card4Attack = 0
	Card4Health = 0
func clearCard_5():
	get_node("Card 5").texture_normal = null
	get_node("Card 5/Name").text = ""
	get_node("Card 5/Sprite").texture = null
	get_node("Card 5/Health").text = ""
	get_node("Card 5/Attack").text = ""
	card_5_Drawn = false
	card_5_Pressed = false
	cardsPlayed += 1
	Card5Attack = 0
	Card5Health = 0
	
	
func PCardURclear():
	get_node("PCardUR").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("PCardUR/Sprite").texture = null
	get_node("PCardUR/Name").text = ""
	get_node("PCardUR/Attack").text = ""
	get_node("PCardUR/Health").text = ""
	PCardUR_Occupied = false
func PCardULclear():
	get_node("PCardUL").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("PCardUL/Sprite").texture = null
	get_node("PCardUL/Name").text = ""
	get_node("PCardUL/Attack").text = ""
	get_node("PCardUL/Health").text = ""
	PCardUL_Occupied = false
func PCardCRclear():
	get_node("PCardCR").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("PCardCR/Sprite").texture = null
	get_node("PCardCR/Name").text = ""
	get_node("PCardCR/Attack").text = ""
	get_node("PCardCR/Health").text = ""
	PCardCR_Occupied = false
func PCardCLclear():
	get_node("PCardCL").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("PCardCL/Sprite").texture = null
	get_node("PCardCL/Name").text = ""
	get_node("PCardCL/Attack").text = ""
	get_node("PCardCL/Health").text = ""
	PCardCL_Occupied = false
func PCardLLclear():
	get_node("PCardLL").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("PCardLL/Sprite").texture = null
	get_node("PCardLL/Name").text = ""
	get_node("PCardLL/Attack").text = ""
	get_node("PCardLL/Health").text = ""
	PCardLL_Occupied = false
func PCardLRclear():
	get_node("PCardLR").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("PCardLR/Sprite").texture = null
	get_node("PCardLR/Name").text = ""
	get_node("PCardLR/Attack").text = ""
	get_node("PCardLR/Health").text = ""
	PCardLR_Occupied = false
func ECardURclear():
	get_node("ECardUR").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("ECardUR/Sprite").texture = null
	get_node("ECardUR/Name").text = ""
	get_node("ECardUR/Attack").text = ""
	get_node("ECardUR/Health").text = ""
	ECardUR_Occupied = false
func ECardULclear():
	get_node("ECardUL").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("ECardUL/Sprite").texture = null
	get_node("ECardUL/Name").text = ""
	get_node("ECardUL/Attack").text = ""
	get_node("ECardUL/Health").text = ""
	ECardUL_Occupied = false
func ECardCRclear():
	get_node("ECardCR").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("ECardCR/Sprite").texture = null
	get_node("ECardCR/Name").text = ""
	get_node("ECardCR/Attack").text = ""
	get_node("ECardCR/Health").text = ""
	ECardCR_Occupied = false
func ECardCLclear():
	get_node("ECardCL").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("ECardCL/Sprite").texture = null
	get_node("ECardCL/Name").text = ""
	get_node("ECardCL/Attack").text = ""
	get_node("ECardCL/Health").text = ""
	ECardCL_Occupied = false
func ECardLLclear():
	get_node("ECardLL").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("ECardLL/Sprite").texture = null
	get_node("ECardLL/Name").text = ""
	get_node("ECardLL/Attack").text = ""
	get_node("ECardLL/Health").text = ""
	ECardLL_Occupied = false
func ECardLRclear():
	get_node("ECardLR").texture_normal = load("res://Graphics/Card Art/Maps/map2.png")
	get_node("ECardLR/Sprite").texture = null
	get_node("ECardLR/Name").text = ""
	get_node("ECardLR/Attack").text = ""
	get_node("ECardLR/Health").text = ""
	ECardLR_Occupied = false