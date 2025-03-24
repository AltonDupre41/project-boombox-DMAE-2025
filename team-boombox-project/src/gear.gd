extends Node2D

signal gearGet(gear)

@export var gearNum:int = 0

@export var audio:AudioStream
@export var track:int = 0
@export var pal:CompressedTexture2D
@export var palLayer:int = 1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("gearGet")
		gearGet.emit(self)
		queue_free()

func _on_tree_entered() -> void:
	connect("gearGet",Callable(get_parent().get_parent().get_parent(),"_gearGet"))
	pass
