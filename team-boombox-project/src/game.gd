extends Node2D

@onready var layer1:ShaderMaterial = load("res://assets/layer1.tres")
@onready var layer2:ShaderMaterial = load("res://assets/layer2.tres")
@onready var layer3:ShaderMaterial = load("res://assets/layer3.tres")
@onready var lvlAudio:AudioStreamSynchronized = load("res://assets/music/SynchAudio.tres")

#@onready var pal1 = load("res://assets/pal1.png")
#@onready var pal2 = load("res://assets/pal2.png")
#@onready var pal3 = load("res://assets/pal3.png")
#@onready var pal4 = load("res://assets/pal4.png")
#@onready var pal5 = load("res://assets/pal5.png")
#@onready var pal6 = load("res://assets/pal6.png")
#
#@onready var palList = {
	#0:pal1,
	#1:pal2,
	#2:pal3,
	#3:pal4,
	#4:pal5,
	#5:pal6,
#}
	
var currentPal = 0
var curRoom:Node2D
var curRoomScene:PackedScene = load("res://scenes/Rooms/StartRoom.tscn")

var trackNum = 4

func _ready() -> void:
	curRoom = $Room.get_child(0)
	lvlAudio.stream_count = trackNum


func _physics_process(_delta: float) -> void:
	pass

func _loadRoom(RoomScene:PackedScene):
	$Entities/Player.position = curRoom.get_node("NewPlayerPos").position
	await get_tree().process_frame
	curRoomScene = RoomScene
	var NewRoom = RoomScene.instantiate()
	NewRoom.hide()
	$Room.add_child(NewRoom)
	curRoom.hide()
	NewRoom.show()
	curRoom.queue_free()
	curRoom = NewRoom

#Checks if a gear has already been grabbed
func gearCheck():
	pass

func swap_pal(layer, newPal = null):
	match layer:
		1:
			layer1.set_shader_parameter("palette",newPal)
			curRoom.get_node("Col/TileMapLayer1").show()
		2:
			layer2.set_shader_parameter("palette",newPal)
			curRoom.get_node("Col/TileMapLayer2").show()
		3:
			layer3.set_shader_parameter("palette",newPal)
			curRoom.get_node("Col/TileMapLayer3").show()

func swap_mus(track,sound):
	var pause = $AudioStreamPlayer.get_playback_position()
	$AudioStreamPlayer.stop()
	lvlAudio.set_sync_stream(track, sound)
	$AudioStreamPlayer.play(pause)

func _gearGet(gear):
	swap_pal(gear.palLayer,gear.pal)
	swap_mus(gear.track,gear.audio)

func _restart():
	_loadRoom(curRoomScene)
