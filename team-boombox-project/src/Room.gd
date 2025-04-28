extends Node2D

@export var dialogSignal:int = -1

@export var hasGears = false

@export var tutorialLabel:Label

func _ready() -> void:
	if dialogSignal != -1:
		JavaScriptBridge.eval("console.log(\"Dialouge Sent!\");",true)
		JavaScriptBridge.eval(str("triggerDialogue(",handleDialouge(dialogSignal),")"),true)
		
	if hasGears:
		var track = 4
		for i in get_children(): 
			if i.name.begins_with("Gear"):
				get_parent().get_parent().swap_mus(track, i.audio)
				i.distTrack = track
				i.distAudio = true
				i.player = get_parent().get_parent().get_player()
				track+=1;
	get_parent().get_parent()._resetExtraTracks()
	
	if tutorialLabel != null:
		var player = get_parent().get_parent().get_player()
		match tutorialLabel.name:
			"pwr1":
				if player.jumpPwr: tutorialLabel.text = "Boombi's Jumps are \nnow higher"
				elif player.ladderPwr: tutorialLabel.text = "Press Alt to \nplace a ladder"
			"pwr2":
				if player.pushPwr: tutorialLabel.text = "Press ctrl to \nPush Blocks"
				elif player.pullPwr: tutorialLabel.text = "Press ctrl to \nPull Blocks"
			"pwr3":
				if player.floatPwr: tutorialLabel.text = "Hold Shift to \n slow Boombi's fall"
				elif player.dashPwr: tutorialLabel.text = "Press Shift to \n Dash"
	
func handleDialouge(id):
	match id:
		0: #Start IDs 0-9
			return "0"
		
		1: #First Choice
			return "10"
		
		2: #Bassline 1
			return "11"
		
		3: #Bassline 2
			return "12"
		
		4: #Old Man RC IDs 13-26
			return "13"
		
		5: #Second Choice
			return "27"
		
		6: #Chord 1.1
			return "28"
		
		7: #Chord 1.2
			return "29"
		
		8: #Chord 2.1
			return "30"
		
		9: #Chord 2.2
			return "31"
		
		10: #Phone 2 IDs 33-50
			return "33"
		
		11: #Melody Pick
			return "51" 
		
		12: #Melody 1.1
			return "52"
		
		13: #Melody 1.2
			return "53"
		
		14: #Melody 2.1
			return "54"
		
		15: #Melody 2.2
			return "55"
		
		16: #Post Melody Dialouge
			return "56"
		
		17: #Final Dialouge IDs 58-77
			return "58"
		
		18: #Post Chord Choice
			return "32"
