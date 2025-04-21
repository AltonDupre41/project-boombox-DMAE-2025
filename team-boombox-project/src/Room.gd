extends Node2D

@export var dialogSignal = "1"

func _ready() -> void:
	if dialogSignal != "-1":
		JavaScriptBridge.eval("console.log(\"Dialouge Sent!\");",true)
		JavaScriptBridge.eval(str("triggerDialogue(",dialogSignal,")"),true)
