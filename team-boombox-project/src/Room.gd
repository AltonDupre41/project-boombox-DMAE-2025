extends Node2D

@export var dialogSignal = "-1"

func _ready() -> void:
	if dialogSignal != "-1":
		JavaScriptBridge.eval(str("triggerDialogue(",dialogSignal,")"),true)
		
