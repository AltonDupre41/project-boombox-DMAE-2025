extends CharacterBody2D

enum {NONE, PLATFORM, MENU}
@export var CONTROLMODE = PLATFORM

@export var ACCEL = 20
@export var airACCEL = 5
@export var DECEL = 20
@export var MAXSPEED = 100
@export var airSPEED = 150
@export var DASH = 500
var movement_dir:Vector2
var prev_dir

@export var JUMP = 280
@export var SUPERJUMP = 400
@export var FALLSPEED = 150
@export var GRAVITY = 20
var jumpBuffer = false
var was_on_floor = false

var can_dash = true
var isFloating = false

var jumpPwr = false
var ladderPwr = false
var dashPwr = false
var floatPwr = false
var pushPwr = false
var pullPwr = false

var gearRoute = -1

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	match CONTROLMODE:
		NONE:
			pass
		
		PLATFORM:
			movement_dir = round(Input.get_vector("Left","Right","Down","Up"))
			handleMovement(delta)
			if !$DashTimer.is_stopped():
				var value = $DashTimer.time_left/$DashTimer.wait_time
				$DashBar.value = lerp(100,0,value)
	

func _input(_event: InputEvent) -> void:
	match CONTROLMODE:
		NONE: ## For pausing player control for cutscenes
			pass
		
		PLATFORM: ## When platforming around
			if _event.is_action_pressed("Action2") && $AnimatedSprite2D/Box.is_colliding() && !$AnimatedSprite2D/Wall.is_colliding():
				if pullPwr:
					get_parent().get_parent().moveBlock(true)
				elif pushPwr:
					get_parent().get_parent().moveBlock(false)
			if _event.is_action_pressed("Action3") and ladderPwr and is_on_floor() and !$Ladder.has_overlapping_bodies():
				get_parent().get_parent().placeLadder()
				
			if _event.is_action_pressed("Action4"):
				if dashPwr:
					dash()
				elif floatPwr:
					isFloating = true
			if _event.is_action_released("Action4"):
				isFloating = false
	anim()
	

func handleMovement(_delta):
	var direction = movement_dir.x
	var accel = ACCEL
	var maxSpeed = MAXSPEED
	
	if !is_on_floor(): 
		if prev_dir != 0 && prev_dir == -direction:
			accel = airACCEL
		maxSpeed = airSPEED
		if isFloating and  get_last_motion().y >= 0: velocity.y += GRAVITY/8
		else: velocity.y += GRAVITY
		if velocity.y > maxSpeed:
			velocity.y = maxSpeed
	else:
		$JumpTimer.stop()
		
	
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * maxSpeed, accel)
	else:
		velocity.x = move_toward(velocity.x, 0, DECEL)
	
	
	if Input.is_action_just_pressed("Action1"):
		$JumpTimer.start()
		jump()
	
	was_on_floor = is_on_floor()	
	
	if !was_on_floor && is_on_floor():
		if jumpBuffer:
			jumpBuffer = false
			jump()
	
	prev_dir = direction
	
	move_and_slide()

func jump():
	if is_on_floor():
		if jumpPwr: velocity.y = -SUPERJUMP
		else: velocity.y = -JUMP
	elif !jumpBuffer:
		jumpBuffer = true
		$jumpBufferTimer.start()

func dash():
	if can_dash:
		velocity.x = DASH * movement_dir.x
		can_dash = false
		$DashTimer.start()
	else:
		print("cant dash")

func _on_jump_buffer_timer_timeout() -> void:
	jumpBuffer = false

func _on_jump_timer_timeout() -> void: ## Used for variable jump height
	if jumpPwr:
		if !Input.is_action_pressed("Action1") && velocity.y < -SUPERJUMP/3:
			velocity.y = -(SUPERJUMP/3.0)
	else:
		if !Input.is_action_pressed("Action1") && velocity.y < -JUMP/3:
			velocity.y = -(JUMP/3.0)



func anim() -> void:
	var movement_dir = round(Input.get_vector("Left","Right","Down","Up"))
	match CONTROLMODE:
		NONE:
			pass
		
		PLATFORM:
			if movement_dir.x != 0: 
				$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x) * movement_dir.x
				$AnimatedSprite2D.play("MoveRight")
			else: $AnimatedSprite2D.play("Right")
			
			if Input.is_action_pressed("Action1") && is_on_floor():
				$AnimatedSprite2D.play("Jump")
				if $AnimatedSprite2D.frame == 11:
					$AnimatedSprite2D.frame = 12
			elif $AnimatedSprite2D.animation == "Jump" && $AnimatedSprite2D.frame == 11:
				$AnimatedSprite2D.frame = 11



func _on_damage_body_entered(body: Node2D) -> void:
	get_parent().get_parent()._restart()


func _on_dash_timer_timeout() -> void:
	can_dash = true

func givePower(num, give = true):
	match num:
		0: jumpPwr = give
		1: ladderPwr = give
		2: pushPwr = give
		3: pullPwr = give
		4: 
			dashPwr = give
			$DashBar.show()
		5: floatPwr = give


func _on_damage_area_entered(area: Area2D) -> void:
	get_parent().get_parent()._restart()
