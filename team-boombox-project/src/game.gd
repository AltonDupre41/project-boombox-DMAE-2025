extends Node2D

@onready var layer1:ShaderMaterial = load("res://assets/layer1.tres")
@onready var layer2:ShaderMaterial = load("res://assets/layer2.tres")
@onready var layer3:ShaderMaterial = load("res://assets/layer3.tres")
@onready var lvlAudio:AudioStreamSynchronized = load("res://assets/music/SynchAudio.tres")

@export var ladderScene:PackedScene

var gearRoute = -1
	
var currentPal = 0
var curRoom:Node2D
var curRoomScene:PackedScene = load("res://scenes/Rooms/StartRoom.tscn")

var playerSpawn = Vector2(0,0)

var trackNum = 6

func _ready() -> void:
	curRoom = $Room.get_child(0)
	playerSpawn = curRoom.get_node("NewPlayerPos").global_position
	lvlAudio.stream_count = trackNum
	JavaScriptBridge.eval("console.log(\"Hello world!\");",true)


func _physics_process(_delta: float) -> void:
	pass

func _loadRoom(RoomScene:PackedScene, playerOveride = playerSpawn):
	curRoomScene = RoomScene
	var NewRoom = RoomScene.instantiate()
	NewRoom.hide()
	if playerSpawn != NewRoom.get_node("NewPlayerPos").global_position:
		playerSpawn = NewRoom.get_node("NewPlayerPos").global_position
	$Entities/Player.global_position = playerSpawn
	await get_tree().process_frame
	$Room.add_child(NewRoom)
	curRoom.hide()
	NewRoom.show()
	curRoom.queue_free()
	await get_tree().process_frame
	curRoom = NewRoom
	curRoom.name = "Room"
	placeLadder(true)

#Checks for other gears in the room and removes them
func gearCheck():
	for i in $Room.get_child(0).get_children():
		if i.name.begins_with("Gear"):
			i.queue_free()

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
	if sound == null:
		lvlAudio.set_sync_stream(track,null)
	else: 
		lvlAudio.set_sync_stream(track, sound)
	$AudioStreamPlayer.play(pause)

func _gearGet(gear):
	swap_mus(4,null)
	swap_mus(5,null)
	swap_pal(gear.palLayer,gear.pal)
	swap_mus(gear.track,gear.audio)
	$Entities/Player.givePower(gear.power)
	if gear.gearRoute > -1:
		gearRoute = gear.gearRoute
		$Entities/Player.gearRoute = gear.gearRoute
	if gear.gearDia != -1:
		$Room.get_child(0).handleDialouge(gear.gearDia)
	await get_tree().process_frame
	gearCheck()
	

func _nearGear(track,dist, overide):
	if overide:
		lvlAudio.set_sync_stream_volume(track,dist)
		return
	else: 
		var value = lerp(10,-30, dist/80)
		lvlAudio.set_sync_stream_volume(track,value)

func _resetExtraTracks():
	if lvlAudio != null and lvlAudio.get_sync_stream(4) != null and lvlAudio.get_sync_stream(4) != null:
		lvlAudio.set_sync_stream_volume(4,-60)
		lvlAudio.set_sync_stream_volume(5,-60)

func get_player():
	return $Entities/Player

func _restart():
	_loadRoom(curRoomScene)

func placeLadder(remove = false):
	if remove:
		if get_node("Entities").get_node("ladder") != null:
			get_node("Entities").get_node("ladder").free()
		return
	
	if get_node("Entities").get_node("ladder") != null:
		get_node("Entities").get_node("ladder").free()
	var playerPos = $Entities/Player.global_position
	var playerDir = round($Entities/Player/AnimatedSprite2D.scale.x)
	var playerMap = $Room/Room/Col/ColLayer.local_to_map(playerPos)
	var ladderMap = $Room/Room/Col/ColLayer.map_to_local(Vector2(playerMap.x + playerDir,playerMap.y))
	
	var ladder = ladderScene.instantiate()
	ladder.name = "ladder"
	ladder.position = ladderMap
	ladder.position.y = playerPos.y
	$Entities.add_child(ladder)

