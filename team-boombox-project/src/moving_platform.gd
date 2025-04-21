extends TileMapLayer
@export var maxHeight:float = 20
@export var speed:int = 50
@export var ON = true
@export var x_DIR = false
@export var BACK = false

var MAXHEIGHT
var MINHEIGHT

func _ready() -> void:
	if x_DIR: 
		MAXHEIGHT = position.x + maxHeight
		MINHEIGHT = position.x - maxHeight
			
	else: 
		MAXHEIGHT = position.y + maxHeight
		MINHEIGHT = position.y - maxHeight
	

func _physics_process(delta: float) -> void:
	if !ON: return
	if x_DIR: 
		position.x = move_toward(position.x,MAXHEIGHT, speed*delta)
		if BACK && position.x <= MAXHEIGHT:
			position.x = MAXHEIGHT - 1
			MAXHEIGHT = MAXHEIGHT + (maxHeight * 2)
			BACK = false
		if !BACK && position.x >= MAXHEIGHT:
			position.x = MAXHEIGHT + 1
			MAXHEIGHT = MAXHEIGHT - (maxHeight * 2)
			BACK = true
	else: 
		position.y = move_toward(position.y,MAXHEIGHT, speed*delta)
		if BACK && position.y <= MAXHEIGHT:
			position.y = MAXHEIGHT + 1
			MAXHEIGHT = MAXHEIGHT + (maxHeight * 2)
			BACK = false
		if !BACK && position.y >= MAXHEIGHT:
			position.y = MAXHEIGHT - 1
			MAXHEIGHT = MAXHEIGHT - (maxHeight * 2)
			BACK = true
