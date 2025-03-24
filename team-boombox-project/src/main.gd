extends Node

@export var SETTINGS = {
	"MusicVolume":99,
	}
enum controlers{GAMEPAD,MOUSE}
var curControler: controlers

var lvl_scene:Node2D

@export var DEBUG = false
@export var startState: String 
var GAMESTATE

func changeState(path):
	var gamestate_scene: PackedScene
	if get_child_count() > 0: 
		remove_child(GAMESTATE)
		GAMESTATE.queue_free()
		
	if path != "":
		gamestate_scene = load(path)
	GAMESTATE = gamestate_scene.instantiate()
	add_child(GAMESTATE,true)
	return GAMESTATE

func _ready():
	if startState != null:
		lvl_scene = changeState(startState)
	#JavaScriptBridge.eval("consoleMsg",true)
