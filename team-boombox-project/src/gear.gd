extends Node2D

signal gearGet(gear)
signal nearGear(track,dist, overide)

@export var gearNum:int = 0

@export var audio:AudioStream
@export var track:int = 0
@export var pal:CompressedTexture2D
@export var palLayer:int = 1
@export var power = -1

@export var gearRoute = -1

@export var mat:CompressedTexture2D

@export var gearDia = -1

var distAudio = false
var distTrack = 0
var player:CharacterBody2D

func _process(delta: float) -> void:
	if distAudio: 
		if global_position.distance_to(player.global_position) < 80:
			nearGear.emit(distTrack,global_position.distance_to(player.global_position),false)
		else: nearGear.emit(distTrack, -60, true)
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("gearGet")
		gearGet.emit(self)
		queue_free()

func _on_tree_entered() -> void:
	connect("gearGet",Callable(get_parent().get_parent().get_parent(),"_gearGet"))
	connect("nearGear",Callable(get_parent().get_parent().get_parent(),"_nearGear"))
	pass