func moveBlock(pull):
	if pull:
		var playerPos = $Entities/Player.position
		var playerDir = roundi($Entities/Player/AnimatedSprite2D.scale.x)
		var BlockMap = $Room/Room/Col/Blocks.local_to_map(playerPos)
		var playerMap = BlockMap
		playerMap.x = BlockMap.x - (2 * playerDir)
		BlockMap.x = BlockMap.x + (1 * playerDir);
		$Room/Room/Col/Blocks.erase_cell(BlockMap)
		
		BlockMap.x = BlockMap.x - (1 * playerDir)
		$Entities/Player.position = $Room/Room/Col/Blocks.map_to_local(playerMap)
		
		$Room/Room/Col/Blocks.set_cell(BlockMap, 0, Vector2i(0,0))
		return
	else:
		var playerPos = $Entities/Player.position
		var playerDir = roundi($Entities/Player/AnimatedSprite2D.scale.x)
		var BlockMap = $Room/Room/Col/Blocks.local_to_map(playerPos)
		var playerMap = BlockMap
		BlockMap.x = BlockMap.x + (1 * playerDir);
		$Room/Room/Col/Blocks.erase_cell(BlockMap)
		BlockMap.x = BlockMap.x + (1 * playerDir)
		$Room/Room/Col/Blocks.set_cell(BlockMap, 0, Vector2i(0,0))
		return

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug1"):
		presentation_Debug(0)
	if event.is_action_pressed("debug2"):
		presentation_Debug(1)
	if event.is_action_pressed("debug3"):
		presentation_Debug(2)
	if event.is_action_pressed("debug4"):
		presentation_Debug(3)
	if event.is_action_pressed("restartGame"):
		presentation_Debug(4)

func presentation_Debug(num):
	match num:
		0:
			$Entities/Player.jumpPwr = false
			$Entities/Player.ladderPwr = false
			$Entities/Player.dashPwr = false
			$Entities/Player/DashBar.hide()
			$Entities/Player.floatPwr = false
			$Entities/Player.pushPwr = false
			$Entities/Player.pullPwr = false
			
			for i in range(1,trackNum):
				lvlAudio.set_sync_stream(i,null)
			
			_loadRoom(load("res://scenes/Rooms/Room1-3.tscn"),Vector2(-176.0,-145.0))
		1:
			if $Entities/Player.gearRoute == 1:
				_loadRoom(load("res://scenes/Rooms/Room2-3-alt.tscn"))
			else:
				_loadRoom(load("res://scenes/Rooms/Room2-3.tscn"))
			
			$Entities/Player.dashPwr = false
			$Entities/Player.floatPwr = false
			$Entities/Player.pushPwr = false
			$Entities/Player.pullPwr = false
			$Entities/Player/DashBar.hide()
			
			for i in range(2,trackNum):
				lvlAudio.set_sync_stream(i,null)
			
		2:
			if $Entities/Player.gearRoute == 1:
				_loadRoom(load("res://scenes/Rooms/Room3-3-alt.tscn"))
			else:
				_loadRoom(load("res://scenes/Rooms/Room3-3.tscn"))
			
			$Entities/Player.dashPwr = false
			$Entities/Player.floatPwr = false
			$Entities/Player/DashBar.hide()
			
			for i in range(3,trackNum):
				lvlAudio.set_sync_stream(i,null)
			
		3:
			if $Entities/Player.gearRoute == 1:
				$Entities/Player.gearRoute = 0
			else:
				$Entities/Player.gearRoute = 1
		
		4:
			$Entities/Player.jumpPwr = false
			$Entities/Player.ladderPwr = false
			$Entities/Player.dashPwr = false
			$Entities/Player/DashBar.hide()
			$Entities/Player.floatPwr = false
			$Entities/Player.pushPwr = false
			$Entities/Player.pullPwr = false
			
			var pause = $AudioStreamPlayer.get_playback_position()
			$AudioStreamPlayer.stop()
			for i in range(1,trackNum):
				lvlAudio.set_sync_stream(i,null)
			
			lvlAudio.set_sync_stream_volume(0,0)
			$AudioStreamPlayer.play(pause)
			
			_loadRoom(load("res://scenes/Rooms/StartRoom.tscn"),Vector2(-127.0,-103.0))
