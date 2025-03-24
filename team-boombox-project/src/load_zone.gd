extends Area2D

signal loadRoom(room:PackedScene)

@export var Room:PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("load Room")
		loadRoom.emit(Room)

func _on_tree_entered() -> void:
	connect("loadRoom",Callable(get_parent().get_parent().get_parent().get_parent(),"_loadRoom"))
	pass
