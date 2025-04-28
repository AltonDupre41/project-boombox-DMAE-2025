extends Area2D

signal loadRoom(room:PackedScene)

@export var Room:PackedScene
@export var AltRoom:PackedScene

@export var hasAlt = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("load Room")
		if hasAlt && body.gearRoute == 1:
			loadRoom.emit(AltRoom)
			return
		loadRoom.emit(Room)

func _on_tree_entered() -> void:
	connect("loadRoom",Callable(get_parent().get_parent().get_parent().get_parent(),"_loadRoom"))
	pass
